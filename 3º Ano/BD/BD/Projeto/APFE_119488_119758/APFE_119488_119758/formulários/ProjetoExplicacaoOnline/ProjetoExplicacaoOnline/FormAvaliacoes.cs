using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ProjetoExplicacaoOnline
{
    public partial class FormAvaliacoes : Form
    {
        string connectionString = "Server=192.168.182.10;Database=p1g2;User Id=p1g2;Password=1234;";
        private int idAvSelecionada = -1;

        public FormAvaliacoes()
        {
            InitializeComponent();
        }

        private void FormAvaliacoes_Load(object sender, EventArgs e)
        {
            CarregarAlunos();
            CarregarAvaliacoes();
        }

        private void CarregarAvaliacoes()
        {
            listBoxAvaliacoes.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT a.Id_Av, u.Nome, c.Titulo, a.Nota, a.Data
                        FROM Explicacao_Online.Avaliacao a
                        JOIN Explicacao_Online.Utilizador u ON a.Id_Aluno = u.Id_Utilizador
                        JOIN Explicacao_Online.Curso c ON a.Cod_Curso = c.Cod_Curso
                        ORDER BY a.Data DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        listBoxAvaliacoes.Items.Add(
                            $"{r["Id_Av"]} | {r["Nome"]} | {r["Titulo"]} | Nota: {r["Nota"]} | {Convert.ToDateTime(r["Data"]).ToShortDateString()}");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar avaliações: " + ex.Message);
                }
            }
            if (listBoxAvaliacoes.Items.Count > 0)
                listBoxAvaliacoes.SelectedIndex = listBoxAvaliacoes.Items.Count - 1;
        }

        private void CarregarAlunos()
        {
            cmbAluno.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    // Todos os utilizadores inscritos em algum curso
                    string query = @"
                SELECT DISTINCT u.Id_Utilizador, u.Nome
                FROM Explicacao_Online.Utilizador u
                JOIN Explicacao_Online.Inscrever i ON u.Id_Utilizador = i.Id_Aluno
                ORDER BY u.Nome";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        cmbAluno.Items.Add(new KeyValuePair<int, string>(
                            Convert.ToInt32(r["Id_Utilizador"]),
                            $"{r["Id_Utilizador"]} - {r["Nome"]}"));
                    cmbAluno.DisplayMember = "Value";
                    cmbAluno.ValueMember = "Key";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar utilizadores: " + ex.Message);
                }
            }
        }

        private void cmbAluno_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbAluno.SelectedIndex == -1) return;

            // Carregar apenas os cursos em que este utilizador está inscrito
            int idAluno = ((KeyValuePair<int, string>)cmbAluno.SelectedItem).Key;
            cmbCurso.Items.Clear();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT c.Cod_Curso, c.Titulo
                        FROM Explicacao_Online.Curso c
                        JOIN Explicacao_Online.Inscrever i ON c.Cod_Curso = i.Cod_Curso
                        WHERE i.Id_Aluno = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", idAluno);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        cmbCurso.Items.Add(new KeyValuePair<int, string>(
                            Convert.ToInt32(r["Cod_Curso"]),
                            $"{r["Cod_Curso"]} - {r["Titulo"]}"));
                    cmbCurso.DisplayMember = "Value";
                    cmbCurso.ValueMember = "Key";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar cursos: " + ex.Message);
                }
            }
        }

        private void listBoxAvaliacoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxAvaliacoes.SelectedIndex == -1) return;

            string item = listBoxAvaliacoes.SelectedItem.ToString();
            int idAv = int.Parse(item.Split('|')[0].Trim());
            idAvSelecionada = idAv;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT a.Id_Av, a.Id_Aluno, u.Nome, a.Cod_Curso, c.Titulo, 
                               a.Nota, a.Comentario, a.Data
                        FROM Explicacao_Online.Avaliacao a
                        JOIN Explicacao_Online.Utilizador u ON a.Id_Aluno = u.Id_Utilizador
                        JOIN Explicacao_Online.Curso c ON a.Cod_Curso = c.Cod_Curso
                        WHERE a.Id_Av = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", idAv);
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        int idAluno = Convert.ToInt32(r["Id_Aluno"]);
                        for (int i = 0; i < cmbAluno.Items.Count; i++)
                        {
                            if (((KeyValuePair<int, string>)cmbAluno.Items[i]).Key == idAluno)
                            { cmbAluno.SelectedIndex = i; break; }
                        }

                        int codCurso = Convert.ToInt32(r["Cod_Curso"]);
                        for (int i = 0; i < cmbCurso.Items.Count; i++)
                        {
                            if (((KeyValuePair<int, string>)cmbCurso.Items[i]).Key == codCurso)
                            { cmbCurso.SelectedIndex = i; break; }
                        }

                        cmbNota.SelectedItem = r["Nota"].ToString();
                        txtComentario.Text = r["Comentario"] != DBNull.Value ? r["Comentario"].ToString() : "";
                        txtData.Text = Convert.ToDateTime(r["Data"]).ToShortDateString();
                    }
                    r.Close();

                    SetCamposEditaveis(false);
                    panelDetalhes.Visible = true;
                    listBoxAvaliacoes.Size = new System.Drawing.Size(280, 380);
                    btnGuardar.Visible = false;
                    btnCancelar.Visible = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar avaliação: " + ex.Message);
                }
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            LimparCampos();
            listBoxAvaliacoes.SelectedIndex = -1;
            idAvSelecionada = -1;
            SetCamposEditaveis(true);
            txtData.Text = DateTime.Today.ToShortDateString();
            panelDetalhes.Visible = true;
            listBoxAvaliacoes.Size = new System.Drawing.Size(160, 380);
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
            cmbAluno.Focus();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (cmbAluno.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona o aluno.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (cmbCurso.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona o curso.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (cmbNota.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona a nota (1 a 5).", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (txtComentario.Text.Trim().Length > 300)
            {
                MessageBox.Show("O comentário não pode ter mais de 300 caracteres.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idAluno = ((KeyValuePair<int, string>)cmbAluno.SelectedItem).Key;
            int codCurso = ((KeyValuePair<int, string>)cmbCurso.SelectedItem).Key;
            int nota = int.Parse(cmbNota.SelectedItem.ToString());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    string queryId = "SELECT ISNULL(MAX(Id_Av), 0) + 1 FROM Explicacao_Online.Avaliacao";
                    SqlCommand cmdId = new SqlCommand(queryId, con);
                    int novoId = Convert.ToInt32(cmdId.ExecuteScalar());

                    string query = @"INSERT INTO Explicacao_Online.Avaliacao 
                        (Id_Av, Data, Comentario, Nota, Cod_Curso, Id_Aluno)
                        VALUES (@id, @data, @comentario, @nota, @curso, @aluno)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", novoId);
                    cmd.Parameters.AddWithValue("@data", DateTime.Today);
                    cmd.Parameters.AddWithValue("@comentario",
                        string.IsNullOrWhiteSpace(txtComentario.Text) ? (object)DBNull.Value : txtComentario.Text.Trim());
                    cmd.Parameters.AddWithValue("@nota", nota);
                    cmd.Parameters.AddWithValue("@curso", codCurso);
                    cmd.Parameters.AddWithValue("@aluno", idAluno);
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Avaliação adicionada com sucesso!", "Sucesso",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);

                    panelDetalhes.Visible = false;
                    listBoxAvaliacoes.Size = new System.Drawing.Size(790, 380);
                    btnGuardar.Visible = false;
                    btnCancelar.Visible = false;
                    LimparCampos();
                    CarregarAvaliacoes();
                }
                catch (Exception ex)
                {
                    string mensagem = ex.Message;
                    if (mensagem.Contains("The transaction ended in the trigger"))
                        mensagem = mensagem.Split('\n')[0].Trim();

                    MessageBox.Show(mensagem, "Erro",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            panelDetalhes.Visible = false;
            listBoxAvaliacoes.Size = new System.Drawing.Size(790, 380);
            listBoxAvaliacoes.SelectedIndex = -1;
            btnGuardar.Visible = false;
            btnCancelar.Visible = false;
            LimparCampos();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (listBoxAvaliacoes.SelectedIndex == -1 || !panelDetalhes.Visible)
            {
                MessageBox.Show("Seleciona primeiro uma avaliação da lista.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var confirm = MessageBox.Show(
                "Tens a certeza que queres eliminar esta avaliação?",
                "Confirmar Eliminação",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning);
            if (confirm != DialogResult.Yes) return;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "DELETE FROM Explicacao_Online.Avaliacao WHERE Id_Av = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", idAvSelecionada);
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Avaliação eliminada com sucesso!", "Sucesso",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);

                    panelDetalhes.Visible = false;
                    listBoxAvaliacoes.Size = new System.Drawing.Size(700, 380);
                    CarregarAvaliacoes();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao eliminar: " + ex.Message);
                }
            }
        }

        private void SetCamposEditaveis(bool editavel)
        {
            cmbAluno.Enabled = editavel;
            cmbCurso.Enabled = editavel;
            cmbNota.Enabled = editavel;
            txtComentario.ReadOnly = !editavel;
        }

        private void LimparCampos()
        {
            cmbAluno.SelectedIndex = -1;
            cmbCurso.Items.Clear();
            cmbNota.SelectedIndex = -1;
            txtComentario.Clear();
            txtData.Clear();
            idAvSelecionada = -1;
        }
    }
}