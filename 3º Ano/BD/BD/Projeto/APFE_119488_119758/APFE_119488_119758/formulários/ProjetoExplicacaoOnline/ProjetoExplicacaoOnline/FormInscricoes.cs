using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ProjetoExplicacaoOnline
{
    public partial class FormInscricoes : Form
    {
        string connectionString = "Server=192.168.182.10;Database=p1g2;User Id=p1g2;Password=1234;";

        public FormInscricoes()
        {
            InitializeComponent();
        }

        private void FormInscricoes_Load(object sender, EventArgs e)
        {
            CarregarUtilizadores();
            CarregarCursos();
            CarregarInscricoes();
        }

        private void CarregarUtilizadores()
        {
            cmbUtilizador.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    // Procura todos os utilizadores que são Aluno ou Formador
                    string query = @"
                        SELECT u.Id_Utilizador, u.Nome,
                            CASE 
                                WHEN a.Id_Utilizador IS NOT NULL THEN 'Aluno'
                                WHEN f.Id_Utilizador IS NOT NULL THEN 'Formador'
                            END AS Tipo
                        FROM Explicacao_Online.Utilizador u
                        LEFT JOIN Explicacao_Online.Aluno a ON u.Id_Utilizador = a.Id_Utilizador
                        LEFT JOIN Explicacao_Online.Formador f ON u.Id_Utilizador = f.Id_Utilizador
                        WHERE a.Id_Utilizador IS NOT NULL OR f.Id_Utilizador IS NOT NULL";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        cmbUtilizador.Items.Add(new KeyValuePair<int, string>(
                            Convert.ToInt32(r["Id_Utilizador"]),
                            $"{r["Id_Utilizador"]} - {r["Nome"]} ({r["Tipo"]})"));
                    cmbUtilizador.DisplayMember = "Value";
                    cmbUtilizador.ValueMember = "Key";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar utilizadores: " + ex.Message);
                }
            }
        }

        private void CarregarCursos()
        {
            cmbCurso.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT Cod_Curso, Titulo, Preco, Id_Formador FROM Explicacao_Online.Curso";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        cmbCurso.Items.Add(new KeyValuePair<int, string>(
                            Convert.ToInt32(r["Cod_Curso"]),
                            $"{r["Cod_Curso"]} - {r["Titulo"]} ({r["Preco"]}€)"));
                    cmbCurso.DisplayMember = "Value";
                    cmbCurso.ValueMember = "Key";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar cursos: " + ex.Message);
                }
            }
        }

        private void CarregarInscricoes()
        {
            listBoxInscricoes.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT u.Nome, c.Titulo, i.Data
                        FROM Explicacao_Online.Inscrever i
                        JOIN Explicacao_Online.Utilizador u ON i.Id_Aluno = u.Id_Utilizador
                        JOIN Explicacao_Online.Curso c ON i.Cod_Curso = c.Cod_Curso
                        ORDER BY i.Data DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        listBoxInscricoes.Items.Add(
                            $"{r["Nome"]} → {r["Titulo"]} ({Convert.ToDateTime(r["Data"]).ToShortDateString()})");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar inscrições: " + ex.Message);
                }
            }
            if (listBoxInscricoes.Items.Count > 0)
                listBoxInscricoes.SelectedIndex = listBoxInscricoes.Items.Count - 1;
        }

        private void cmbUtilizador_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbUtilizador.SelectedIndex == -1) return;

            string texto = ((KeyValuePair<int, string>)cmbUtilizador.SelectedItem).Value;
            if (texto.Contains("(Aluno)"))
                txtInfoUtilizador.Text = "Aluno";
            else if (texto.Contains("(Formador)"))
                txtInfoUtilizador.Text = "Formador";

            AtualizarInfoCurso();
        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            AtualizarInfoCurso();
        }

        private void btnCancelarInscricao_Click(object sender, EventArgs e)
        {
            if (cmbUtilizador.SelectedIndex == -1 || cmbCurso.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona o utilizador e o curso.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idUtilizador = ((KeyValuePair<int, string>)cmbUtilizador.SelectedItem).Key;
            int codCurso = ((KeyValuePair<int, string>)cmbCurso.SelectedItem).Key;

            var confirm = MessageBox.Show(
                "Tens a certeza que queres cancelar esta inscrição?",
                "Confirmar Cancelamento",
                MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (confirm != DialogResult.Yes) return;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Explicacao_Online.cancelarInscricao", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdUtilizador", idUtilizador);
                    cmd.Parameters.AddWithValue("@CodCurso", codCurso);
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Inscrição cancelada com sucesso!", "Sucesso",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    LimparCampos();
                    CarregarInscricoes();
                }
                catch (Exception ex)
                {
                    string mensagem = ex.Message;
                    if (mensagem.Contains("The transaction ended in the trigger"))
                        mensagem = mensagem.Split('\n')[0].Trim();
                    MessageBox.Show(mensagem, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void AtualizarInfoCurso()
        {
            if (cmbCurso.SelectedIndex == -1 || cmbUtilizador.SelectedIndex == -1) return;

            int codCurso = ((KeyValuePair<int, string>)cmbCurso.SelectedItem).Key;
            int idUtilizador = ((KeyValuePair<int, string>)cmbUtilizador.SelectedItem).Key;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT Preco, Id_Formador FROM Explicacao_Online.Curso WHERE Cod_Curso = @cod";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@cod", codCurso);
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        decimal preco = Convert.ToDecimal(r["Preco"]);
                        int idFormador = Convert.ToInt32(r["Id_Formador"]);

                        if (idUtilizador == idFormador)
                        {
                            txtInfoCurso.Text = "Grátis (formador do curso)";
                            cmbMetodoPag.Items.Clear();
                            cmbMetodoPag.Items.Add("N/A");
                            cmbMetodoPag.SelectedIndex = 0;
                            cmbMetodoPag.Enabled = false;
                        }
                        else
                        {
                            txtInfoCurso.Text = $"Preço: {preco}€";
                            cmbMetodoPag.Items.Clear();
                            cmbMetodoPag.Items.AddRange(new object[] { "MBWay", "Transferência", "Cartão de Crédito", "PayPal" });
                            cmbMetodoPag.Enabled = true;
                            cmbMetodoPag.SelectedIndex = -1;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro: " + ex.Message);
                }
            }
        }

        private void LimparCampos()
        {
            cmbUtilizador.SelectedIndex = -1;
            cmbCurso.SelectedIndex = -1;
            cmbMetodoPag.SelectedIndex = -1;
            cmbMetodoPag.Enabled = true;
            txtInfoUtilizador.Clear();
            txtInfoCurso.Clear();
        }

        private void btnInscrever_Click(object sender, EventArgs e)
        {
            if (cmbUtilizador.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona um utilizador.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (cmbCurso.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona um curso.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (cmbMetodoPag.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona um método de pagamento.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idUtilizador = ((KeyValuePair<int, string>)cmbUtilizador.SelectedItem).Key;
            int codCurso = ((KeyValuePair<int, string>)cmbCurso.SelectedItem).Key;
            string metodoPag = cmbMetodoPag.SelectedItem.ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Explicacao_Online.registarInscricao", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdUtilizador", idUtilizador);
                    cmd.Parameters.AddWithValue("@CodCurso", codCurso);
                    cmd.Parameters.AddWithValue("@MetodoPag", metodoPag);
                    cmd.ExecuteNonQuery();

                    string queryPag = @"
                        SELECT TOP 1 Id_Pagamento, Estado, Valor 
                        FROM Explicacao_Online.Pagamento 
                        WHERE Id_Aluno = @id AND Cod_Curso = @cod
                        ORDER BY Id_Pagamento DESC";
                    SqlCommand cmdPag = new SqlCommand(queryPag, con);
                    cmdPag.Parameters.AddWithValue("@id", idUtilizador);
                    cmdPag.Parameters.AddWithValue("@cod", codCurso);
                    SqlDataReader r = cmdPag.ExecuteReader();

                    if (r.Read())
                    {
                        string estado = r["Estado"].ToString();
                        decimal valor = Convert.ToDecimal(r["Valor"]);
                        int idPagamento = Convert.ToInt32(r["Id_Pagamento"]);
                        r.Close();

                        CarregarInscricoes();

                        if (estado == "Concluído")
                        {
                            MessageBox.Show("Inscrição realizada com sucesso!\nPagamento: Grátis (já concluído).",
                                "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            LimparCampos();
                            CarregarInscricoes();

                        }
                        else
                        {
                            MessageBox.Show(
        $"Inscrição realizada com sucesso!\n\nTem um pagamento de {valor}€ pendente.\nAcede ao menu 'Pagamentos' para concluir a transferência.",
        "Inscrição Criada", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            LimparCampos();
                            CarregarInscricoes();
                        }
                    }
                }
                catch (Exception ex)
                {
                    string mensagem = ex.Message.Replace("O aluno possui", "O utilizador possui");
                    MessageBox.Show("Erro ao inscrever: " + mensagem);
                    LimparCampos();
                }
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void listBoxInscricoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxInscricoes.SelectedIndex == -1) return;

            try
            {
                string linha = listBoxInscricoes.SelectedItem.ToString();

                string[] partes = linha.Split('→');
                if (partes.Length < 2) return;

                string nomeAluno = partes[0].Trim();
                string restoCurso = partes[1].Split('(')[0].Trim();

                for (int i = 0; i < cmbUtilizador.Items.Count; i++)
                {
                    string itemTexto = ((KeyValuePair<int, string>)cmbUtilizador.Items[i]).Value;
                    if (itemTexto.Contains(nomeAluno))
                    {
                        cmbUtilizador.SelectedIndex = i;
                        break;
                    }
                }

                for (int i = 0; i < cmbCurso.Items.Count; i++)
                {
                    string itemTexto = ((KeyValuePair<int, string>)cmbCurso.Items[i]).Value;
                    if (itemTexto.Contains(restoCurso))
                    {
                        cmbCurso.SelectedIndex = i;
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao selecionar a inscrição: " + ex.Message);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}