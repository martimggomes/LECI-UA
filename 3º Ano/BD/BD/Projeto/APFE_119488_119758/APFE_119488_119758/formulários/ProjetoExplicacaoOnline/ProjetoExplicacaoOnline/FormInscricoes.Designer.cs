namespace ProjetoExplicacaoOnline
{
    partial class FormInscricoes
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.lblUtilizador = new System.Windows.Forms.Label();
            this.cmbUtilizador = new System.Windows.Forms.ComboBox();
            this.lblCurso = new System.Windows.Forms.Label();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.lblMetodoPag = new System.Windows.Forms.Label();
            this.cmbMetodoPag = new System.Windows.Forms.ComboBox();
            this.lblInfoCurso = new System.Windows.Forms.Label();
            this.txtInfoCurso = new System.Windows.Forms.TextBox();
            this.lblInfoUtilizador = new System.Windows.Forms.Label();
            this.txtInfoUtilizador = new System.Windows.Forms.TextBox();
            this.btnInscrever = new System.Windows.Forms.Button();
            this.listBoxInscricoes = new System.Windows.Forms.ListBox();
            this.lblLista = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.btnCancelarInscricao = new System.Windows.Forms.Button();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.contextMenuStrip2 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblUtilizador
            // 
            this.lblUtilizador.AutoSize = true;
            this.lblUtilizador.Location = new System.Drawing.Point(20, 20);
            this.lblUtilizador.Name = "lblUtilizador";
            this.lblUtilizador.Size = new System.Drawing.Size(53, 13);
            this.lblUtilizador.TabIndex = 0;
            this.lblUtilizador.Text = "Utilizador:";
            // 
            // cmbUtilizador
            // 
            this.cmbUtilizador.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbUtilizador.Location = new System.Drawing.Point(130, 17);
            this.cmbUtilizador.Name = "cmbUtilizador";
            this.cmbUtilizador.Size = new System.Drawing.Size(250, 21);
            this.cmbUtilizador.TabIndex = 1;
            this.cmbUtilizador.SelectedIndexChanged += new System.EventHandler(this.cmbUtilizador_SelectedIndexChanged);
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Location = new System.Drawing.Point(20, 90);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(37, 13);
            this.lblCurso.TabIndex = 4;
            this.lblCurso.Text = "Curso:";
            // 
            // cmbCurso
            // 
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Location = new System.Drawing.Point(130, 87);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(250, 21);
            this.cmbCurso.TabIndex = 5;
            this.cmbCurso.SelectedIndexChanged += new System.EventHandler(this.cmbCurso_SelectedIndexChanged);
            // 
            // lblMetodoPag
            // 
            this.lblMetodoPag.AutoSize = true;
            this.lblMetodoPag.Location = new System.Drawing.Point(20, 160);
            this.lblMetodoPag.Name = "lblMetodoPag";
            this.lblMetodoPag.Size = new System.Drawing.Size(103, 13);
            this.lblMetodoPag.TabIndex = 8;
            this.lblMetodoPag.Text = "Método Pagamento:";
            // 
            // cmbMetodoPag
            // 
            this.cmbMetodoPag.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMetodoPag.Items.AddRange(new object[] {
            "MBWay",
            "Transferência",
            "Cartão de Crédito",
            "PayPal"});
            this.cmbMetodoPag.Location = new System.Drawing.Point(130, 157);
            this.cmbMetodoPag.Name = "cmbMetodoPag";
            this.cmbMetodoPag.Size = new System.Drawing.Size(150, 21);
            this.cmbMetodoPag.TabIndex = 9;
            // 
            // lblInfoCurso
            // 
            this.lblInfoCurso.AutoSize = true;
            this.lblInfoCurso.Location = new System.Drawing.Point(20, 125);
            this.lblInfoCurso.Name = "lblInfoCurso";
            this.lblInfoCurso.Size = new System.Drawing.Size(58, 13);
            this.lblInfoCurso.TabIndex = 6;
            this.lblInfoCurso.Text = "Info Curso:";
            // 
            // txtInfoCurso
            // 
            this.txtInfoCurso.BackColor = System.Drawing.Color.LightYellow;
            this.txtInfoCurso.Location = new System.Drawing.Point(130, 122);
            this.txtInfoCurso.Name = "txtInfoCurso";
            this.txtInfoCurso.ReadOnly = true;
            this.txtInfoCurso.Size = new System.Drawing.Size(250, 20);
            this.txtInfoCurso.TabIndex = 7;
            // 
            // lblInfoUtilizador
            // 
            this.lblInfoUtilizador.AutoSize = true;
            this.lblInfoUtilizador.Location = new System.Drawing.Point(20, 55);
            this.lblInfoUtilizador.Name = "lblInfoUtilizador";
            this.lblInfoUtilizador.Size = new System.Drawing.Size(31, 13);
            this.lblInfoUtilizador.TabIndex = 2;
            this.lblInfoUtilizador.Text = "Tipo:";
            // 
            // txtInfoUtilizador
            // 
            this.txtInfoUtilizador.BackColor = System.Drawing.Color.LightYellow;
            this.txtInfoUtilizador.Location = new System.Drawing.Point(130, 52);
            this.txtInfoUtilizador.Name = "txtInfoUtilizador";
            this.txtInfoUtilizador.ReadOnly = true;
            this.txtInfoUtilizador.Size = new System.Drawing.Size(100, 20);
            this.txtInfoUtilizador.TabIndex = 3;
            // 
            // btnInscrever
            // 
            this.btnInscrever.Location = new System.Drawing.Point(130, 200);
            this.btnInscrever.Name = "btnInscrever";
            this.btnInscrever.Size = new System.Drawing.Size(100, 30);
            this.btnInscrever.TabIndex = 10;
            this.btnInscrever.Text = "Inscrever";
            this.btnInscrever.Click += new System.EventHandler(this.btnInscrever_Click);
            // 
            // listBoxInscricoes
            // 
            this.listBoxInscricoes.Location = new System.Drawing.Point(20, 270);
            this.listBoxInscricoes.Name = "listBoxInscricoes";
            this.listBoxInscricoes.Size = new System.Drawing.Size(650, 147);
            this.listBoxInscricoes.TabIndex = 12;
            this.listBoxInscricoes.SelectedIndexChanged += new System.EventHandler(this.listBoxInscricoes_SelectedIndexChanged);
            // 
            // lblLista
            // 
            this.lblLista.AutoSize = true;
            this.lblLista.Location = new System.Drawing.Point(20, 250);
            this.lblLista.Name = "lblLista";
            this.lblLista.Size = new System.Drawing.Size(108, 13);
            this.lblLista.TabIndex = 11;
            this.lblLista.Text = "Inscrições existentes:";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(390, 197);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(8, 8);
            this.button1.TabIndex = 13;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // btnCancelarInscricao
            // 
            this.btnCancelarInscricao.Location = new System.Drawing.Point(491, 125);
            this.btnCancelarInscricao.Name = "btnCancelarInscricao";
            this.btnCancelarInscricao.Size = new System.Drawing.Size(103, 21);
            this.btnCancelarInscricao.TabIndex = 14;
            this.btnCancelarInscricao.Text = "Cancelar Inscrição";
            this.btnCancelarInscricao.UseVisualStyleBackColor = true;
            this.btnCancelarInscricao.Click += new System.EventHandler(this.btnCancelarInscricao_Click);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // contextMenuStrip2
            // 
            this.contextMenuStrip2.Name = "contextMenuStrip2";
            this.contextMenuStrip2.Size = new System.Drawing.Size(61, 4);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(460, 109);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(172, 13);
            this.label1.TabIndex = 17;
            this.label1.Text = "Deseja cancelar alguma inscrição?";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // FormInscricoes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(700, 450);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnCancelarInscricao);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.lblUtilizador);
            this.Controls.Add(this.cmbUtilizador);
            this.Controls.Add(this.lblInfoUtilizador);
            this.Controls.Add(this.txtInfoUtilizador);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.cmbCurso);
            this.Controls.Add(this.lblInfoCurso);
            this.Controls.Add(this.txtInfoCurso);
            this.Controls.Add(this.lblMetodoPag);
            this.Controls.Add(this.cmbMetodoPag);
            this.Controls.Add(this.btnInscrever);
            this.Controls.Add(this.lblLista);
            this.Controls.Add(this.listBoxInscricoes);
            this.Name = "FormInscricoes";
            this.Text = "Inscrições";
            this.Load += new System.EventHandler(this.FormInscricoes_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private System.Windows.Forms.Label lblUtilizador;
        private System.Windows.Forms.ComboBox cmbUtilizador;
        private System.Windows.Forms.Label lblInfoUtilizador;
        private System.Windows.Forms.TextBox txtInfoUtilizador;
        private System.Windows.Forms.Label lblCurso;
        private System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.Label lblInfoCurso;
        private System.Windows.Forms.TextBox txtInfoCurso;
        private System.Windows.Forms.Label lblMetodoPag;
        private System.Windows.Forms.ComboBox cmbMetodoPag;
        private System.Windows.Forms.Button btnInscrever;
        private System.Windows.Forms.ListBox listBoxInscricoes;
        private System.Windows.Forms.Label lblLista;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnCancelarInscricao;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip2;
        private System.Windows.Forms.Label label1;
    }
}