using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ProjetoExplicacaoOnline
{
    public partial class FormInstituicoes : Form
    {
        string connectionString = "Server=192.168.182.10;Database=p1g2;User Id=p1g2;Password=1234;";
        private bool modoEdicao = false;

        public FormInstituicoes()
        {
            InitializeComponent();
        }

        private void FormInstituicoes_Load(object sender, EventArgs e)
        {
            CarregarInstituicoes();
        }

        private void CarregarInstituicoes()
        {
            listBoxInstituicoes.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT i.Id_Instituicao, i.Nome,
                            CASE
                                WHEN e.Id_Instituicao IS NOT NULL THEN 'Escola Secundária'
                                WHEN u.Id_Instituicao IS NOT NULL THEN 'Universidade'
                                WHEN p.Id_Instituicao IS NOT NULL THEN 'Politécnico'
                                ELSE 'Desconhecido'
                            END AS Tipo
                        FROM Explicacao_Online.Instituicao i
                        LEFT JOIN Explicacao_Online.Escola_sec e ON i.Id_Instituicao = e.Id_Instituicao
                        LEFT JOIN Explicacao_Online.Universidade u ON i.Id_Instituicao = u.Id_Instituicao
                        LEFT JOIN Explicacao_Online.Politecnico p ON i.Id_Instituicao = p.Id_Instituicao
                        ORDER BY i.Nome";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        listBoxInstituicoes.Items.Add(
                            $"{r["Id_Instituicao"]} - {r["Nome"]} ({r["Tipo"]})");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar instituições: " + ex.Message);
                }
            }
            if (listBoxInstituicoes.Items.Count > 0)
                listBoxInstituicoes.SelectedIndex = listBoxInstituicoes.Items.Count - 1;
        }

        private void listBoxInstituicoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxInstituicoes.SelectedIndex == -1) return;

            string item = listBoxInstituicoes.SelectedItem.ToString();
            string id = item.Split('-')[0].Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT i.Id_Instituicao, i.Nome, i.Localizacao, i.Sigla,
                            e.Agrupamento,
                            u.Ranking,
                            p.Area_Esp,
                            CASE
                                WHEN e.Id_Instituicao IS NOT NULL THEN 'Escola Secundária'
                                WHEN u.Id_Instituicao IS NOT NULL THEN 'Universidade'
                                WHEN p.Id_Instituicao IS NOT NULL THEN 'Politécnico'
                            END AS Tipo
                        FROM Explicacao_Online.Instituicao i
                        LEFT JOIN Explicacao_Online.Escola_sec e ON i.Id_Instituicao = e.Id_Instituicao
                        LEFT JOIN Explicacao_Online.Universidade u ON i.Id_Instituicao = u.Id_Instituicao
                        LEFT JOIN Explicacao_Online.Politecnico p ON i.Id_Instituicao = p.Id_Instituicao
                        WHERE i.Id_Instituicao = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", id);
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        txtId.Text = r["Id_Instituicao"].ToString();
                        txtNome.Text = r["Nome"].ToString();
                        txtLocalizacao.Text = r["Localizacao"].ToString();
                        txtSigla.Text = r["Sigla"] != DBNull.Value ? r["Sigla"].ToString() : "";
                        cmbTipo.SelectedItem = r["Tipo"].ToString();

                        txtAgrupamento.Text = r["Agrupamento"] != DBNull.Value ? r["Agrupamento"].ToString() : "";
                        txtRanking.Text = r["Ranking"] != DBNull.Value ? r["Ranking"].ToString() : "";
                        txtAreaEsp.Text = r["Area_Esp"] != DBNull.Value ? r["Area_Esp"].ToString() : "";
                    }
                    r.Close();

                    SetCamposEditaveis(false);
                    panelDetalhes.Visible = true;
                    listBoxInstituicoes.Size = new System.Drawing.Size(280, 400);
                    btnGuardar.Visible = false;
                    btnCancelar.Visible = false;
                    modoEdicao = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar instituição: " + ex.Message);
                }
            }
        }

        private void cmbTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tipo = cmbTipo.SelectedItem?.ToString() ?? "";

            lblAgrupamento.Visible = tipo == "Escola Secundária";
            txtAgrupamento.Visible = tipo == "Escola Secundária";
            lblRanking.Visible = tipo == "Universidade";
            txtRanking.Visible = tipo == "Universidade";
            lblAreaEsp.Visible = tipo == "Politécnico";
            txtAreaEsp.Visible = tipo == "Politécnico";
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            LimparCampos();
            listBoxInstituicoes.SelectedIndex = -1;
            SetCamposEditaveis(true);
            CarregarProximoIdInstituicao(); 
            panelDetalhes.Visible = true;
            listBoxInstituicoes.Size = new System.Drawing.Size(280, 400);
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
            modoEdicao = false;
            txtNome.Focus();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (listBoxInstituicoes.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona primeiro uma instituição da lista.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            SetCamposEditaveis(true);
            txtId.ReadOnly = true;
            panelDetalhes.Visible = true;
            listBoxInstituicoes.Size = new System.Drawing.Size(280, 400);
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
            modoEdicao = true;
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (listBoxInstituicoes.SelectedIndex == -1 || !panelDetalhes.Visible)
            {
                MessageBox.Show("Seleciona primeiro uma instituição da lista.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var confirm = MessageBox.Show(
                $"Tens a certeza que queres eliminar '{txtNome.Text}'?",
                "Confirmar Eliminação",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning);
            if (confirm != DialogResult.Yes) return;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "DELETE FROM Explicacao_Online.Instituicao WHERE Id_Instituicao = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", txtId.Text);
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Instituição eliminada com sucesso!", "Sucesso",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);

                    panelDetalhes.Visible = false;
                    listBoxInstituicoes.Size = new System.Drawing.Size(790, 400);
                    CarregarInstituicoes();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao eliminar: " + ex.Message);
                }
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos()) return;

            if (modoEdicao)
                AtualizarInstituicao();
            else
                InserirInstituicao();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            panelDetalhes.Visible = false;
            listBoxInstituicoes.Size = new System.Drawing.Size(790, 400);
            listBoxInstituicoes.SelectedIndex = -1;
            btnGuardar.Visible = false;
            btnCancelar.Visible = false;
            modoEdicao = false;
        }

        private void InserirInstituicao()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlTransaction transacao = con.BeginTransaction();
                    try
                    {
                        string tipo = cmbTipo.SelectedItem.ToString();
                        int id = int.Parse(txtId.Text);

                        string qBase = @"INSERT INTO Explicacao_Online.Instituicao 
                            (Id_Instituicao, Nome, Localizacao, Sigla)
                            VALUES (@id, @nome, @loc, @sigla)";
                        SqlCommand cmdBase = new SqlCommand(qBase, con, transacao);
                        cmdBase.Parameters.AddWithValue("@id", id);
                        cmdBase.Parameters.AddWithValue("@nome", txtNome.Text.Trim());
                        cmdBase.Parameters.AddWithValue("@loc", txtLocalizacao.Text.Trim());
                        cmdBase.Parameters.AddWithValue("@sigla",
                            string.IsNullOrWhiteSpace(txtSigla.Text) ? (object)DBNull.Value : txtSigla.Text.Trim());
                        cmdBase.ExecuteNonQuery();

                        if (tipo == "Escola Secundária")
                        {
                            string q = "INSERT INTO Explicacao_Online.Escola_sec (Id_Instituicao, Agrupamento) VALUES (@id, @agrup)";
                            SqlCommand cmd = new SqlCommand(q, con, transacao);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.Parameters.AddWithValue("@agrup",
                                string.IsNullOrWhiteSpace(txtAgrupamento.Text) ? (object)DBNull.Value : txtAgrupamento.Text.Trim());
                            cmd.ExecuteNonQuery();
                        }
                        else if (tipo == "Universidade")
                        {
                            string q = "INSERT INTO Explicacao_Online.Universidade (Id_Instituicao, Ranking) VALUES (@id, @rank)";
                            SqlCommand cmd = new SqlCommand(q, con, transacao);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.Parameters.AddWithValue("@rank",
                                string.IsNullOrWhiteSpace(txtRanking.Text) ? (object)DBNull.Value : (object)int.Parse(txtRanking.Text));
                            cmd.ExecuteNonQuery();
                        }
                        else if (tipo == "Politécnico")
                        {
                            string q = "INSERT INTO Explicacao_Online.Politecnico (Id_Instituicao, Area_Esp) VALUES (@id, @area)";
                            SqlCommand cmd = new SqlCommand(q, con, transacao);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.Parameters.AddWithValue("@area",
                                string.IsNullOrWhiteSpace(txtAreaEsp.Text) ? (object)DBNull.Value : txtAreaEsp.Text.Trim());
                            cmd.ExecuteNonQuery();
                        }

                        transacao.Commit();
                        MessageBox.Show("Instituição adicionada com sucesso!", "Sucesso",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);
                        panelDetalhes.Visible = false;
                        listBoxInstituicoes.Size = new System.Drawing.Size(790, 400);
                        btnGuardar.Visible = false;
                        btnCancelar.Visible = false;
                        CarregarInstituicoes();
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

        private void AtualizarInstituicao()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlTransaction transacao = con.BeginTransaction();
                    try
                    {
                        string tipo = cmbTipo.SelectedItem.ToString();
                        int id = int.Parse(txtId.Text);

                        string qBase = @"UPDATE Explicacao_Online.Instituicao 
                            SET Nome = @nome, Localizacao = @loc, Sigla = @sigla
                            WHERE Id_Instituicao = @id";
                        SqlCommand cmdBase = new SqlCommand(qBase, con, transacao);
                        cmdBase.Parameters.AddWithValue("@id", id);
                        cmdBase.Parameters.AddWithValue("@nome", txtNome.Text.Trim());
                        cmdBase.Parameters.AddWithValue("@loc", txtLocalizacao.Text.Trim());
                        cmdBase.Parameters.AddWithValue("@sigla",
                            string.IsNullOrWhiteSpace(txtSigla.Text) ? (object)DBNull.Value : txtSigla.Text.Trim());
                        cmdBase.ExecuteNonQuery();

                        if (tipo == "Escola Secundária")
                        {
                            string q = "UPDATE Explicacao_Online.Escola_sec SET Agrupamento = @agrup WHERE Id_Instituicao = @id";
                            SqlCommand cmd = new SqlCommand(q, con, transacao);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.Parameters.AddWithValue("@agrup",
                                string.IsNullOrWhiteSpace(txtAgrupamento.Text) ? (object)DBNull.Value : txtAgrupamento.Text.Trim());
                            cmd.ExecuteNonQuery();
                        }
                        else if (tipo == "Universidade")
                        {
                            string q = "UPDATE Explicacao_Online.Universidade SET Ranking = @rank WHERE Id_Instituicao = @id";
                            SqlCommand cmd = new SqlCommand(q, con, transacao);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.Parameters.AddWithValue("@rank",
                                string.IsNullOrWhiteSpace(txtRanking.Text) ? (object)DBNull.Value : (object)int.Parse(txtRanking.Text));
                            cmd.ExecuteNonQuery();
                        }
                        else if (tipo == "Politécnico")
                        {
                            string q = "UPDATE Explicacao_Online.Politecnico SET Area_Esp = @area WHERE Id_Instituicao = @id";
                            SqlCommand cmd = new SqlCommand(q, con, transacao);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.Parameters.AddWithValue("@area",
                                string.IsNullOrWhiteSpace(txtAreaEsp.Text) ? (object)DBNull.Value : txtAreaEsp.Text.Trim());
                            cmd.ExecuteNonQuery();
                        }

                        transacao.Commit();
                        MessageBox.Show("Instituição atualizada com sucesso!", "Sucesso",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);
                        panelDetalhes.Visible = false;
                        listBoxInstituicoes.Size = new System.Drawing.Size(790, 400);
                        btnGuardar.Visible = false;
                        btnCancelar.Visible = false;
                        modoEdicao = false;
                        CarregarInstituicoes();
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

        private bool ValidarCampos()
        {
            if (string.IsNullOrWhiteSpace(txtNome.Text) || txtNome.Text.Trim().Length > 150)
            {
                MessageBox.Show("O Nome é obrigatório e não pode ter mais de 150 caracteres.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNome.Focus();
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtLocalizacao.Text))
            {
                MessageBox.Show("A Localização é obrigatória.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtLocalizacao.Focus();
                return false;
            }
            if (cmbTipo.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona o tipo de instituição.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (cmbTipo.SelectedItem.ToString() == "Universidade" &&
                !string.IsNullOrWhiteSpace(txtRanking.Text) &&
                !int.TryParse(txtRanking.Text, out _))
            {
                MessageBox.Show("O Ranking tem de ser um número inteiro.", "Erro de Validação",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtRanking.Focus();
                return false;
            }
            return true;
        }

        private void SetCamposEditaveis(bool editavel)
        {
            txtNome.ReadOnly = !editavel;
            txtLocalizacao.ReadOnly = !editavel;
            txtSigla.ReadOnly = !editavel;
            cmbTipo.Enabled = editavel;
            txtAgrupamento.ReadOnly = !editavel;
            txtRanking.ReadOnly = !editavel;
            txtAreaEsp.ReadOnly = !editavel;
            txtId.ReadOnly = true;
        }

        private void CarregarProximoIdInstituicao()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT ISNULL(MAX(Id_Instituicao), 0) + 1 FROM Explicacao_Online.Instituicao";
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
        private void LimparCampos()
        {
            txtId.Clear();
            txtNome.Clear();
            txtLocalizacao.Clear();
            txtSigla.Clear();
            txtAgrupamento.Clear();
            txtRanking.Clear();
            txtAreaEsp.Clear();
            cmbTipo.SelectedIndex = -1;
        }
    }
}