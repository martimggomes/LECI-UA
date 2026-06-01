using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ProjetoExplicacaoOnline
{
    public partial class FormCursos : Form
    {
        string connectionString = "Server=192.168.182.10;Database=p1g2;User Id=p1g2;Password=1234;";
        private bool modoEdicao = false;

        public FormCursos()
        {
            InitializeComponent();
        }

        private void FormCursos_Load(object sender, EventArgs e)
        {
            CarregarFormadores();
            CarregarCursos();
        }

        private void CarregarCursos()
        {
            listBoxCursos.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT Cod_Curso, Titulo FROM Explicacao_Online.Curso";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        listBoxCursos.Items.Add($"{r["Cod_Curso"]} - {r["Titulo"]}");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar cursos: " + ex.Message);
                }
            }
            if (listBoxCursos.Items.Count > 0)
                listBoxCursos.SelectedIndex = listBoxCursos.Items.Count - 1;
        }


        private void btnFiltros_Click(object sender, EventArgs e)
        {
            ContextMenuStrip menu = new ContextMenuStrip();

            menu.Items.Add("Todos os cursos").Click += (s, ev) => AplicarFiltro("Todos os cursos");
            menu.Items.Add("Mais inscritos").Click += (s, ev) => AplicarFiltro("Mais inscritos");
            menu.Items.Add("Melhor avaliação").Click += (s, ev) => AplicarFiltro("Melhor avaliação");
            menu.Items.Add("Mais baratos").Click += (s, ev) => AplicarFiltro("Mais baratos");
            menu.Items.Add("Mais caros").Click += (s, ev) => AplicarFiltro("Mais caros");

            menu.Show(btnFiltros, new System.Drawing.Point(0, btnFiltros.Height));
        }

        private void AplicarFiltro(string filtro)
        {
            if (filtro == "Todos os cursos")
            {
                CarregarCursos();
                return;
            }

            listBoxCursos.Items.Clear();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    string orderBy = "";
                    switch (filtro)
                    {
                        case "Mais inscritos":
                            orderBy = "ORDER BY Total_Inscritos DESC";
                            break;
                        case "Melhor avaliação":
                            orderBy = "ORDER BY Media_Avaliacoes DESC";
                            break;
                        case "Mais baratos":
                            orderBy = "ORDER BY Preco ASC";
                            break;
                        case "Mais caros":
                            orderBy = "ORDER BY Preco DESC";
                            break;
                    }

                    string query = $@"
                SELECT Cod_Curso, Titulo, Preco, Total_Inscritos, Media_Avaliacoes
                FROM Explicacao_Online.cursosMaisPopulares()
                {orderBy}";

                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();

                    while (r.Read())
                    {
                        string linha = $"{r["Cod_Curso"]} - {r["Titulo"]}";
                        listBoxCursos.Items.Add(linha);
                    }

                    if (listBoxCursos.Items.Count > 0)
                        listBoxCursos.SelectedIndex = listBoxCursos.Items.Count - 1;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao aplicar filtro: " + ex.Message);
                }
            }
        }

        private void CarregarFormadores()
        {
            cmbFormador.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"SELECT f.Id_Utilizador, u.Nome 
                                     FROM Explicacao_Online.Formador f
                                     JOIN Explicacao_Online.Utilizador u ON f.Id_Utilizador = u.Id_Utilizador";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        cmbFormador.Items.Add(new KeyValuePair<int, string>(
                            Convert.ToInt32(r["Id_Utilizador"]), r["Nome"].ToString()));
                    cmbFormador.DisplayMember = "Value";
                    cmbFormador.ValueMember = "Key";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar formadores: " + ex.Message);
                }
            }
        }

        private void listBoxCursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxCursos.SelectedIndex == -1) return;

            string cod = listBoxCursos.SelectedItem.ToString().Split('-')[0].Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    string query = "SELECT * FROM Explicacao_Online.Curso WHERE Cod_Curso = @cod";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@cod", cod);
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        txtCodCurso.Text = r["Cod_Curso"].ToString();
                        txtTitulo.Text = r["Titulo"].ToString();
                        txtDescricao.Text = r["Descricao"] != DBNull.Value ? r["Descricao"].ToString() : "";
                        txtPreco.Text = r["Preco"].ToString();
                        cmbDificuldade.SelectedItem = r["Dificuldade"] != DBNull.Value ? r["Dificuldade"].ToString() : null;

                        int idFormador = Convert.ToInt32(r["Id_Formador"]);
                        for (int i = 0; i < cmbFormador.Items.Count; i++)
                        {
                            if (((KeyValuePair<int, string>)cmbFormador.Items[i]).Key == idFormador)
                            { cmbFormador.SelectedIndex = i; break; }
                        }
                    }
                    r.Close();

                    // UDF média avaliações
                    string queryMedia = "SELECT Explicacao_Online.mediaAvaliacaoCurso(@cod)";
                    SqlCommand cmdMedia = new SqlCommand(queryMedia, con);
                    cmdMedia.Parameters.AddWithValue("@cod", cod);
                    object media = cmdMedia.ExecuteScalar();
                    txtMediaAval.Text = media != null ? media.ToString() : "0";

                    // UDF total inscritos
                    if (cmbFormador.SelectedIndex != -1)
                    {
                        int idF = ((KeyValuePair<int, string>)cmbFormador.SelectedItem).Key;
                        string queryInscritos = @"SELECT Total_Inscritos 
                                                  FROM Explicacao_Online.cursosFormador(@idF) 
                                                  WHERE Cod_Curso = @cod";
                        SqlCommand cmdInscritos = new SqlCommand(queryInscritos, con);
                        cmdInscritos.Parameters.AddWithValue("@idF", idF);
                        cmdInscritos.Parameters.AddWithValue("@cod", cod);
                        object total = cmdInscritos.ExecuteScalar();
                        txtTotalInscritos.Text = total != null ? total.ToString() : "0";
                    }

                    SetCamposEditaveis(false);
                    panelDetalhes.Visible = true;
                    listBoxCursos.Size = new System.Drawing.Size(160, 400);
                    btnGuardar.Visible = false;
                    btnCancelar.Visible = false;
                    modoEdicao = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar curso: " + ex.Message);
                }
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            LimparCampos();
            listBoxCursos.SelectedIndex = -1;
            SetCamposEditaveis(true);
            CarregarProximoIdCurso(); 
            panelDetalhes.Visible = true;
            listBoxCursos.Size = new System.Drawing.Size(160, 400);
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
            modoEdicao = false;
            txtTitulo.Focus();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos()) return;

            if (modoEdicao)
                AtualizarCurso();
            else
                InserirCurso();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            panelDetalhes.Visible = false;
            listBoxCursos.Size = new System.Drawing.Size(750, 400);
            listBoxCursos.SelectedIndex = -1;
            btnGuardar.Visible = false;
            btnCancelar.Visible = false;
            modoEdicao = false;
            btnEdit.Text = "Editar";
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (listBoxCursos.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona primeiro um curso da lista.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            SetCamposEditaveis(true);
            txtCodCurso.ReadOnly = true;
            panelDetalhes.Visible = true;
            listBoxCursos.Size = new System.Drawing.Size(160, 400);
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
            modoEdicao = true;
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (listBoxCursos.SelectedIndex == -1 || !panelDetalhes.Visible)
            {
                MessageBox.Show("Seleciona primeiro um curso da lista.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var confirm = MessageBox.Show(
                $"Tens a certeza que queres eliminar o curso '{txtTitulo.Text}'?\nEsta ação irá eliminar também as aulas, recursos, inscrições e avaliações associadas.",
                "Confirmar Eliminação",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning);
            if (confirm != DialogResult.Yes) return;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlTransaction transacao = con.BeginTransaction();
                    try
                    {
                        int cod = int.Parse(txtCodCurso.Text);

                        string qPag = "DELETE FROM Explicacao_Online.Pagamento WHERE Cod_Curso = @cod";
                        SqlCommand cmdPag = new SqlCommand(qPag, con, transacao);
                        cmdPag.Parameters.AddWithValue("@cod", cod);
                        cmdPag.ExecuteNonQuery();

                        string qCurso = "DELETE FROM Explicacao_Online.Curso WHERE Cod_Curso = @cod";
                        SqlCommand cmdCurso = new SqlCommand(qCurso, con, transacao);
                        cmdCurso.Parameters.AddWithValue("@cod", cod);
                        cmdCurso.ExecuteNonQuery();

                        transacao.Commit();
                        MessageBox.Show("Curso eliminado com sucesso!", "Sucesso",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);

                        panelDetalhes.Visible = false;
                        listBoxCursos.Size = new System.Drawing.Size(750, 400);
                        btnGuardar.Visible = false;
                        btnCancelar.Visible = false;
                        CarregarCursos();
                    }
                    catch (Exception exInner)
                    {
                        transacao.Rollback();
                        MessageBox.Show("Erro ao eliminar: " + exInner.Message);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro de ligação: " + ex.Message);
                }
            }
        }

        private void InserirCurso()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"INSERT INTO Explicacao_Online.Curso 
                        (Cod_Curso, Titulo, Descricao, Dificuldade, Id_Formador, Preco)
                        VALUES (@cod, @titulo, @desc, @dif, @formador, @preco)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@cod", int.Parse(txtCodCurso.Text));
                    cmd.Parameters.AddWithValue("@titulo", txtTitulo.Text.Trim());
                    cmd.Parameters.AddWithValue("@desc", string.IsNullOrWhiteSpace(txtDescricao.Text) ? (object)DBNull.Value : txtDescricao.Text.Trim());
                    cmd.Parameters.AddWithValue("@dif", cmbDificuldade.SelectedIndex == -1 ? (object)DBNull.Value : cmbDificuldade.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@formador", ((KeyValuePair<int, string>)cmbFormador.SelectedItem).Key);
                    cmd.Parameters.AddWithValue("@preco", decimal.Parse(txtPreco.Text));
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Curso adicionado com sucesso!", "Sucesso",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    panelDetalhes.Visible = false;
                    listBoxCursos.Size = new System.Drawing.Size(750, 400);
                    btnGuardar.Visible = false;
                    btnCancelar.Visible = false;
                    CarregarCursos();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao adicionar curso: " + ex.Message);
                }
            }
        }

        private void AtualizarCurso()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"UPDATE Explicacao_Online.Curso 
                        SET Titulo = @titulo, Descricao = @desc, Dificuldade = @dif,
                            Id_Formador = @formador, Preco = @preco
                        WHERE Cod_Curso = @cod";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@cod", int.Parse(txtCodCurso.Text));
                    cmd.Parameters.AddWithValue("@titulo", txtTitulo.Text.Trim());
                    cmd.Parameters.AddWithValue("@desc", string.IsNullOrWhiteSpace(txtDescricao.Text) ? (object)DBNull.Value : txtDescricao.Text.Trim());
                    cmd.Parameters.AddWithValue("@dif", cmbDificuldade.SelectedIndex == -1 ? (object)DBNull.Value : cmbDificuldade.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@formador", ((KeyValuePair<int, string>)cmbFormador.SelectedItem).Key);
                    cmd.Parameters.AddWithValue("@preco", decimal.Parse(txtPreco.Text));
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Curso atualizado com sucesso!", "Sucesso",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    panelDetalhes.Visible = false;
                    listBoxCursos.Size = new System.Drawing.Size(750, 400);
                    btnGuardar.Visible = false;
                    btnCancelar.Visible = false;
                    modoEdicao = false;
                    btnEdit.Text = "Editar";
                    CarregarCursos();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao atualizar curso: " + ex.Message);
                }
            }
        }

        private void btnMaisPopulares_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"SELECT Titulo, Nome_Formador, Total_Inscritos, Media_Avaliacoes, Preco
                             FROM Explicacao_Online.cursosMaisPopulares()
                             ORDER BY Total_Inscritos DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();

                    string resultado = "CURSOS MAIS POPULARES\n" + new string('-', 50) + "\n";
                    while (r.Read())
                        resultado += $"{r["Titulo"]} | Formador: {r["Nome_Formador"]} | " +
                                     $"Inscritos: {r["Total_Inscritos"]} | " +
                                     $"Média: {r["Media_Avaliacoes"]} | {r["Preco"]}€\n";

                    MessageBox.Show(resultado, "Cursos Mais Populares",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro: " + ex.Message);
                }
            }
        }


        private void CarregarProximoIdCurso()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT ISNULL(MAX(Cod_Curso), 0) + 1 FROM Explicacao_Online.Curso";
                    SqlCommand cmd = new SqlCommand(query, con);
                    txtCodCurso.Text = cmd.ExecuteScalar().ToString();
                    txtCodCurso.ReadOnly = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao gerar código: " + ex.Message);
                }
            }
        }
        private bool ValidarCampos()
        {
            if (!int.TryParse(txtCodCurso.Text.Trim(), out int cod) || cod <= 0)
            {
                MessageBox.Show("O Código tem de ser um número inteiro positivo.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtCodCurso.Focus();
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtTitulo.Text) || txtTitulo.Text.Trim().Length > 150)
            {
                MessageBox.Show("O Título é obrigatório e não pode ter mais de 150 caracteres.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTitulo.Focus();
                return false;
            }
            if (!decimal.TryParse(txtPreco.Text.Trim(), out decimal preco) || preco < 0)
            {
                MessageBox.Show("O Preço tem de ser um número decimal positivo (ex: 29.99).", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtPreco.Focus();
                return false;
            }
            if (cmbFormador.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona o formador do curso.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }

        private void SetCamposEditaveis(bool editavel)
        {
            txtTitulo.ReadOnly = !editavel;
            txtDescricao.ReadOnly = !editavel;
            txtPreco.ReadOnly = !editavel;
            cmbDificuldade.Enabled = editavel;
            cmbFormador.Enabled = editavel;
            txtCodCurso.ReadOnly = true;
        }

        private void LimparCampos()
        {
            txtCodCurso.Clear();
            txtTitulo.Clear();
            txtDescricao.Clear();
            txtPreco.Clear();
            txtMediaAval.Clear();
            txtTotalInscritos.Clear();
            cmbDificuldade.SelectedIndex = -1;
            cmbFormador.SelectedIndex = -1;
        }
    }
}