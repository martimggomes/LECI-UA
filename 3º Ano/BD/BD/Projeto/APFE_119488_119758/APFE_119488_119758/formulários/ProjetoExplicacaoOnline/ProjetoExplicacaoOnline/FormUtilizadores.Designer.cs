namespace ProjetoExplicacaoOnline
{
    partial class FormUtilizadores
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.listBoxUtilizadores = new System.Windows.Forms.ListBox();
            this.panelDetalhes = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtNome = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.dtpDataReg = new System.Windows.Forms.DateTimePicker();
            this.lblTipoUtilizador = new System.Windows.Forms.Label();
            this.cmbTipoUtilizador = new System.Windows.Forms.ComboBox();
            this.lblDataNasc = new System.Windows.Forms.Label();
            this.dtpDataNasc = new System.Windows.Forms.DateTimePicker();
            this.lblInstituicao = new System.Windows.Forms.Label();
            this.cmbInstituicao = new System.Windows.Forms.ComboBox();
            this.lblEspecialidade = new System.Windows.Forms.Label();
            this.txtEspecialidade = new System.Windows.Forms.TextBox();
            this.lblBiografia = new System.Windows.Forms.Label();
            this.txtBiografia = new System.Windows.Forms.TextBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.SuspendLayout();

            // listBoxUtilizadores
            this.listBoxUtilizadores.Location = new System.Drawing.Point(0, 0);
            this.listBoxUtilizadores.Size = new System.Drawing.Size(700, 400);
            this.listBoxUtilizadores.SelectedIndexChanged += new System.EventHandler(this.listBoxUtilizadores_SelectedIndexChanged);

            // panelDetalhes
            this.panelDetalhes.Location = new System.Drawing.Point(185, 5);
            this.panelDetalhes.Size = new System.Drawing.Size(500, 380);
            this.panelDetalhes.Visible = false;

            // label1 (ID)
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(100, 20);
            this.label1.Text = "ID:";

            // txtId
            this.txtId.Location = new System.Drawing.Point(200, 17);
            this.txtId.Size = new System.Drawing.Size(80, 20);

            // label2 (Nome)
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(83, 55);
            this.label2.Text = "Nome:";

            // txtNome
            this.txtNome.Location = new System.Drawing.Point(200, 52);
            this.txtNome.Size = new System.Drawing.Size(200, 20);

            // label3 (Email)
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(83, 90);
            this.label3.Text = "Email:";

            // txtEmail
            this.txtEmail.Location = new System.Drawing.Point(200, 87);
            this.txtEmail.Size = new System.Drawing.Size(200, 20);

            // label4 (Data Registo)
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(49, 125);
            this.label4.Text = "Data Registo:";

            // dtpDataReg
            this.dtpDataReg.Location = new System.Drawing.Point(200, 122);
            this.dtpDataReg.Size = new System.Drawing.Size(200, 20);

            // lblTipoUtilizador
            this.lblTipoUtilizador.AutoSize = true;
            this.lblTipoUtilizador.Location = new System.Drawing.Point(40, 160);
            this.lblTipoUtilizador.Text = "Tipo Utilizador:";

            // cmbTipoUtilizador
            this.cmbTipoUtilizador.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipoUtilizador.Items.AddRange(new object[] { "Aluno", "Formador" });
            this.cmbTipoUtilizador.Location = new System.Drawing.Point(200, 157);
            this.cmbTipoUtilizador.Size = new System.Drawing.Size(120, 21);
            this.cmbTipoUtilizador.SelectedIndexChanged += new System.EventHandler(this.cmbTipoUtilizador_SelectedIndexChanged);

            // lblDataNasc
            this.lblDataNasc.AutoSize = true;
            this.lblDataNasc.Location = new System.Drawing.Point(32, 195);
            this.lblDataNasc.Text = "Data Nascimento:";
            this.lblDataNasc.Visible = false;

            // dtpDataNasc
            this.dtpDataNasc.Location = new System.Drawing.Point(200, 192);
            this.dtpDataNasc.Size = new System.Drawing.Size(200, 20);
            this.dtpDataNasc.Visible = false;

            // lblInstituicao
            this.lblInstituicao.AutoSize = true;
            this.lblInstituicao.Location = new System.Drawing.Point(63, 230);
            this.lblInstituicao.Text = "Instituição:";
            this.lblInstituicao.Visible = false;

            // cmbInstituicao
            this.cmbInstituicao.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbInstituicao.Location = new System.Drawing.Point(200, 227);
            this.cmbInstituicao.Size = new System.Drawing.Size(200, 21);
            this.cmbInstituicao.Visible = false;

            // lblEspecialidade
            this.lblEspecialidade.AutoSize = true;
            this.lblEspecialidade.Location = new System.Drawing.Point(45, 195);
            this.lblEspecialidade.Text = "Especialidade:";
            this.lblEspecialidade.Visible = false;

            // txtEspecialidade
            this.txtEspecialidade.Location = new System.Drawing.Point(200, 192);
            this.txtEspecialidade.Size = new System.Drawing.Size(200, 20);
            this.txtEspecialidade.Visible = false;

            // lblBiografia
            this.lblBiografia.AutoSize = true;
            this.lblBiografia.Location = new System.Drawing.Point(63, 230);
            this.lblBiografia.Text = "Biografia:";
            this.lblBiografia.Visible = false;

            // txtBiografia
            this.txtBiografia.Location = new System.Drawing.Point(200, 227);
            this.txtBiografia.Size = new System.Drawing.Size(200, 60);
            this.txtBiografia.Multiline = true;
            this.txtBiografia.Visible = false;

            // btnGuardar
            this.btnGuardar.Location = new System.Drawing.Point(100, 320);
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);

            // btnCancelar
            this.btnCancelar.Location = new System.Drawing.Point(200, 320);
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);

            // Adicionar tudo ao panel
            this.panelDetalhes.Controls.Add(this.label1);
            this.panelDetalhes.Controls.Add(this.txtId);
            this.panelDetalhes.Controls.Add(this.label2);
            this.panelDetalhes.Controls.Add(this.txtNome);
            this.panelDetalhes.Controls.Add(this.label3);
            this.panelDetalhes.Controls.Add(this.txtEmail);
            this.panelDetalhes.Controls.Add(this.label4);
            this.panelDetalhes.Controls.Add(this.dtpDataReg);
            this.panelDetalhes.Controls.Add(this.lblTipoUtilizador);
            this.panelDetalhes.Controls.Add(this.cmbTipoUtilizador);
            this.panelDetalhes.Controls.Add(this.lblDataNasc);
            this.panelDetalhes.Controls.Add(this.dtpDataNasc);
            this.panelDetalhes.Controls.Add(this.lblInstituicao);
            this.panelDetalhes.Controls.Add(this.cmbInstituicao);
            this.panelDetalhes.Controls.Add(this.lblEspecialidade);
            this.panelDetalhes.Controls.Add(this.txtEspecialidade);
            this.panelDetalhes.Controls.Add(this.lblBiografia);
            this.panelDetalhes.Controls.Add(this.txtBiografia);
            this.panelDetalhes.Controls.Add(this.btnGuardar);
            this.panelDetalhes.Controls.Add(this.btnCancelar);

            // btnAdd
            this.btnAdd.Location = new System.Drawing.Point(10, 400);
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.Text = "Adicionar";
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click_1);

            // btnEdit
            this.btnEdit.Location = new System.Drawing.Point(95, 400);
            this.btnEdit.Size = new System.Drawing.Size(75, 23);
            this.btnEdit.Text = "Editar";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);

            // btnDelete
            this.btnDelete.Location = new System.Drawing.Point(180, 400);
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.Text = "Eliminar";
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);

            this.btnGuardar.Visible = false;
            this.btnCancelar.Visible = false;

            // Form
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(700, 440);
            this.Controls.Add(this.listBoxUtilizadores);
            this.Controls.Add(this.panelDetalhes);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnDelete);
            this.Name = "FormUtilizadores";
            this.Text = "Gestão de Utilizadores";
            this.Load += new System.EventHandler(this.FormUtilizadores_Load);
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        // Declarações — apenas UMA vez cada
        private System.Windows.Forms.ListBox listBoxUtilizadores;
        private System.Windows.Forms.Panel panelDetalhes;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.DateTimePicker dtpDataReg;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Label lblTipoUtilizador;
        private System.Windows.Forms.ComboBox cmbTipoUtilizador;
        private System.Windows.Forms.Label lblDataNasc;
        private System.Windows.Forms.DateTimePicker dtpDataNasc;
        private System.Windows.Forms.Label lblInstituicao;
        private System.Windows.Forms.ComboBox cmbInstituicao;
        private System.Windows.Forms.Label lblEspecialidade;
        private System.Windows.Forms.TextBox txtEspecialidade;
        private System.Windows.Forms.Label lblBiografia;
        private System.Windows.Forms.TextBox txtBiografia;
    }
}