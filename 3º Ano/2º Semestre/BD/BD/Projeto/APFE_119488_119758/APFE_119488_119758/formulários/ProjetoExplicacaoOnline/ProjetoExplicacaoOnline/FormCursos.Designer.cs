namespace ProjetoExplicacaoOnline
{
    partial class FormCursos
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.btnFiltros = new System.Windows.Forms.Button();
            this.listBoxCursos = new System.Windows.Forms.ListBox();
            this.panelDetalhes = new System.Windows.Forms.Panel();
            this.lblCodCurso = new System.Windows.Forms.Label();
            this.txtCodCurso = new System.Windows.Forms.TextBox();
            this.lblTitulo = new System.Windows.Forms.Label();
            this.txtTitulo = new System.Windows.Forms.TextBox();
            this.lblDescricao = new System.Windows.Forms.Label();
            this.txtDescricao = new System.Windows.Forms.TextBox();
            this.lblDificuldade = new System.Windows.Forms.Label();
            this.cmbDificuldade = new System.Windows.Forms.ComboBox();
            this.lblPreco = new System.Windows.Forms.Label();
            this.txtPreco = new System.Windows.Forms.TextBox();
            this.lblFormador = new System.Windows.Forms.Label();
            this.cmbFormador = new System.Windows.Forms.ComboBox();
            this.lblMediaAval = new System.Windows.Forms.Label();
            this.txtMediaAval = new System.Windows.Forms.TextBox();
            this.lblTotalInscritos = new System.Windows.Forms.Label();
            this.txtTotalInscritos = new System.Windows.Forms.TextBox();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.panelDetalhes.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnFiltros
            // 
            this.btnFiltros.Location = new System.Drawing.Point(398, 631);
            this.btnFiltros.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnFiltros.Name = "btnFiltros";
            this.btnFiltros.Size = new System.Drawing.Size(112, 35);
            this.btnFiltros.TabIndex = 5;
            this.btnFiltros.Text = "Filtros";
            this.btnFiltros.Click += new System.EventHandler(this.btnFiltros_Click);
            // 
            // listBoxCursos
            // 
            this.listBoxCursos.ItemHeight = 20;
            this.listBoxCursos.Location = new System.Drawing.Point(0, 0);
            this.listBoxCursos.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.listBoxCursos.Name = "listBoxCursos";
            this.listBoxCursos.Size = new System.Drawing.Size(1123, 604);
            this.listBoxCursos.TabIndex = 0;
            this.listBoxCursos.SelectedIndexChanged += new System.EventHandler(this.listBoxCursos_SelectedIndexChanged);
            // 
            // panelDetalhes
            // 
            this.panelDetalhes.Controls.Add(this.lblCodCurso);
            this.panelDetalhes.Controls.Add(this.txtCodCurso);
            this.panelDetalhes.Controls.Add(this.lblTitulo);
            this.panelDetalhes.Controls.Add(this.txtTitulo);
            this.panelDetalhes.Controls.Add(this.lblDescricao);
            this.panelDetalhes.Controls.Add(this.txtDescricao);
            this.panelDetalhes.Controls.Add(this.lblDificuldade);
            this.panelDetalhes.Controls.Add(this.cmbDificuldade);
            this.panelDetalhes.Controls.Add(this.lblPreco);
            this.panelDetalhes.Controls.Add(this.txtPreco);
            this.panelDetalhes.Controls.Add(this.lblFormador);
            this.panelDetalhes.Controls.Add(this.cmbFormador);
            this.panelDetalhes.Controls.Add(this.lblMediaAval);
            this.panelDetalhes.Controls.Add(this.txtMediaAval);
            this.panelDetalhes.Controls.Add(this.lblTotalInscritos);
            this.panelDetalhes.Controls.Add(this.txtTotalInscritos);
            this.panelDetalhes.Controls.Add(this.btnGuardar);
            this.panelDetalhes.Controls.Add(this.btnCancelar);
            this.panelDetalhes.Location = new System.Drawing.Point(300, 8);
            this.panelDetalhes.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panelDetalhes.Name = "panelDetalhes";
            this.panelDetalhes.Size = new System.Drawing.Size(840, 585);
            this.panelDetalhes.TabIndex = 1;
            this.panelDetalhes.Visible = false;
            // 
            // lblCodCurso
            // 
            this.lblCodCurso.AutoSize = true;
            this.lblCodCurso.Location = new System.Drawing.Point(90, 31);
            this.lblCodCurso.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblCodCurso.Name = "lblCodCurso";
            this.lblCodCurso.Size = new System.Drawing.Size(63, 20);
            this.lblCodCurso.TabIndex = 0;
            this.lblCodCurso.Text = "Código:";
            // 
            // txtCodCurso
            // 
            this.txtCodCurso.Location = new System.Drawing.Point(270, 26);
            this.txtCodCurso.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtCodCurso.Name = "txtCodCurso";
            this.txtCodCurso.Size = new System.Drawing.Size(118, 26);
            this.txtCodCurso.TabIndex = 1;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Location = new System.Drawing.Point(90, 85);
            this.lblTitulo.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(51, 20);
            this.lblTitulo.TabIndex = 2;
            this.lblTitulo.Text = "Título:";
            // 
            // txtTitulo
            // 
            this.txtTitulo.Location = new System.Drawing.Point(270, 80);
            this.txtTitulo.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTitulo.Name = "txtTitulo";
            this.txtTitulo.Size = new System.Drawing.Size(373, 26);
            this.txtTitulo.TabIndex = 3;
            // 
            // lblDescricao
            // 
            this.lblDescricao.AutoSize = true;
            this.lblDescricao.Location = new System.Drawing.Point(90, 138);
            this.lblDescricao.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblDescricao.Name = "lblDescricao";
            this.lblDescricao.Size = new System.Drawing.Size(84, 20);
            this.lblDescricao.TabIndex = 4;
            this.lblDescricao.Text = "Descrição:";
            // 
            // txtDescricao
            // 
            this.txtDescricao.Location = new System.Drawing.Point(270, 134);
            this.txtDescricao.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtDescricao.Multiline = true;
            this.txtDescricao.Name = "txtDescricao";
            this.txtDescricao.Size = new System.Drawing.Size(373, 82);
            this.txtDescricao.TabIndex = 5;
            // 
            // lblDificuldade
            // 
            this.lblDificuldade.AutoSize = true;
            this.lblDificuldade.Location = new System.Drawing.Point(90, 243);
            this.lblDificuldade.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblDificuldade.Name = "lblDificuldade";
            this.lblDificuldade.Size = new System.Drawing.Size(92, 20);
            this.lblDificuldade.TabIndex = 6;
            this.lblDificuldade.Text = "Dificuldade:";
            // 
            // cmbDificuldade
            // 
            this.cmbDificuldade.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDificuldade.Items.AddRange(new object[] {
            "Iniciante",
            "Intermédio",
            "Avançado"});
            this.cmbDificuldade.Location = new System.Drawing.Point(270, 238);
            this.cmbDificuldade.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cmbDificuldade.Name = "cmbDificuldade";
            this.cmbDificuldade.Size = new System.Drawing.Size(178, 28);
            this.cmbDificuldade.TabIndex = 7;
            // 
            // lblPreco
            // 
            this.lblPreco.AutoSize = true;
            this.lblPreco.Location = new System.Drawing.Point(90, 297);
            this.lblPreco.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblPreco.Name = "lblPreco";
            this.lblPreco.Size = new System.Drawing.Size(77, 20);
            this.lblPreco.TabIndex = 8;
            this.lblPreco.Text = "Preço (€):";
            // 
            // txtPreco
            // 
            this.txtPreco.Location = new System.Drawing.Point(270, 292);
            this.txtPreco.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtPreco.Name = "txtPreco";
            this.txtPreco.Size = new System.Drawing.Size(118, 26);
            this.txtPreco.TabIndex = 9;
            // 
            // lblFormador
            // 
            this.lblFormador.AutoSize = true;
            this.lblFormador.Location = new System.Drawing.Point(90, 351);
            this.lblFormador.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblFormador.Name = "lblFormador";
            this.lblFormador.Size = new System.Drawing.Size(82, 20);
            this.lblFormador.TabIndex = 10;
            this.lblFormador.Text = "Formador:";
            // 
            // cmbFormador
            // 
            this.cmbFormador.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbFormador.Location = new System.Drawing.Point(270, 346);
            this.cmbFormador.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cmbFormador.Name = "cmbFormador";
            this.cmbFormador.Size = new System.Drawing.Size(373, 28);
            this.cmbFormador.TabIndex = 11;
            // 
            // lblMediaAval
            // 
            this.lblMediaAval.AutoSize = true;
            this.lblMediaAval.Location = new System.Drawing.Point(90, 408);
            this.lblMediaAval.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMediaAval.Name = "lblMediaAval";
            this.lblMediaAval.Size = new System.Drawing.Size(136, 20);
            this.lblMediaAval.TabIndex = 12;
            this.lblMediaAval.Text = "Média Avaliações:";
            // 
            // txtMediaAval
            // 
            this.txtMediaAval.BackColor = System.Drawing.Color.LightYellow;
            this.txtMediaAval.Location = new System.Drawing.Point(270, 403);
            this.txtMediaAval.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtMediaAval.Name = "txtMediaAval";
            this.txtMediaAval.ReadOnly = true;
            this.txtMediaAval.Size = new System.Drawing.Size(88, 26);
            this.txtMediaAval.TabIndex = 13;
            // 
            // lblTotalInscritos
            // 
            this.lblTotalInscritos.AutoSize = true;
            this.lblTotalInscritos.Location = new System.Drawing.Point(90, 462);
            this.lblTotalInscritos.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTotalInscritos.Name = "lblTotalInscritos";
            this.lblTotalInscritos.Size = new System.Drawing.Size(112, 20);
            this.lblTotalInscritos.TabIndex = 14;
            this.lblTotalInscritos.Text = "Total Inscritos:";
            // 
            // txtTotalInscritos
            // 
            this.txtTotalInscritos.BackColor = System.Drawing.Color.LightYellow;
            this.txtTotalInscritos.Location = new System.Drawing.Point(270, 457);
            this.txtTotalInscritos.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTotalInscritos.Name = "txtTotalInscritos";
            this.txtTotalInscritos.ReadOnly = true;
            this.txtTotalInscritos.Size = new System.Drawing.Size(88, 26);
            this.txtTotalInscritos.TabIndex = 15;
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(150, 515);
            this.btnGuardar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(112, 35);
            this.btnGuardar.TabIndex = 16;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.Visible = false;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(300, 515);
            this.btnCancelar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(112, 35);
            this.btnCancelar.TabIndex = 17;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.Visible = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(15, 631);
            this.btnAdd.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(112, 35);
            this.btnAdd.TabIndex = 2;
            this.btnAdd.Text = "Adicionar";
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(142, 631);
            this.btnEdit.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(112, 35);
            this.btnEdit.TabIndex = 3;
            this.btnEdit.Text = "Editar";
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(270, 631);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(112, 35);
            this.btnDelete.TabIndex = 4;
            this.btnDelete.Text = "Eliminar";
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // FormCursos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1162, 685);
            this.Controls.Add(this.listBoxCursos);
            this.Controls.Add(this.panelDetalhes);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnFiltros);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FormCursos";
            this.Text = "Catálogo de Cursos";
            this.Load += new System.EventHandler(this.FormCursos_Load);
            this.panelDetalhes.ResumeLayout(false);
            this.panelDetalhes.PerformLayout();
            this.ResumeLayout(false);

        }

        private System.Windows.Forms.ListBox listBoxCursos;
        private System.Windows.Forms.Panel panelDetalhes;
        private System.Windows.Forms.Label lblCodCurso;
        private System.Windows.Forms.TextBox txtCodCurso;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.TextBox txtTitulo;
        private System.Windows.Forms.Label lblDescricao;
        private System.Windows.Forms.TextBox txtDescricao;
        private System.Windows.Forms.Label lblDificuldade;
        private System.Windows.Forms.ComboBox cmbDificuldade;
        private System.Windows.Forms.Label lblPreco;
        private System.Windows.Forms.TextBox txtPreco;
        private System.Windows.Forms.Label lblFormador;
        private System.Windows.Forms.ComboBox cmbFormador;
        private System.Windows.Forms.Label lblMediaAval;
        private System.Windows.Forms.TextBox txtMediaAval;
        private System.Windows.Forms.Label lblTotalInscritos;
        private System.Windows.Forms.TextBox txtTotalInscritos;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnFiltros;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}