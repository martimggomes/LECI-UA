namespace ProjetoExplicacaoOnline
{
    partial class FormAvaliacoes
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.listBoxAvaliacoes = new System.Windows.Forms.ListBox();
            this.panelDetalhes = new System.Windows.Forms.Panel();
            this.lblAluno = new System.Windows.Forms.Label();
            this.cmbAluno = new System.Windows.Forms.ComboBox();
            this.lblCurso = new System.Windows.Forms.Label();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.lblNota = new System.Windows.Forms.Label();
            this.cmbNota = new System.Windows.Forms.ComboBox();
            this.lblComentario = new System.Windows.Forms.Label();
            this.txtComentario = new System.Windows.Forms.TextBox();
            this.lblData = new System.Windows.Forms.Label();
            this.txtData = new System.Windows.Forms.TextBox();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.lblLista = new System.Windows.Forms.Label();
            this.SuspendLayout();

            // listBoxAvaliacoes — ocupa tudo por defeito
            this.listBoxAvaliacoes.Location = new System.Drawing.Point(0, 0);
            this.listBoxAvaliacoes.Size = new System.Drawing.Size(280, 380);
            this.listBoxAvaliacoes.SelectedIndexChanged += new System.EventHandler(this.listBoxAvaliacoes_SelectedIndexChanged);

            // panelDetalhes — invisível por defeito
            this.panelDetalhes.Location = new System.Drawing.Point(295, 5);
            this.panelDetalhes.Size = new System.Drawing.Size(480, 370);
            this.panelDetalhes.Visible = false;

            // lblAluno
            this.lblAluno.AutoSize = true;
            this.lblAluno.Location = new System.Drawing.Point(60, 20);
            this.lblAluno.Text = "Utilizador: ";
            this.cmbAluno.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAluno.Location = new System.Drawing.Point(180, 17);
            this.cmbAluno.Size = new System.Drawing.Size(250, 21);
            this.cmbAluno.SelectedIndexChanged += new System.EventHandler(this.cmbAluno_SelectedIndexChanged);

            // lblCurso
            this.lblCurso.AutoSize = true;
            this.lblCurso.Location = new System.Drawing.Point(60, 55);
            this.lblCurso.Text = "Curso:";
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Location = new System.Drawing.Point(180, 52);
            this.cmbCurso.Size = new System.Drawing.Size(250, 21);

            // lblNota
            this.lblNota.AutoSize = true;
            this.lblNota.Location = new System.Drawing.Point(60, 90);
            this.lblNota.Text = "Nota (1-5):";
            this.cmbNota.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbNota.Items.AddRange(new object[] { "1", "2", "3", "4", "5" });
            this.cmbNota.Location = new System.Drawing.Point(180, 87);
            this.cmbNota.Size = new System.Drawing.Size(60, 21);

            // lblComentario
            this.lblComentario.AutoSize = true;
            this.lblComentario.Location = new System.Drawing.Point(60, 125);
            this.lblComentario.Text = "Comentário:";
            this.txtComentario.Location = new System.Drawing.Point(180, 122);
            this.txtComentario.Size = new System.Drawing.Size(280, 60);
            this.txtComentario.Multiline = true;

            // lblData
            this.lblData.AutoSize = true;
            this.lblData.Location = new System.Drawing.Point(60, 200);
            this.lblData.Text = "Data:";
            this.txtData.Location = new System.Drawing.Point(180, 197);
            this.txtData.Size = new System.Drawing.Size(120, 20);
            this.txtData.ReadOnly = true;
            this.txtData.BackColor = System.Drawing.Color.LightYellow;

            // btnGuardar
            this.btnGuardar.Location = new System.Drawing.Point(100, 290);
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.Visible = false;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);

            // btnCancelar
            this.btnCancelar.Location = new System.Drawing.Point(200, 290);
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.Visible = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);

            // Adicionar ao panel
            this.panelDetalhes.Controls.Add(this.lblAluno);
            this.panelDetalhes.Controls.Add(this.cmbAluno);
            this.panelDetalhes.Controls.Add(this.lblCurso);
            this.panelDetalhes.Controls.Add(this.cmbCurso);
            this.panelDetalhes.Controls.Add(this.lblNota);
            this.panelDetalhes.Controls.Add(this.cmbNota);
            this.panelDetalhes.Controls.Add(this.lblComentario);
            this.panelDetalhes.Controls.Add(this.txtComentario);
            this.panelDetalhes.Controls.Add(this.lblData);
            this.panelDetalhes.Controls.Add(this.txtData);
            this.panelDetalhes.Controls.Add(this.btnGuardar);
            this.panelDetalhes.Controls.Add(this.btnCancelar);

            // btnAdd
            this.btnAdd.Location = new System.Drawing.Point(10, 390);
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.Text = "Adicionar";
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);

            // btnDelete
            this.btnDelete.Location = new System.Drawing.Point(95, 390);
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.Text = "Eliminar";
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);

            // lblLista
            this.lblLista.AutoSize = true;
            this.lblLista.Location = new System.Drawing.Point(10, 385);
            this.lblLista.Text = "";

            // Form
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(790, 425);
            this.Controls.Add(this.listBoxAvaliacoes);
            this.Controls.Add(this.panelDetalhes);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.lblLista);
            this.Name = "FormAvaliacoes";
            this.Text = "Avaliações";
            this.Load += new System.EventHandler(this.FormAvaliacoes_Load);
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        private System.Windows.Forms.ListBox listBoxAvaliacoes;
        private System.Windows.Forms.Panel panelDetalhes;
        private System.Windows.Forms.Label lblAluno;
        private System.Windows.Forms.ComboBox cmbAluno;
        private System.Windows.Forms.Label lblCurso;
        private System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.Label lblNota;
        private System.Windows.Forms.ComboBox cmbNota;
        private System.Windows.Forms.Label lblComentario;
        private System.Windows.Forms.TextBox txtComentario;
        private System.Windows.Forms.Label lblData;
        private System.Windows.Forms.TextBox txtData;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Label lblLista;
    }
}