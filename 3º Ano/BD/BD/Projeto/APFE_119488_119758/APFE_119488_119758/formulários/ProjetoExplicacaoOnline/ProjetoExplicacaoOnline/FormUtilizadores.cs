using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ProjetoExplicacaoOnline
{
    public partial class FormUtilizadores : Form
    {
        string connectionString = "Server=192.168.182.10;Database=p1g2;User Id=p1g2;Password=1234;";
        private bool modoEdicao = false;

        public FormUtilizadores(string tipoInicial = "")
        {
            InitializeComponent();
        }

        private void FormUtilizadores_Load(object sender, EventArgs e)
        {
            CarregarInstituicoes();
            CarregarUtilizadores();
        
        }

        private void CarregarUtilizadores()
        {
            listBoxUtilizadores.Items.Clear();

            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                try
                {
                    conexao.Open();
                    string query = "SELECT Id_Utilizador, Nome FROM Explicacao_Online.Utilizador";

                    using (SqlCommand comando = new SqlCommand(query, conexao))
                    using (SqlDataReader reader = comando.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string id = reader["Id_Utilizador"].ToString();
                            string nome = reader["Nome"].ToString();

                            listBoxUtilizadores.Items.Add($"{id} - {nome}");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar utilizadores: " + ex.Message);
                }
            }
            if (listBoxUtilizadores.Items.Count > 0)
                listBoxUtilizadores.SelectedIndex = listBoxUtilizadores.Items.Count - 1;
        }

        private void btnAdd_Click_1(object sender, EventArgs e)
        {
            txtNome.Clear();
            txtEmail.Clear();
            txtEspecialidade.Clear();
            txtBiografia.Clear();
            cmbTipoUtilizador.SelectedIndex = -1;
            cmbInstituicao.SelectedIndex = -1;
            dtpDataReg.Value = DateTime.Today;
            listBoxUtilizadores.SelectedIndex = -1;
            SetCamposEditaveis(true);
            CarregarProximoIdUtilizador(); 
            panelDetalhes.Visible = true;
            listBoxUtilizadores.Size = new System.Drawing.Size(160, 400);
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
            modoEdicao = false;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (cmbTipoUtilizador.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona o tipo de utilizador.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string tipo = cmbTipoUtilizador.SelectedItem.ToString();
            if (!ValidarCampos(tipo)) return;

            if (modoEdicao)
            {
                GuardarEdicao(tipo);
            }
            else
            {
                InserirNovo(tipo);
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            panelDetalhes.Visible = false;
            listBoxUtilizadores.SelectedIndex = -1;
            listBoxUtilizadores.Size = new System.Drawing.Size(700, 400);
            listBoxUtilizadores.Location = new System.Drawing.Point(0, 0);
            modoEdicao = false;
            btnEdit.Text = "Editar";
            btnGuardar.Visible = false;
            btnCancelar.Visible = false;
        }

        private void listBoxUtilizadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxUtilizadores.SelectedIndex == -1) return;

            string idSelecionado = listBoxUtilizadores.SelectedItem.ToString().Split('-')[0].Trim();

            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                try
                {
                    conexao.Open();

                    string query = @"
                SELECT 
                    u.Id_Utilizador, u.Nome, u.Email, u.Data_Reg,
                    a.Data_Nasc, a.Id_Instituicao,
                    f.Especialidade, f.Biografia,
                    CASE 
                        WHEN a.Id_Utilizador IS NOT NULL THEN 'Aluno'
                        WHEN f.Id_Utilizador IS NOT NULL THEN 'Formador'
                        ELSE ''
                    END AS Tipo
                FROM Explicacao_Online.Utilizador u
                LEFT JOIN Explicacao_Online.Aluno a ON u.Id_Utilizador = a.Id_Utilizador
                LEFT JOIN Explicacao_Online.Formador f ON u.Id_Utilizador = f.Id_Utilizador
                WHERE u.Id_Utilizador = @id";

                    SqlCommand cmd = new SqlCommand(query, conexao);
                    cmd.Parameters.AddWithValue("@id", idSelecionado);
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        txtId.Text = r["Id_Utilizador"].ToString();
                        txtNome.Text = r["Nome"].ToString();
                        txtEmail.Text = r["Email"].ToString();
                        if (r["Data_Reg"] != DBNull.Value)
                            dtpDataReg.Value = Convert.ToDateTime(r["Data_Reg"]);

                        string tipo = r["Tipo"].ToString();
                        cmbTipoUtilizador.SelectedItem = tipo;

                        if (tipo == "Aluno")
                        {
                            if (r["Data_Nasc"] != DBNull.Value)
                                dtpDataNasc.Value = Convert.ToDateTime(r["Data_Nasc"]);

                            int idInst = Convert.ToInt32(r["Id_Instituicao"]);
                            for (int i = 0; i < cmbInstituicao.Items.Count; i++)
                            {
                                if (((KeyValuePair<int, string>)cmbInstituicao.Items[i]).Key == idInst)
                                { cmbInstituicao.SelectedIndex = i; break; }
                            }
                        }
                        else if (tipo == "Formador")
                        {
                            txtEspecialidade.Text = r["Especialidade"] != DBNull.Value ? r["Especialidade"].ToString() : "";
                            txtBiografia.Text = r["Biografia"] != DBNull.Value ? r["Biografia"].ToString() : "";
                        }
                    }
                    r.Close();

                    SetCamposEditaveis(false);
                    panelDetalhes.Visible = true;
                    listBoxUtilizadores.Size = new System.Drawing.Size(160, 400);
                    btnGuardar.Visible = false;
                    btnCancelar.Visible = false;
                    modoEdicao = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar detalhes: " + ex.Message);
                }
            }
        }

        private void CarregarInstituicoes()
        {
            cmbInstituicao.Items.Clear();
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                try
                {
                    conexao.Open();
                    string query = "SELECT Id_Instituicao, Nome FROM Explicacao_Online.Instituicao";
                    SqlCommand comando = new SqlCommand(query, conexao);
                    SqlDataReader leitor = comando.ExecuteReader();
                    while (leitor.Read())
                    {
                        cmbInstituicao.Items.Add(new KeyValuePair<int, string>(
                            Convert.ToInt32(leitor["Id_Instituicao"]),
                            leitor["Nome"].ToString()
                        ));
                    }
                    cmbInstituicao.DisplayMember = "Value";
                    cmbInstituicao.ValueMember = "Key";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar instituições: " + ex.Message);
                }
            }
        }


        private void InserirNovo(string tipo)
        {
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                try
                {
                    conexao.Open();
                    SqlTransaction transacao = conexao.BeginTransaction();
                    try
                    {
                        string queryUtilizador = @"INSERT INTO Explicacao_Online.Utilizador 
                    (Id_Utilizador, Nome, Email, Senha, Data_Reg) 
                    VALUES (@id, @nome, @email, @senha, @data)";
                        SqlCommand cmdUtil = new SqlCommand(queryUtilizador, conexao, transacao);
                        cmdUtil.Parameters.AddWithValue("@id", int.Parse(txtId.Text));
                        cmdUtil.Parameters.AddWithValue("@nome", txtNome.Text.Trim());
                        cmdUtil.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        cmdUtil.Parameters.AddWithValue("@senha", "senha123");
                        cmdUtil.Parameters.AddWithValue("@data", dtpDataReg.Value.Date);
                        cmdUtil.ExecuteNonQuery();

                        if (tipo == "Aluno")
                        {
                            int idInstituicao = ((KeyValuePair<int, string>)cmbInstituicao.SelectedItem).Key;
                            string queryAluno = @"INSERT INTO Explicacao_Online.Aluno 
                        (Id_Utilizador, Data_Nasc, Data_Ades, Id_Instituicao) 
                        VALUES (@id, @dataNasc, @dataAdes, @idInst)";
                            SqlCommand cmdAluno = new SqlCommand(queryAluno, conexao, transacao);
                            cmdAluno.Parameters.AddWithValue("@id", int.Parse(txtId.Text));
                            cmdAluno.Parameters.AddWithValue("@dataNasc", dtpDataNasc.Value.Date);
                            cmdAluno.Parameters.AddWithValue("@dataAdes", DateTime.Today);
                            cmdAluno.Parameters.AddWithValue("@idInst", idInstituicao);
                            cmdAluno.ExecuteNonQuery();
                        }
                        else
                        {
                            string queryFormador = @"INSERT INTO Explicacao_Online.Formador 
                        (Id_Utilizador, Especialidade, Biografia) 
                        VALUES (@id, @esp, @bio)";
                            SqlCommand cmdFormador = new SqlCommand(queryFormador, conexao, transacao);
                            cmdFormador.Parameters.AddWithValue("@id", int.Parse(txtId.Text));
                            cmdFormador.Parameters.AddWithValue("@esp", string.IsNullOrWhiteSpace(txtEspecialidade.Text) ? (object)DBNull.Value : txtEspecialidade.Text.Trim());
                            cmdFormador.Parameters.AddWithValue("@bio", string.IsNullOrWhiteSpace(txtBiografia.Text) ? (object)DBNull.Value : txtBiografia.Text.Trim());
                            cmdFormador.ExecuteNonQuery();
                        }

                        transacao.Commit();
                        MessageBox.Show($"{tipo} adicionado com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        panelDetalhes.Visible = false;
                        CarregarUtilizadores();
                    }
                    catch (Exception exInner)
                    {
                        transacao.Rollback();
                        MessageBox.Show("Erro ao inserir: " + exInner.Message);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro de ligação: " + ex.Message);
                }
            }
        }

        private void GuardarEdicao(string tipo)
        {
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                try
                {
                    conexao.Open();
                    SqlTransaction transacao = conexao.BeginTransaction();
                    try
                    {
                        string queryUtil = @"UPDATE Explicacao_Online.Utilizador 
                    SET Nome = @nome, Email = @email, Data_Reg = @data 
                    WHERE Id_Utilizador = @id";
                        SqlCommand cmdUtil = new SqlCommand(queryUtil, conexao, transacao);
                        cmdUtil.Parameters.AddWithValue("@id", int.Parse(txtId.Text));
                        cmdUtil.Parameters.AddWithValue("@nome", txtNome.Text.Trim());
                        cmdUtil.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        cmdUtil.Parameters.AddWithValue("@data", dtpDataReg.Value.Date);
                        cmdUtil.ExecuteNonQuery();

                        if (tipo == "Aluno")
                        {
                            int idInstituicao = ((KeyValuePair<int, string>)cmbInstituicao.SelectedItem).Key;
                            string queryAluno = @"UPDATE Explicacao_Online.Aluno 
                        SET Data_Nasc = @dataNasc, Id_Instituicao = @idInst 
                        WHERE Id_Utilizador = @id";
                            SqlCommand cmdAluno = new SqlCommand(queryAluno, conexao, transacao);
                            cmdAluno.Parameters.AddWithValue("@id", int.Parse(txtId.Text));
                            cmdAluno.Parameters.AddWithValue("@dataNasc", dtpDataNasc.Value.Date);
                            cmdAluno.Parameters.AddWithValue("@idInst", idInstituicao);
                            cmdAluno.ExecuteNonQuery();
                        }
                        else
                        {
                            string queryFormador = @"UPDATE Explicacao_Online.Formador 
                        SET Especialidade = @esp, Biografia = @bio 
                        WHERE Id_Utilizador = @id";
                            SqlCommand cmdFormador = new SqlCommand(queryFormador, conexao, transacao);
                            cmdFormador.Parameters.AddWithValue("@id", int.Parse(txtId.Text));
                            cmdFormador.Parameters.AddWithValue("@esp", string.IsNullOrWhiteSpace(txtEspecialidade.Text) ? (object)DBNull.Value : txtEspecialidade.Text.Trim());
                            cmdFormador.Parameters.AddWithValue("@bio", string.IsNullOrWhiteSpace(txtBiografia.Text) ? (object)DBNull.Value : txtBiografia.Text.Trim());
                            cmdFormador.ExecuteNonQuery();
                        }

                        transacao.Commit();
                        MessageBox.Show("Dados atualizados com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        panelDetalhes.Visible = false;
                        modoEdicao = false;
                        btnEdit.Text = "Editar";
                        CarregarUtilizadores();
                    }
                    catch (Exception exInner)
                    {
                        transacao.Rollback();
                        MessageBox.Show("Erro ao atualizar: " + exInner.Message);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro de ligação: " + ex.Message);
                }
            }
        }

        private void CarregarProximoIdUtilizador()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT ISNULL(MAX(Id_Utilizador), 0) + 1 FROM Explicacao_Online.Utilizador";
                    SqlCommand cmd = new SqlCommand(query, con);
                    txtId.Text = cmd.ExecuteScalar().ToString();
                    txtId.ReadOnly = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao gerar ID: " + ex.Message);
                }
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            // Verifica se há alguém selecionado na lista
            if (listBoxUtilizadores.SelectedIndex == -1 || !panelDetalhes.Visible)
            {
                MessageBox.Show("Seleciona primeiro um utilizador da lista.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string nomeUtilizador = txtNome.Text;
            var confirm = MessageBox.Show(
                $"Tens a certeza que queres eliminar '{nomeUtilizador}'?\nEsta ação irá eliminar também os seus pagamentos e inscrições.",
                "Confirmar Eliminação",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning);

            if (confirm != DialogResult.Yes) return;

            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                try
                {
                    conexao.Open();
                    SqlTransaction transacao = conexao.BeginTransaction();
                    try
                    {
                        int id = int.Parse(txtId.Text);

                        bool formadorComCurso = false;
                        string qVerificar = @"SELECT COUNT(*) FROM Explicacao_Online.Curso 
                                                WHERE Id_Formador = @id";
                        SqlCommand cmdVerificar = new SqlCommand(qVerificar, conexao, transacao);
                        cmdVerificar.Parameters.AddWithValue("@id", id);
                        formadorComCurso = (int)cmdVerificar.ExecuteScalar() > 0;

                        string qUtil = "DELETE FROM Explicacao_Online.Utilizador WHERE Id_Utilizador = @id";
                        SqlCommand cmdUtil = new SqlCommand(qUtil, conexao, transacao);
                        cmdUtil.Parameters.AddWithValue("@id", id);
                        cmdUtil.ExecuteNonQuery();

                        transacao.Commit();

                        string mensagem = formadorComCurso
                            ? "Formador tinha um curso associado! Formador e curso eliminados corretamente!"
                            : "Utilizador eliminado com sucesso!";

                        MessageBox.Show(mensagem, "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        panelDetalhes.Visible = false;
                        listBoxUtilizadores.Size = new System.Drawing.Size(700, 400);
                        btnGuardar.Visible = false;
                        btnCancelar.Visible = false;
                        CarregarUtilizadores();
                    }
                    catch (Exception exInner)
                    {
                        transacao.Rollback();

                        string mensagem = exInner.Message;
                        if (mensagem.Contains("The transaction ended in the trigger"))
                            mensagem = mensagem.Split('\n')[0].Trim();

                        MessageBox.Show(mensagem, "Aviso do Sistema",
                            MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro de ligação: " + ex.Message, "Erro",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnVerDevedores_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"SELECT Nome, Email, Total_Pagamentos_Pendentes, Total_Em_Divida
                             FROM Explicacao_Online.utilizadoresComDividasPendentes()
                             ORDER BY Total_Em_Divida DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();

                    string resultado = "UTILIZADORES COM DÍVIDAS\n" + new string('-', 50) + "\n";
                    bool temDevedores = false;
                    while (r.Read())
                    {
                        temDevedores = true;
                        resultado += $"{r["Nome"]} ({r["Email"]}) | " +
                                     $"Pagamentos pendentes: {r["Total_Pagamentos_Pendentes"]} | " +
                                     $"Total em dívida: {r["Total_Em_Divida"]}€\n";
                    }

                    if (!temDevedores)
                        resultado += "Não existem utilizadores com dívidas pendentes.";

                    MessageBox.Show(resultado, "Utilizadores com Dívidas",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro: " + ex.Message);
                }
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (listBoxUtilizadores.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona primeiro um utilizador da lista.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            SetCamposEditaveis(true);
            txtId.ReadOnly = true;
            panelDetalhes.Visible = true;
            modoEdicao = true;
            btnEdit.Text = "Editar";
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
        }

        private void cmbTipoUtilizador_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool isAluno = cmbTipoUtilizador.SelectedItem?.ToString() == "Aluno";

            lblDataNasc.Visible = isAluno;
            dtpDataNasc.Visible = isAluno;
            lblInstituicao.Visible = isAluno;
            cmbInstituicao.Visible = isAluno;
            lblEspecialidade.Visible = !isAluno && cmbTipoUtilizador.SelectedIndex != -1;
            txtEspecialidade.Visible = !isAluno && cmbTipoUtilizador.SelectedIndex != -1;
            lblBiografia.Visible = !isAluno && cmbTipoUtilizador.SelectedIndex != -1;
            txtBiografia.Visible = !isAluno && cmbTipoUtilizador.SelectedIndex != -1;

            if (isAluno && cmbInstituicao.Items.Count == 0)
                CarregarInstituicoes();
        }


        private bool ValidarCampos(string tipo)
        {
            string nome = txtNome.Text.Trim();
            if (string.IsNullOrWhiteSpace(nome))
            {
                MessageBox.Show("O Nome não pode estar vazio.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNome.Focus();
                return false;
            }
            if (nome.Length > 100)
            {
                MessageBox.Show("O Nome não pode ter mais de 100 caracteres.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNome.Focus();
                return false;
            }
            string email = txtEmail.Text.Trim();
            if (string.IsNullOrWhiteSpace(email))
            {
                MessageBox.Show("O Email não pode estar vazio.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtEmail.Focus();
                return false;
            }
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                if (addr.Address != email)
                {
                    MessageBox.Show("O Email introduzido não é válido.", "Erro de Validação",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtEmail.Focus();
                    return false;
                }
            }
            catch
            {
                MessageBox.Show("O Email introduzido não é válido (ex: nome@dominio.com).", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtEmail.Focus();
                return false;
            }
            if (email.Length > 100)
            {
                MessageBox.Show("O Email não pode ter mais de 100 caracteres.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtEmail.Focus();
                return false;
            }

            // Verificar se o email já existe 
            using (SqlConnection conEmail = new SqlConnection(connectionString))
            {
                try
                {
                    conEmail.Open();
                    string queryEmail = @"SELECT COUNT(*) FROM Explicacao_Online.Utilizador 
                              WHERE Email = @email AND Id_Utilizador != @id";
                    SqlCommand cmdEmail = new SqlCommand(queryEmail, conEmail);
                    cmdEmail.Parameters.AddWithValue("@email", email);
                    cmdEmail.Parameters.AddWithValue("@id", string.IsNullOrEmpty(txtId.Text) ? 0 : int.Parse(txtId.Text));
                    int count = (int)cmdEmail.ExecuteScalar();
                    if (count > 0)
                    {
                        MessageBox.Show("Este email já está registado noutro utilizador.", "Erro de Validação",
                            MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        txtEmail.Focus();
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao verificar email: " + ex.Message);
                    return false;
                }
            }
            if (dtpDataReg.Value.Date > DateTime.Today)
            {
                MessageBox.Show("A Data de Registo não pode ser no futuro.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (tipo == "Aluno")
            {
                if (dtpDataNasc.Value.Date >= DateTime.Today)
                {
                    MessageBox.Show("A Data de Nascimento tem de ser no passado.", "Erro de Validação",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                int idade = DateTime.Today.Year - dtpDataNasc.Value.Year;
                if (dtpDataNasc.Value.Date > DateTime.Today.AddYears(-idade)) idade--;
                if (idade < 5)
                {
                    MessageBox.Show("O aluno tem de ter pelo menos 5 anos.", "Erro de Validação",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                if (cmbInstituicao.SelectedIndex == -1)
                {
                    MessageBox.Show("Seleciona a instituição do aluno.", "Erro de Validação",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
            }
            if (tipo == "Formador")
            {
                if (txtEspecialidade.Text.Trim().Length > 100)
                {
                    MessageBox.Show("A Especialidade não pode ter mais de 100 caracteres.", "Erro de Validação",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtEspecialidade.Focus();
                    return false;
                }
                if (txtBiografia.Text.Trim().Length > 300)
                {
                    MessageBox.Show("A Biografia não pode ter mais de 300 caracteres.", "Erro de Validação",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtBiografia.Focus();
                    return false;
                }
            }
            return true;
        }

        private void SetCamposEditaveis(bool editavel)
        {
            txtNome.ReadOnly = !editavel;
            txtEmail.ReadOnly = !editavel;
            dtpDataReg.Enabled = editavel;
            cmbTipoUtilizador.Enabled = editavel;
            dtpDataNasc.Enabled = editavel;
            cmbInstituicao.Enabled = editavel;
            txtEspecialidade.ReadOnly = !editavel;
            txtBiografia.ReadOnly = !editavel;
            txtId.ReadOnly = true;
        }


    }
}