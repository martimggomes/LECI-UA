using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Collections.Generic;

namespace ProjetoExplicacaoOnline
{
    public partial class FormPagamentos : Form
    {
        string connectionString = "Server=192.168.182.10;Database=p1g2;User Id=p1g2;Password=1234;";
        private int idPagamentoInicial = -1;

        public FormPagamentos()
        {
            InitializeComponent();
        }

        public FormPagamentos(int idPagamento)
        {
            InitializeComponent();
            idPagamentoInicial = idPagamento;
        }

        private void FormPagamentos_Load(object sender, EventArgs e)
        {
            CarregarPagamentos();

            CarregarUtilizadoresExtrato(); 

            if (idPagamentoInicial != -1)
                SelecionarPagamento(idPagamentoInicial);
        }

        private void CarregarPagamentos()
        {
            listBoxPagamentos.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT p.Id_Pagamento, u.Nome, c.Titulo, p.Valor, p.Estado
                        FROM Explicacao_Online.Pagamento p
                        JOIN Explicacao_Online.Utilizador u ON p.Id_Aluno = u.Id_Utilizador
                        JOIN Explicacao_Online.Curso c ON p.Cod_Curso = c.Cod_Curso
                        ORDER BY p.Estado DESC, p.Data DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                    {
                        string estado = r["Estado"].ToString();
                        string linha = $"{r["Id_Pagamento"]} | {r["Nome"]} | {r["Titulo"]} | {r["Valor"]}€ | {estado}";
                        listBoxPagamentos.Items.Add(linha);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar pagamentos: " + ex.Message);
                }
            }
            if (listBoxPagamentos.Items.Count > 0)
                listBoxPagamentos.SelectedIndex = listBoxPagamentos.Items.Count - 1;
        }

        private void CarregarUtilizadoresExtrato()
        {
            cmbExtratoUtilizador.Items.Clear();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    // Busca apenas utilizadores que têm pelo menos um pagamento
                    string query = @"
                SELECT DISTINCT u.Id_Utilizador, u.Nome
                FROM Explicacao_Online.Utilizador u
                JOIN Explicacao_Online.Pagamento p ON u.Id_Utilizador = p.Id_Aluno
                ORDER BY u.Nome";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                        cmbExtratoUtilizador.Items.Add(new KeyValuePair<int, string>(
                            Convert.ToInt32(r["Id_Utilizador"]),
                            r["Nome"].ToString()));
                    cmbExtratoUtilizador.DisplayMember = "Value";
                    cmbExtratoUtilizador.ValueMember = "Key";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar utilizadores: " + ex.Message);
                }
            }
        }

        private void btnVerExtrato_Click(object sender, EventArgs e)
        {
            if (cmbExtratoUtilizador.SelectedIndex == -1)
            {
                MessageBox.Show("Seleciona um utilizador para ver o extrato.", "Atenção",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idUtilizador = ((KeyValuePair<int, string>)cmbExtratoUtilizador.SelectedItem).Key;
            string nomeUtilizador = ((KeyValuePair<int, string>)cmbExtratoUtilizador.SelectedItem).Value;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    string query = @"
                SELECT Nome_Curso, Data, Valor, Estado, Metodo_Pag
                FROM Explicacao_Online.extratoFinanceiroAluno(@id)
                ORDER BY Data DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", idUtilizador);
                    SqlDataReader r = cmd.ExecuteReader();

                    string extrato = $"EXTRATO FINANCEIRO — {nomeUtilizador}\n";
                    extrato += new string('=', 50) + "\n\n";

                    decimal totalPago = 0;
                    decimal totalPendente = 0;
                    bool temRegistos = false;

                    while (r.Read())
                    {
                        temRegistos = true;
                        string estado = r["Estado"].ToString();
                        decimal valor = Convert.ToDecimal(r["Valor"]);
                        string metodo = r["Metodo_Pag"] != DBNull.Value ? r["Metodo_Pag"].ToString() : "N/A";
                        string data = Convert.ToDateTime(r["Data"]).ToShortDateString();

                        extrato += $"Curso: {r["Nome_Curso"]}\n";
                        extrato += $"  Data: {data} | Valor: {valor}€ | Estado: {estado} | Método: {metodo}\n\n";

                        if (estado == "Concluído")
                            totalPago += valor;
                        else if (estado == "Pendente")
                            totalPendente += valor;
                    }

                    if (!temRegistos)
                    {
                        extrato += "Não existem registos de pagamento para este utilizador.";
                    }
                    else
                    {
                        extrato += new string('-', 50) + "\n";
                        extrato += $"Total pago:     {totalPago}€\n";
                        extrato += $"Total pendente: {totalPendente}€\n";
                        extrato += $"Total geral:    {totalPago + totalPendente}€";
                    }

                    MessageBox.Show(extrato, $"Extrato — {nomeUtilizador}",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao obter extrato: " + ex.Message);
                }
            }
        }

        private void SelecionarPagamento(int idPagamento)
        {
            // Encontrar na listbox o item com esse ID
            for (int i = 0; i < listBoxPagamentos.Items.Count; i++)
            {
                string item = listBoxPagamentos.Items[i].ToString();
                if (item.StartsWith(idPagamento + " |"))
                {
                    listBoxPagamentos.SelectedIndex = i;
                    break;
                }
            }
        }

        private void listBoxPagamentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxPagamentos.SelectedIndex == -1) return;

            string item = listBoxPagamentos.SelectedItem.ToString();
            int idPag = int.Parse(item.Split('|')[0].Trim());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                        SELECT p.Id_Pagamento, u.Nome, c.Titulo, p.Valor, p.Estado, p.Metodo_Pag, p.Data
                        FROM Explicacao_Online.Pagamento p
                        JOIN Explicacao_Online.Utilizador u ON p.Id_Aluno = u.Id_Utilizador
                        JOIN Explicacao_Online.Curso c ON p.Cod_Curso = c.Cod_Curso
                        WHERE p.Id_Pagamento = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", idPag);
                    SqlDataReader r = cmd.ExecuteReader();

                    if (r.Read())
                    {
                        txtIdPag.Text = r["Id_Pagamento"].ToString();
                        txtUtilizador.Text = r["Nome"].ToString();
                        txtCurso.Text = r["Titulo"].ToString();
                        txtValor.Text = r["Valor"].ToString() + "€";
                        txtEstado.Text = r["Estado"].ToString();
                        txtMetodo.Text = r["Metodo_Pag"] != DBNull.Value ? r["Metodo_Pag"].ToString() : "";
                        txtData.Text = Convert.ToDateTime(r["Data"]).ToShortDateString();

                        txtEstado.BackColor = r["Estado"].ToString() == "Concluído"
                            ? System.Drawing.Color.LightGreen
                            : System.Drawing.Color.LightSalmon;
                    }
                    r.Close();

                    panelDetalhes.Visible = true;
                    listBoxPagamentos.Size = new System.Drawing.Size(280, 380);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao carregar pagamento: " + ex.Message);
                }
            }
        }

        private void btnConcluir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtIdPag.Text)) return;

            if (txtEstado.Text == "Concluído")
            {
                MessageBox.Show("Este pagamento já se encontra concluído!", "Informação",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (txtEstado.Text == "Cancelado")
            {
                MessageBox.Show("Não é possível processar este pagamento. A inscrição foi cancelada.", "Operação Bloqueada",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var confirm = MessageBox.Show(
                $"Confirmas o pagamento de {txtValor.Text} para o curso '{txtCurso.Text}'?",
                "Confirmar Pagamento",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question);
            if (confirm != DialogResult.Yes) return;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Explicacao_Online.processarPagamento", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdPagamento", int.Parse(txtIdPag.Text));
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Pagamento concluído com sucesso!", "Sucesso",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);

                    txtEstado.Text = "Concluído";
                    txtEstado.BackColor = System.Drawing.Color.LightGreen;
                    CarregarPagamentos();

                    SelecionarPagamento(int.Parse(txtIdPag.Text));
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao processar pagamento: " + ex.Message, "Erro",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnFechar_Click(object sender, EventArgs e)
        {
            panelDetalhes.Visible = false;
            listBoxPagamentos.Size = new System.Drawing.Size(790, 380);
            listBoxPagamentos.SelectedIndex = -1;
        }
    }
}