USE p1g2;
GO

--  UDF: Média das avaliações de um curso 

CREATE FUNCTION Explicacao_Online.mediaAvaliacaoCurso (@CodCurso INT)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @Media DECIMAL(3,2);

    SELECT @Media = AVG(CAST(Nota AS DECIMAL(3,2)))
    FROM Explicacao_Online.Avaliacao
    WHERE Cod_Curso = @CodCurso;

    RETURN ISNULL(@Media, 0);
END;
GO

-- Teste: Curso 1 tem notas 5 (Aluno 1) e 4 (Aluno 5) → média esperada: 4.50

SELECT Explicacao_Online.mediaAvaliacaoCurso(1) AS Media_Curso1;
GO

-- UDF: Cursos de um formador com total de inscritos

CREATE FUNCTION Explicacao_Online.cursosFormador (@IdFormador INT)
RETURNS TABLE
AS
RETURN (
    SELECT
        c.Cod_Curso,
        c.Titulo,
        c.Preco,
        COUNT(i.Id_Aluno) AS Total_Inscritos
    FROM Explicacao_Online.Curso AS c
    LEFT JOIN Explicacao_Online.Inscrever AS i ON c.Cod_Curso = i.Cod_Curso
    WHERE c.Id_Formador = @IdFormador
    GROUP BY c.Cod_Curso, c.Titulo, c.Preco
);
GO

-- Teste: Curso 1 tem 2 innscritos

SELECT * FROM Explicacao_Online.cursosFormador(2);
GO

--  UDF: Extrato financeiro de um utilizador

CREATE FUNCTION Explicacao_Online.extratoFinanceiroAluno (@IdAluno INT)
RETURNS TABLE
AS
RETURN (
    SELECT
        c.Titulo AS Nome_Curso,
        p.Data,
        p.Valor,
        p.Estado,
        p.Metodo_Pag
    FROM Explicacao_Online.Pagamento AS p
    JOIN Explicacao_Online.Curso AS c ON p.Cod_Curso = c.Cod_Curso
    WHERE p.Id_Aluno = @IdAluno
);
GO

-- Teste: Extrato do Aluno 1 (João Miguel Silva)

SELECT * FROM Explicacao_Online.extratoFinanceiroAluno(1);
GO

--  UDF: Utilizadores com dívidas pendentes 

CREATE FUNCTION Explicacao_Online.utilizadoresComDividasPendentes ()
RETURNS TABLE
AS
RETURN (
    SELECT
        u.Id_Utilizador,
        u.Nome,
        u.Email,
        COUNT(p.Id_Pagamento) AS Total_Pagamentos_Pendentes,
        SUM(p.Valor)          AS Total_Em_Divida
    FROM Explicacao_Online.Utilizador AS u
    JOIN Explicacao_Online.Pagamento  AS p ON u.Id_Utilizador = p.Id_Aluno
    WHERE p.Estado = 'Pendente'
    GROUP BY u.Id_Utilizador, u.Nome, u.Email
);
GO

-- Teste: Ana Beatriz (3) tem 1 pagamento pendente de 49.50€ 

SELECT * FROM Explicacao_Online.utilizadoresComDividasPendentes();
GO

--  UDF: Cursos mais populares com média de avaliações 

CREATE FUNCTION Explicacao_Online.cursosMaisPopulares ()
RETURNS TABLE
AS
RETURN (
    SELECT
        c.Cod_Curso,
        c.Titulo,
        c.Preco,
        u.Nome AS Nome_Formador,
        COUNT(i.Id_Aluno) AS Total_Inscritos,
        CAST(Explicacao_Online.mediaAvaliacaoCurso(c.Cod_Curso) AS DECIMAL(3,2)) AS Media_Avaliacoes
    FROM Explicacao_Online.Curso AS c
    JOIN Explicacao_Online.Utilizador AS u ON c.Id_Formador = u.Id_Utilizador
    LEFT JOIN Explicacao_Online.Inscrever AS i ON c.Cod_Curso = i.Cod_Curso
    GROUP BY c.Cod_Curso, c.Titulo, c.Preco, u.Nome
);
GO

-- Teste: Cursos ordenados por média de avaliações (asc) e total de inscritos (desc) 

SELECT * FROM Explicacao_Online.cursosMaisPopulares()
ORDER BY Media_Avaliacoes ASC, Total_Inscritos DESC;
GO

-- SP: Registar inscrição e gerar pagamento automaticamente (Alunos pagam o preço do curso e formadores inscrevem-se no próprio curso a custo zero)

CREATE PROCEDURE Explicacao_Online.registarInscricao
    @IdUtilizador INT,
    @CodCurso     INT,
    @MetodoPag    NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Verificar inscrição duplicada
        IF EXISTS (
            SELECT 1 FROM Explicacao_Online.Inscrever
            WHERE Id_Aluno = @IdUtilizador AND Cod_Curso = @CodCurso
        )
        BEGIN
            RAISERROR('O utilizador já está inscrito neste curso.', 16, 1);
            RETURN;
        END

        -- Obter preço e formador do curso
        DECLARE @PrecoCurso     DECIMAL(10,2);
        DECLARE @IdFormadorCurso INT;

        SELECT @PrecoCurso = Preco, @IdFormadorCurso = Id_Formador
        FROM Explicacao_Online.Curso
        WHERE Cod_Curso = @CodCurso;

        IF @PrecoCurso IS NULL
        BEGIN
            RAISERROR('Curso inexistente.', 16, 1);
            RETURN;
        END

        -- Verificar que o utilizador existe como Aluno ou Formador
        IF NOT EXISTS (
            SELECT 1 FROM Explicacao_Online.Aluno   WHERE Id_Utilizador = @IdUtilizador
            UNION
            SELECT 1 FROM Explicacao_Online.Formador WHERE Id_Utilizador = @IdUtilizador
        )
        BEGIN
            RAISERROR('Utilizador não encontrado como Aluno ou Formador.', 16, 1);
            RETURN;
        END

        -- Formador do próprio curso: gratuito e imediatamente concluído
        DECLARE @ValorPag  DECIMAL(10,2);
        DECLARE @EstadoPag NVARCHAR(20);

        IF @IdUtilizador = @IdFormadorCurso
        BEGIN
            SET @ValorPag  = 0.00;
            SET @EstadoPag = 'Concluído';
        END
        ELSE
        BEGIN
            SET @ValorPag  = @PrecoCurso;
            SET @EstadoPag = 'Pendente';
        END

        BEGIN TRAN;

            INSERT INTO Explicacao_Online.Inscrever (Id_Aluno, Cod_Curso, Data)
            VALUES (@IdUtilizador, @CodCurso, GETDATE());

            DECLARE @NovoIdPagamento INT;
            SELECT @NovoIdPagamento = ISNULL(MAX(Id_Pagamento), 0) + 1
            FROM Explicacao_Online.Pagamento;

            INSERT INTO Explicacao_Online.Pagamento
                (Id_Pagamento, Data, Valor, Estado, Cod_Curso, Id_Aluno, Metodo_Pag)
            VALUES
                (@NovoIdPagamento, GETDATE(), @ValorPag, @EstadoPag, @CodCurso, @IdUtilizador, @MetodoPag);

        COMMIT TRAN;
        PRINT 'Sucesso: Inscrição e pagamento gerados.';

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- Teste: Tiago (Aluno 5) inscreve-se no Curso 2 (preço: 49.50€) usando PayPal

EXEC Explicacao_Online.registarInscricao @IdUtilizador = 5, @CodCurso = 2, @MetodoPag = 'PayPal';

SELECT * FROM Explicacao_Online.Inscrever WHERE Id_Aluno = 5 AND Cod_Curso = 2;
SELECT * FROM Explicacao_Online.Pagamento WHERE Id_Aluno = 5 AND Cod_Curso = 2;
GO

-- SP: Processar pagamento (Pendente para Concluído)

ALTER PROCEDURE Explicacao_Online.processarPagamento
    @IdPagamento INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN

            -- Verificar se o pagamento existe
            IF NOT EXISTS (
                SELECT 1 FROM Explicacao_Online.Pagamento 
                WHERE Id_Pagamento = @IdPagamento
            )
            BEGIN
                RAISERROR('Pagamento não encontrado.', 16, 1);
                ROLLBACK TRAN;
                RETURN;
            END

            -- Verificar se já está concluído
            IF EXISTS (
                SELECT 1 FROM Explicacao_Online.Pagamento 
                WHERE Id_Pagamento = @IdPagamento 
                AND Estado = 'Concluído'
            )
            BEGIN
                RAISERROR('Este pagamento já se encontra concluído.', 16, 1);
                ROLLBACK TRAN;
                RETURN;
            END

            -- Atualizar o estado
            UPDATE Explicacao_Online.Pagamento
            SET Estado = 'Concluído'
            WHERE Id_Pagamento = @IdPagamento;

        COMMIT TRAN;
        PRINT 'Sucesso: Pagamento processado.';

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- Teste: Processar o pagamento pendente do Tiago (Aluno 5) no Curso 2

DECLARE @IdPagTiago INT;
SELECT @IdPagTiago = Id_Pagamento
FROM Explicacao_Online.Pagamento
WHERE Id_Aluno = 5 AND Cod_Curso = 2;

SELECT * FROM Explicacao_Online.Pagamento WHERE Id_Pagamento = @IdPagTiago; -- Antes

EXEC Explicacao_Online.processarPagamento @IdPagamento = @IdPagTiago;

SELECT * FROM Explicacao_Online.Pagamento WHERE Id_Pagamento = @IdPagTiago; -- Depois
GO

-- SP: Cancelar inscrição (Só é possível se o pagamento ainda estiver Pendente)

CREATE PROCEDURE Explicacao_Online.cancelarInscricao
    @IdUtilizador INT,
    @CodCurso     INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Explicacao_Online.Inscrever
            WHERE Id_Aluno = @IdUtilizador AND Cod_Curso = @CodCurso
        )
        BEGIN
            RAISERROR('Inscrição não encontrada.', 16, 1);
            RETURN;
        END

        IF EXISTS (
            SELECT 1 FROM Explicacao_Online.Pagamento
            WHERE Id_Aluno = @IdUtilizador
              AND Cod_Curso = @CodCurso
              AND Estado = 'Concluído'
        )
        BEGIN
            RAISERROR('Não é possível cancelar uma inscrição com pagamento já concluído.', 16, 1);
            RETURN;
        END

        BEGIN TRAN;

            UPDATE Explicacao_Online.Pagamento
            SET Estado = 'Cancelado'
            WHERE Id_Aluno  = @IdUtilizador
              AND Cod_Curso = @CodCurso
              AND Estado    = 'Pendente';

        COMMIT TRAN;
        PRINT 'Sucesso: Inscrição cancelada e pagamento atualizado.';

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO

-- 1º Teste: Ana Beatriz (Aluno 3) tem um pagamento pendente no Curso 2, logo deve conseguir cancelar a inscrição e o estado do pagamento deve passar a Cancelado

SELECT * FROM Explicacao_Online.Pagamento  WHERE Id_Aluno = 3 AND Cod_Curso = 2; -- Antes

EXEC Explicacao_Online.cancelarInscricao @IdUtilizador = 3, @CodCurso = 2;

SELECT * FROM Explicacao_Online.Pagamento  WHERE Id_Aluno = 3 AND Cod_Curso = 2; -- Depois
Go

-- 2º Teste: João Miguel Silva (Aluno 1) tem um pagamento concluído no Curso 1, logo não deve conseguir cancelar a inscrição

EXEC Explicacao_Online.cancelarInscricao @IdUtilizador = 1, @CodCurso = 1;
GO

-- Trigger: Bloquear nova inscrição se o utilizador tiver dívidas

CREATE TRIGGER Explicacao_Online.bloquearInscricaoPessoaADever
ON Explicacao_Online.Inscrever
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        JOIN Explicacao_Online.Pagamento AS p ON i.Id_Aluno = p.Id_Aluno
        WHERE p.Estado = 'Pendente'
          AND p.Cod_Curso != i.Cod_Curso
    )
    BEGIN
        RAISERROR ('Operação Recusada: O utilizador possui pagamentos pendentes e não pode realizar novas inscrições.', 16, 1);
        ROLLBACK TRAN;
    END
END;
GO

-- Teste: Tentar inscrever um utilizador (criado pelos formulários) com dívidas pendentes e verificar que é bloqueado

-- Trigger: Validar condições para avaliar um curso (O utilizador tem de estar inscrito e o pagamento tem de estar concluído)

CREATE TRIGGER Explicacao_Online.validarCondicoesAvaliacao
ON Explicacao_Online.Avaliacao
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IdAluno INT, @CodCurso INT;
    SELECT @IdAluno = Id_Aluno, @CodCurso = Cod_Curso FROM inserted;

    IF NOT EXISTS (
        SELECT 1 FROM Explicacao_Online.Inscrever
        WHERE Id_Aluno = @IdAluno AND Cod_Curso = @CodCurso
    )
    BEGIN
        RAISERROR('Operação Bloqueada: O utilizador não está inscrito neste curso.', 16, 1);
        ROLLBACK TRAN;
        RETURN;
    END

    IF NOT EXISTS (
        SELECT 1 FROM Explicacao_Online.Pagamento
        WHERE Id_Aluno  = @IdAluno
          AND Cod_Curso = @CodCurso
          AND Estado    = 'Concluído'
    )
    BEGIN
        RAISERROR('Operação Bloqueada: Não é possível avaliar sem pagamento concluído.', 16, 1);
        ROLLBACK TRAN;
        RETURN;
    END
END;
GO

-- Teste: Tentar inscrever um utilizador (criado pelos formulários) que não está inscrito ou cujo pagamento não está concluído e verificar que é bloqueado

--  Trigger: Impedir que o formador avalie o seu próprio curso

CREATE TRIGGER Explicacao_Online.impedirAutoAvaliacao
ON Explicacao_Online.Avaliacao
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        JOIN Explicacao_Online.Curso AS c ON i.Cod_Curso = c.Cod_Curso
        WHERE i.Id_Aluno = c.Id_Formador
    )
    BEGIN
        RAISERROR('O formador de um curso não tem permissão para avaliar o seu próprio conteúdo.', 16, 1);
        ROLLBACK TRAN;
    END
END;
GO

-- Teste: Tentar inscrever um utilizador (criado pelos formulários) que é formador do curso a avaliar o próprio curso e verificar que é bloqueado

-- Trigger: Gerir eliminação de utilizadores 

ALTER TRIGGER Explicacao_Online.gerirEliminacaoUtilizador
ON Explicacao_Online.Utilizador
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Bloquear se tiver pagamentos pendentes
    IF EXISTS (
        SELECT 1
        FROM deleted AS d
        JOIN Explicacao_Online.Pagamento AS p ON d.Id_Utilizador = p.Id_Aluno
        WHERE p.Estado = 'Pendente'
    )
    BEGIN
        RAISERROR('Operação Bloqueada: Não é possível eliminar um utilizador com pagamentos pendentes.', 16, 1);
        RETURN;
    END

    -- Bloquear apenas se houver alunos inscritos com pagamento ainda Pendente
    IF EXISTS (
        SELECT 1 FROM Explicacao_Online.Curso c
        JOIN Explicacao_Online.Inscrever i ON c.Cod_Curso = i.Cod_Curso
        JOIN Explicacao_Online.Pagamento p ON i.Id_Aluno = p.Id_Aluno 
                                          AND p.Cod_Curso = c.Cod_Curso
        WHERE c.Id_Formador IN (SELECT Id_Utilizador FROM deleted)
          AND p.Estado = 'Pendente'
    )
    BEGIN
        RAISERROR('Como tens um aluno associado ao curso, não é possível apagar o curso nem te remover.', 16, 1);
        RETURN;
    END

    -- Se tiver cursos mas sem alunos, elimina
    IF EXISTS (
        SELECT 1 FROM Explicacao_Online.Curso
        WHERE Id_Formador IN (SELECT Id_Utilizador FROM deleted)
    )
    BEGIN
        -- Apaga pagamentos do curso antes
        DELETE FROM Explicacao_Online.Pagamento
        WHERE Cod_Curso IN (
            SELECT Cod_Curso FROM Explicacao_Online.Curso
            WHERE Id_Formador IN (SELECT Id_Utilizador FROM deleted)
        );

        DELETE FROM Explicacao_Online.Curso
        WHERE Id_Formador IN (SELECT Id_Utilizador FROM deleted);

        PRINT 'Formador tinha um curso associado! Formador e curso eliminados corretamente!';
    END

    DELETE FROM Explicacao_Online.Pagamento
    WHERE Id_Aluno IN (SELECT Id_Utilizador FROM deleted);

    DELETE FROM Explicacao_Online.Avaliacao
    WHERE Id_Aluno IN (SELECT Id_Utilizador FROM deleted);

    DELETE FROM Explicacao_Online.Utilizador
    WHERE Id_Utilizador IN (SELECT Id_Utilizador FROM deleted);
END;
GO

-- 1º Teste: Tentar eliminar um utilizador (criado pelos formulários) com pagamentos pendentes e verificar que não dá para eliminar
-- 2º Teste: Tentar eliminar um formador com curso associado e alunos inscritos e verificar que é bloqueado
-- 3º Teste: Tentar eliminar um formador com curso associado mas sem alunos e verificar que o curso e o formador são eliminados corretamente

-- Trigger: Remover inscrição automaticamente da lista se esta for cancelada 

CREATE TRIGGER Explicacao_Online.cancelarInscricaoAoPagarCancelado
ON Explicacao_Online.Pagamento
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM inserted WHERE Estado = 'Cancelado')
    BEGIN
        DELETE FROM Explicacao_Online.Inscrever
        WHERE Id_Aluno IN (SELECT Id_Aluno FROM inserted WHERE Estado = 'Cancelado')
          AND Cod_Curso IN (SELECT Cod_Curso FROM inserted WHERE Estado = 'Cancelado');
    END
END;
GO

-- Teste: Tentar cancelar a inscrição de um utilizador (criado pelos formulários)

-- Trigger: Impedir que uma instituição seja eliminada se tiver alunos associados

CREATE TRIGGER Explicacao_Online.impedirEliminarInstituicaoComAlunos
ON Explicacao_Online.Instituicao
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM deleted d
        JOIN Explicacao_Online.Aluno a ON d.Id_Instituicao = a.Id_Instituicao
    )
    BEGIN
        RAISERROR('Operação Bloqueada: Não é possível eliminar uma instituição que tem alunos associados.', 16, 1);
        RETURN;
    END

    -- Se não tiver alunos, elimina normalmente
    DELETE FROM Explicacao_Online.Instituicao
    WHERE Id_Instituicao IN (SELECT Id_Instituicao FROM deleted);
END;
GO

-- Teste: Tentar eliminar uma instituição (criada pelos formulários) que tem alunos associados e verificar que é bloqueado  