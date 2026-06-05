namespace ProjetoExplicacaoOnline
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.lblTitulo = new System.Windows.Forms.Label();
            this.panelTopo = new System.Windows.Forms.Panel();
            this.panelBotoes = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.panelTopo.SuspendLayout();
            this.panelBotoes.SuspendLayout();
            this.SuspendLayout();

            // panelTopo — faixa azul no topo
            this.panelTopo.BackColor = System.Drawing.Color.FromArgb(31, 97, 141);
            this.panelTopo.Location = new System.Drawing.Point(0, 0);
            this.panelTopo.Size = new System.Drawing.Size(900, 110);
            this.panelTopo.Controls.Add(this.lblTitulo);

            // lblTitulo
            this.lblTitulo.AutoSize = false;
            this.lblTitulo.Location = new System.Drawing.Point(0, 15);
            this.lblTitulo.Size = new System.Drawing.Size(900, 50);
            this.lblTitulo.Text = "📚  Explicações Online";
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 26F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            

            // panelBotoes — fundo cinzento claro
            this.panelBotoes.BackColor = System.Drawing.Color.FromArgb(240, 244, 248);
            this.panelBotoes.Location = new System.Drawing.Point(0, 110);
            this.panelBotoes.Size = new System.Drawing.Size(900, 390);
            this.panelBotoes.Controls.Add(this.button1);
            this.panelBotoes.Controls.Add(this.button2);
            this.panelBotoes.Controls.Add(this.button3);
            this.panelBotoes.Controls.Add(this.button4);
            this.panelBotoes.Controls.Add(this.button5);
            this.panelBotoes.Controls.Add(this.button6);
            this.panelBotoes.Controls.Add(this.button7);

            // Estilo base dos botões — definido via código no Form1.cs

            // Linha 1
            // button1 — Gestão de Utilizadores
            this.button1.Location = new System.Drawing.Point(60, 40);
            this.button1.Size = new System.Drawing.Size(220, 90);
            this.button1.Text = "Gestão de\nUtilizadores";
            this.button1.TabStop = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);

            // button2 — Gestão de Instituições
            this.button2.Location = new System.Drawing.Point(340, 40);
            this.button2.Size = new System.Drawing.Size(220, 90);
            this.button2.Text = "Gestão de\nInstituições";
            this.button2.TabStop = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);

            // button3 — Catálogo de Cursos
            this.button3.Location = new System.Drawing.Point(620, 40);
            this.button3.Size = new System.Drawing.Size(220, 90);
            this.button3.Text = "Catálogo\nde Cursos";
            this.button3.TabStop = false;
            this.button3.Click += new System.EventHandler(this.button3_Click);

            // Linha 2
            // button4 — Inscrições
            this.button4.Location = new System.Drawing.Point(60, 165);
            this.button4.Size = new System.Drawing.Size(220, 90);
            this.button4.Text = "Inscrições";
            this.button4.TabStop = false;
            this.button4.Click += new System.EventHandler(this.button4_Click);

            // button5 — Pagamentos
            this.button5.Location = new System.Drawing.Point(340, 165);
            this.button5.Size = new System.Drawing.Size(220, 90);
            this.button5.Text = "Pagamentos";
            this.button5.TabStop = false;
            this.button5.Click += new System.EventHandler(this.button5_Click);

            // button6 — Avaliações
            this.button6.Location = new System.Drawing.Point(620, 165);
            this.button6.Size = new System.Drawing.Size(220, 90);
            this.button6.Text = "Avaliações";
            this.button6.TabStop = false;
            this.button6.Click += new System.EventHandler(this.button6_Click);

            // Linha 3 — Sair centrado
            // button7 — Sair
            this.button7.Location = new System.Drawing.Point(340, 285);
            this.button7.Size = new System.Drawing.Size(220, 70);
            this.button7.Text = "Sair";
            this.button7.TabStop = false;
            this.button7.Click += new System.EventHandler(this.button7_Click);

            // Form
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(900, 500);
            this.Controls.Add(this.panelTopo);
            this.Controls.Add(this.panelBotoes);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "Explicações Online";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panelTopo.ResumeLayout(false);
            this.panelBotoes.ResumeLayout(false);
            this.ResumeLayout(false);
        }

        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Panel panelTopo;
        private System.Windows.Forms.Panel panelBotoes;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button7;
    }
}