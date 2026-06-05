using System;
using System.Drawing;
using System.Windows.Forms;

namespace ProjetoExplicacaoOnline
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            AplicarEstiloBotoes();
        }

        private void AplicarEstiloBotoes()
        {
            this.BackColor = Color.White;

            panelTopo.BackColor = Color.FromArgb(245, 245, 245);

            lblTitulo.ForeColor = Color.FromArgb(40, 40, 40);
            lblTitulo.Font = new Font("Segoe UI", 22F, FontStyle.Bold);
            lblTitulo.Text = "Explicações Online";

            panelTopo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;

            panelBotoes.BackColor = Color.White;

            Button[] botoesNormais = { button1, button2, button3, button4, button5, button6 };
            foreach (Button btn in botoesNormais)
            {
                btn.BackColor = Color.White;
                btn.ForeColor = Color.FromArgb(50, 50, 50);
                btn.Font = new Font("Segoe UI", 9.5F);
                btn.FlatStyle = FlatStyle.Flat;
                btn.FlatAppearance.BorderColor = Color.FromArgb(200, 200, 200);
                btn.FlatAppearance.BorderSize = 1;
                btn.FlatAppearance.MouseOverBackColor = Color.FromArgb(245, 245, 245);
                btn.Cursor = Cursors.Hand;
            }

            button7.BackColor = Color.White;
            button7.ForeColor = Color.FromArgb(180, 50, 50);
            button7.Font = new Font("Segoe UI", 9.5F);
            button7.FlatStyle = FlatStyle.Flat;
            button7.FlatAppearance.BorderColor = Color.FromArgb(180, 50, 50);
            button7.FlatAppearance.BorderSize = 1;
            button7.FlatAppearance.MouseOverBackColor = Color.FromArgb(255, 245, 245);
            button7.Cursor = Cursors.Hand;
        }

        private void Form1_Load(object sender, EventArgs e) { }

        private void button1_Click(object sender, EventArgs e)
        {
            new FormUtilizadores().Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            new FormInstituicoes().Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            new FormCursos().Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            new FormInscricoes().Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            new FormPagamentos().Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            new FormAvaliacoes().Show();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            var confirm = MessageBox.Show("Tens a certeza que queres sair?", "Sair",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (confirm == DialogResult.Yes)
                Application.Exit();
        }
    }
}