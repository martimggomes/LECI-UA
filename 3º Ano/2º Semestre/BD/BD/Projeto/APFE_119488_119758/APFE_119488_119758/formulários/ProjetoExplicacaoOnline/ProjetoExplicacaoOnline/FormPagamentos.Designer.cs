namespace ProjetoExplicacaoOnline
{
    partial class FormPagamentos
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.listBoxPagamentos = new System.Windows.Forms.ListBox();
            this.panelDetalhes = new System.Windows.Forms.Panel();
            this.lblIdPag = new System.Windows.Forms.Label();
            this.txtIdPag = new System.Windows.Forms.TextBox();
            this.lblUtilizador = new System.Windows.Forms.Label();
            this.txtUtilizador = new System.Windows.Forms.TextBox();
            this.lblCurso = new System.Windows.Forms.Label();
            this.txtCurso = new System.Windows.Forms.TextBox();
            this.lblValor = new System.Windows.Forms.Label();
            this.txtValor = new System.Windows.Forms.TextBox();
            this.lblEstado = new System.Windows.Forms.Label();
            this.txtEstado = new System.Windows.Forms.TextBox();
            this.lblMetodo = new System.Windows.Forms.Label();
            this.txtMetodo = new System.Windows.Forms.TextBox();
            this.lblData = new System.Windows.Forms.Label();
            this.txtData = new System.Windows.Forms.TextBox();
            this.btnConcluir = new System.Windows.Forms.Button();
            this.btnFechar = new System.Windows.Forms.Button();
            this.lblExtrato = new System.Windows.Forms.Label();
            this.cmbExtratoUtilizador = new System.Windows.Forms.ComboBox();
            this.btnVerExtrato = new System.Windows.Forms.Button();
            this.SuspendLayout();

            // listBoxPagamentos
            this.listBoxPagamentos.Location = new System.Drawing.Point(0, 0);
            this.listBoxPagamentos.Size = new System.Drawing.Size(280, 380);
            this.listBoxPagamentos.SelectedIndexChanged += new System.EventHandler(this.listBoxPagamentos_SelectedIndexChanged);

            // panelDetalhes
            this.panelDetalhes.Location = new System.Drawing.Point(295, 5);
            this.panelDetalhes.Size = new System.Drawing.Size(480, 370);
            this.panelDetalhes.Visible = false;

            // lblIdPag
            this.lblIdPag.AutoSize = true;
            this.lblIdPag.Location = new System.Drawing.Point(20, 20);
            this.lblIdPag.Text = "ID Pagamento:";
            this.txtIdPag.Location = new System.Drawing.Point(180, 17);
            this.txtIdPag.Size = new System.Drawing.Size(80, 20);
            this.txtIdPag.ReadOnly = true;

            // lblUtilizador
            this.lblUtilizador.AutoSize = true;
            this.lblUtilizador.Location = new System.Drawing.Point(20, 55);
            this.lblUtilizador.Text = "Utilizador:";
            this.txtUtilizador.Location = new System.Drawing.Point(180, 52);
            this.txtUtilizador.Size = new System.Drawing.Size(250, 20);
            this.txtUtilizador.ReadOnly = true;

            // lblCurso
            this.lblCurso.AutoSize = true;
            this.lblCurso.Location = new System.Drawing.Point(20, 90);
            this.lblCurso.Text = "Curso:";
            this.txtCurso.Location = new System.Drawing.Point(180, 87);
            this.txtCurso.Size = new System.Drawing.Size(250, 20);
            this.txtCurso.ReadOnly = true;

            // lblValor
            this.lblValor.AutoSize = true;
            this.lblValor.Location = new System.Drawing.Point(20, 125);
            this.lblValor.Text = "Valor:";
            this.txtValor.Location = new System.Drawing.Point(180, 122);
            this.txtValor.Size = new System.Drawing.Size(80, 20);
            this.txtValor.ReadOnly = true;

            // lblEstado
            this.lblEstado.AutoSize = true;
            this.lblEstado.Location = new System.Drawing.Point(20, 160);
            this.lblEstado.Text = "Estado:";
            this.txtEstado.Location = new System.Drawing.Point(180, 157);
            this.txtEstado.Size = new System.Drawing.Size(100, 20);
            this.txtEstado.ReadOnly = true;

            // lblMetodo
            this.lblMetodo.AutoSize = true;
            this.lblMetodo.Location = new System.Drawing.Point(20, 195);
            this.lblMetodo.Text = "Método Pag.:";
            this.txtMetodo.Location = new System.Drawing.Point(180, 192);
            this.txtMetodo.Size = new System.Drawing.Size(150, 20);
            this.txtMetodo.ReadOnly = true;

            // lblData
            this.lblData.AutoSize = true;
            this.lblData.Location = new System.Drawing.Point(20, 230);
            this.lblData.Text = "Data:";
            this.txtData.Location = new System.Drawing.Point(180, 227);
            this.txtData.Size = new System.Drawing.Size(120, 20);
            this.txtData.ReadOnly = true;

            // btnConcluir
            this.btnConcluir.Location = new System.Drawing.Point(80, 290);
            this.btnConcluir.Size = new System.Drawing.Size(130, 30);
            this.btnConcluir.Text = "Concluir Pagamento";
            this.btnConcluir.Click += new System.EventHandler(this.btnConcluir_Click);

            // btnFechar
            this.btnFechar.Location = new System.Drawing.Point(230, 290);
            this.btnFechar.Size = new System.Drawing.Size(75, 30);
            this.btnFechar.Text = "Fechar";
            this.btnFechar.Click += new System.EventHandler(this.btnFechar_Click);

            // Adicionar ao panel
            this.panelDetalhes.Controls.Add(this.lblIdPag);
            this.panelDetalhes.Controls.Add(this.txtIdPag);
            this.panelDetalhes.Controls.Add(this.lblUtilizador);
            this.panelDetalhes.Controls.Add(this.txtUtilizador);
            this.panelDetalhes.Controls.Add(this.lblCurso);
            this.panelDetalhes.Controls.Add(this.txtCurso);
            this.panelDetalhes.Controls.Add(this.lblValor);
            this.panelDetalhes.Controls.Add(this.txtValor);
            this.panelDetalhes.Controls.Add(this.lblEstado);
            this.panelDetalhes.Controls.Add(this.txtEstado);
            this.panelDetalhes.Controls.Add(this.lblMetodo);
            this.panelDetalhes.Controls.Add(this.txtMetodo);
            this.panelDetalhes.Controls.Add(this.lblData);
            this.panelDetalhes.Controls.Add(this.txtData);
            this.panelDetalhes.Controls.Add(this.btnConcluir);
            this.panelDetalhes.Controls.Add(this.btnFechar);

            // lblExtrato
            this.lblExtrato.AutoSize = true;
            this.lblExtrato.Location = new System.Drawing.Point(10, 390);
            this.lblExtrato.Text = "Extrato de:";

            // cmbExtratoUtilizador
            this.cmbExtratoUtilizador.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbExtratoUtilizador.Location = new System.Drawing.Point(90, 387);
            this.cmbExtratoUtilizador.Size = new System.Drawing.Size(200, 21);

            // btnVerExtrato
            this.btnVerExtrato.Location = new System.Drawing.Point(305, 385);
            this.btnVerExtrato.Size = new System.Drawing.Size(100, 25);
            this.btnVerExtrato.Text = "Ver Extrato";
            this.btnVerExtrato.Click += new System.EventHandler(this.btnVerExtrato_Click);

            // Form
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(790, 425);
            this.Controls.Add(this.listBoxPagamentos);
            this.Controls.Add(this.panelDetalhes);
            this.Controls.Add(this.lblExtrato);
            this.Controls.Add(this.cmbExtratoUtilizador);
            this.Controls.Add(this.btnVerExtrato);
            this.Name = "FormPagamentos";
            this.Text = "Pagamentos";
            this.Load += new System.EventHandler(this.FormPagamentos_Load);
            this.ResumeLayout(false);
            this.PerformLayout();
        }
        private System.Windows.Forms.Label lblExtrato;
        private System.Windows.Forms.ComboBox cmbExtratoUtilizador;
        private System.Windows.Forms.Button btnVerExtrato;
        private System.Windows.Forms.ListBox listBoxPagamentos;
        private System.Windows.Forms.Panel panelDetalhes;
        private System.Windows.Forms.Label lblIdPag;
        private System.Windows.Forms.TextBox txtIdPag;
        private System.Windows.Forms.Label lblUtilizador;
        private System.Windows.Forms.TextBox txtUtilizador;
        private System.Windows.Forms.Label lblCurso;
        private System.Windows.Forms.TextBox txtCurso;
        private System.Windows.Forms.Label lblValor;
        private System.Windows.Forms.TextBox txtValor;
        private System.Windows.Forms.Label lblEstado;
        private System.Windows.Forms.TextBox txtEstado;
        private System.Windows.Forms.Label lblMetodo;
        private System.Windows.Forms.TextBox txtMetodo;
        private System.Windows.Forms.Label lblData;
        private System.Windows.Forms.TextBox txtData;
        private System.Windows.Forms.Button btnConcluir;
        private System.Windows.Forms.Button btnFechar;
    }
}