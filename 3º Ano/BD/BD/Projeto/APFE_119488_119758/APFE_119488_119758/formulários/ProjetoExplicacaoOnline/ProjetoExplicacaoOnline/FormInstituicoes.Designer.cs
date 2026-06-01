namespace ProjetoExplicacaoOnline
{
    partial class FormInstituicoes
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.listBoxInstituicoes = new System.Windows.Forms.ListBox();
            this.panelDetalhes = new System.Windows.Forms.Panel();
            this.lblId = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.lblNome = new System.Windows.Forms.Label();
            this.txtNome = new System.Windows.Forms.TextBox();
            this.lblLocalizacao = new System.Windows.Forms.Label();
            this.txtLocalizacao = new System.Windows.Forms.TextBox();
            this.lblSigla = new System.Windows.Forms.Label();
            this.txtSigla = new System.Windows.Forms.TextBox();
            this.lblTipo = new System.Windows.Forms.Label();
            this.cmbTipo = new System.Windows.Forms.ComboBox();
            this.lblAgrupamento = new System.Windows.Forms.Label();
            this.txtAgrupamento = new System.Windows.Forms.TextBox();
            this.lblRanking = new System.Windows.Forms.Label();
            this.txtRanking = new System.Windows.Forms.TextBox();
            this.lblAreaEsp = new System.Windows.Forms.Label();
            this.txtAreaEsp = new System.Windows.Forms.TextBox();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.SuspendLayout();

            // listBoxInstituicoes — ocupa tudo por defeito
            this.listBoxInstituicoes.Location = new System.Drawing.Point(0, 0);
            this.listBoxInstituicoes.Size = new System.Drawing.Size(280, 400);
            this.listBoxInstituicoes.SelectedIndexChanged += new System.EventHandler(this.listBoxInstituicoes_SelectedIndexChanged);

            // panelDetalhes — invisível por defeito
            this.panelDetalhes.Location = new System.Drawing.Point(295, 5);
            this.panelDetalhes.Size = new System.Drawing.Size(480, 390);
            this.panelDetalhes.Visible = false;

            // lblId
            this.lblId.AutoSize = true;
            this.lblId.Location = new System.Drawing.Point(100, 20);
            this.lblId.Text = "ID:";
            this.txtId.Location = new System.Drawing.Point(200, 17);
            this.txtId.Size = new System.Drawing.Size(80, 20);

            // lblNome
            this.lblNome.AutoSize = true;
            this.lblNome.Location = new System.Drawing.Point(83, 55);
            this.lblNome.Text = "Nome:";
            this.txtNome.Location = new System.Drawing.Point(200, 52);
            this.txtNome.Size = new System.Drawing.Size(250, 20);

            // lblLocalizacao
            this.lblLocalizacao.AutoSize = true;
            this.lblLocalizacao.Location = new System.Drawing.Point(63, 90);
            this.lblLocalizacao.Text = "Localização:";
            this.txtLocalizacao.Location = new System.Drawing.Point(200, 87);
            this.txtLocalizacao.Size = new System.Drawing.Size(250, 20);

            // lblSigla
            this.lblSigla.AutoSize = true;
            this.lblSigla.Location = new System.Drawing.Point(90, 125);
            this.lblSigla.Text = "Sigla:";
            this.txtSigla.Location = new System.Drawing.Point(200, 122);
            this.txtSigla.Size = new System.Drawing.Size(80, 20);

            // lblTipo
            this.lblTipo.AutoSize = true;
            this.lblTipo.Location = new System.Drawing.Point(90, 160);
            this.lblTipo.Text = "Tipo:";
            this.cmbTipo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipo.Items.AddRange(new object[] { "Escola Secundária", "Universidade", "Politécnico" });
            this.cmbTipo.Location = new System.Drawing.Point(200, 157);
            this.cmbTipo.Size = new System.Drawing.Size(150, 21);
            this.cmbTipo.SelectedIndexChanged += new System.EventHandler(this.cmbTipo_SelectedIndexChanged);

            // lblAgrupamento (só Escola Secundária)
            this.lblAgrupamento.AutoSize = true;
            this.lblAgrupamento.Location = new System.Drawing.Point(53, 195);
            this.lblAgrupamento.Text = "Agrupamento:";
            this.lblAgrupamento.Visible = false;
            this.txtAgrupamento.Location = new System.Drawing.Point(200, 192);
            this.txtAgrupamento.Size = new System.Drawing.Size(250, 20);
            this.txtAgrupamento.Visible = false;

            // lblRanking (só Universidade)
            this.lblRanking.AutoSize = true;
            this.lblRanking.Location = new System.Drawing.Point(73, 195);
            this.lblRanking.Text = "Ranking:";
            this.lblRanking.Visible = false;
            this.txtRanking.Location = new System.Drawing.Point(200, 192);
            this.txtRanking.Size = new System.Drawing.Size(80, 20);
            this.txtRanking.Visible = false;

            // lblAreaEsp (só Politécnico)
            this.lblAreaEsp.AutoSize = true;
            this.lblAreaEsp.Location = new System.Drawing.Point(43, 195);
            this.lblAreaEsp.Text = "Área Especialização:";
            this.lblAreaEsp.Visible = false;
            this.txtAreaEsp.Location = new System.Drawing.Point(200, 192);
            this.txtAreaEsp.Size = new System.Drawing.Size(250, 20);
            this.txtAreaEsp.Visible = false;

            // btnGuardar
            this.btnGuardar.Location = new System.Drawing.Point(100, 310);
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.Visible = false;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);

            // btnCancelar
            this.btnCancelar.Location = new System.Drawing.Point(200, 310);
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.Visible = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);

            // Adicionar ao panel
            this.panelDetalhes.Controls.Add(this.lblId);
            this.panelDetalhes.Controls.Add(this.txtId);
            this.panelDetalhes.Controls.Add(this.lblNome);
            this.panelDetalhes.Controls.Add(this.txtNome);
            this.panelDetalhes.Controls.Add(this.lblLocalizacao);
            this.panelDetalhes.Controls.Add(this.txtLocalizacao);
            this.panelDetalhes.Controls.Add(this.lblSigla);
            this.panelDetalhes.Controls.Add(this.txtSigla);
            this.panelDetalhes.Controls.Add(this.lblTipo);
            this.panelDetalhes.Controls.Add(this.cmbTipo);
            this.panelDetalhes.Controls.Add(this.lblAgrupamento);
            this.panelDetalhes.Controls.Add(this.txtAgrupamento);
            this.panelDetalhes.Controls.Add(this.lblRanking);
            this.panelDetalhes.Controls.Add(this.txtRanking);
            this.panelDetalhes.Controls.Add(this.lblAreaEsp);
            this.panelDetalhes.Controls.Add(this.txtAreaEsp);
            this.panelDetalhes.Controls.Add(this.btnGuardar);
            this.panelDetalhes.Controls.Add(this.btnCancelar);

            // btnAdd
            this.btnAdd.Location = new System.Drawing.Point(10, 410);
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.Text = "Adicionar";
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);

            // btnEdit
            this.btnEdit.Location = new System.Drawing.Point(95, 410);
            this.btnEdit.Size = new System.Drawing.Size(75, 23);
            this.btnEdit.Text = "Editar";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);

            // btnDelete
            this.btnDelete.Location = new System.Drawing.Point(180, 410);
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.Text = "Eliminar";
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);

            // Form
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(790, 445);
            this.Controls.Add(this.listBoxInstituicoes);
            this.Controls.Add(this.panelDetalhes);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnDelete);
            this.Name = "FormInstituicoes";
            this.Text = "Gestão de Instituições";
            this.Load += new System.EventHandler(this.FormInstituicoes_Load);
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        private System.Windows.Forms.ListBox listBoxInstituicoes;
        private System.Windows.Forms.Panel panelDetalhes;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.Label lblLocalizacao;
        private System.Windows.Forms.TextBox txtLocalizacao;
        private System.Windows.Forms.Label lblSigla;
        private System.Windows.Forms.TextBox txtSigla;
        private System.Windows.Forms.Label lblTipo;
        private System.Windows.Forms.ComboBox cmbTipo;
        private System.Windows.Forms.Label lblAgrupamento;
        private System.Windows.Forms.TextBox txtAgrupamento;
        private System.Windows.Forms.Label lblRanking;
        private System.Windows.Forms.TextBox txtRanking;
        private System.Windows.Forms.Label lblAreaEsp;
        private System.Windows.Forms.TextBox txtAreaEsp;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnDelete;
    }
}