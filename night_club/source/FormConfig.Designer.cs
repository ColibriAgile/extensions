namespace PluginNightClub
{
  partial class FormConfig
  {
    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    /// Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
      if (disposing && (components != null))
      {
        components.Dispose();
      }
      base.Dispose(disposing);
    }

    #region Windows Form Designer generated code

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
      this.btFechar = new System.Windows.Forms.Button();
      this.label1 = new System.Windows.Forms.Label();
      this.lvPerfil = new System.Windows.Forms.ListView();
      this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
      this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
      this.cbPerfil = new System.Windows.Forms.ComboBox();
      this.textLimite = new System.Windows.Forms.TextBox();
      this.label2 = new System.Windows.Forms.Label();
      this.label3 = new System.Windows.Forms.Label();
      this.btAdicionar = new System.Windows.Forms.Button();
      this.btRemover = new System.Windows.Forms.Button();
      this.SuspendLayout();
      // 
      // btFechar
      // 
      this.btFechar.DialogResult = System.Windows.Forms.DialogResult.OK;
      this.btFechar.Location = new System.Drawing.Point(143, 271);
      this.btFechar.Name = "btFechar";
      this.btFechar.Size = new System.Drawing.Size(75, 23);
      this.btFechar.TabIndex = 5;
      this.btFechar.Text = "&Fechar";
      this.btFechar.UseVisualStyleBackColor = true;
      // 
      // label1
      // 
      this.label1.AutoSize = true;
      this.label1.Location = new System.Drawing.Point(12, 44);
      this.label1.Name = "label1";
      this.label1.Size = new System.Drawing.Size(30, 13);
      this.label1.TabIndex = 1;
      this.label1.Text = "Perfil";
      // 
      // lvPerfil
      // 
      this.lvPerfil.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2});
      this.lvPerfil.Location = new System.Drawing.Point(12, 110);
      this.lvPerfil.Name = "lvPerfil";
      this.lvPerfil.Size = new System.Drawing.Size(266, 143);
      this.lvPerfil.TabIndex = 3;
      this.lvPerfil.UseCompatibleStateImageBehavior = false;
      this.lvPerfil.View = System.Windows.Forms.View.Details;
      // 
      // columnHeader1
      // 
      this.columnHeader1.Text = "Perfil";
      this.columnHeader1.Width = 200;
      // 
      // columnHeader2
      // 
      this.columnHeader2.Text = "Máximo";
      // 
      // cbPerfil
      // 
      this.cbPerfil.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
      this.cbPerfil.FormattingEnabled = true;
      this.cbPerfil.Location = new System.Drawing.Point(15, 60);
      this.cbPerfil.Name = "cbPerfil";
      this.cbPerfil.Size = new System.Drawing.Size(185, 21);
      this.cbPerfil.Sorted = true;
      this.cbPerfil.TabIndex = 0;
      // 
      // textLimite
      // 
      this.textLimite.Location = new System.Drawing.Point(217, 61);
      this.textLimite.Name = "textLimite";
      this.textLimite.Size = new System.Drawing.Size(61, 20);
      this.textLimite.TabIndex = 1;
      // 
      // label2
      // 
      this.label2.AutoSize = true;
      this.label2.Location = new System.Drawing.Point(214, 44);
      this.label2.Name = "label2";
      this.label2.Size = new System.Drawing.Size(34, 13);
      this.label2.TabIndex = 5;
      this.label2.Text = "Limite";
      // 
      // label3
      // 
      this.label3.AutoSize = true;
      this.label3.Location = new System.Drawing.Point(9, 20);
      this.label3.Name = "label3";
      this.label3.Size = new System.Drawing.Size(209, 13);
      this.label3.TabIndex = 6;
      this.label3.Text = "Escolha um limite para o Check-in por perfil";
      // 
      // btAdicionar
      // 
      this.btAdicionar.Location = new System.Drawing.Point(284, 60);
      this.btAdicionar.Name = "btAdicionar";
      this.btAdicionar.Size = new System.Drawing.Size(65, 23);
      this.btAdicionar.TabIndex = 2;
      this.btAdicionar.Text = "Adicionar";
      this.btAdicionar.UseVisualStyleBackColor = true;
      this.btAdicionar.Click += new System.EventHandler(this.btAdicionar_Click);
      // 
      // btRemover
      // 
      this.btRemover.Location = new System.Drawing.Point(284, 110);
      this.btRemover.Name = "btRemover";
      this.btRemover.Size = new System.Drawing.Size(65, 23);
      this.btRemover.TabIndex = 4;
      this.btRemover.Text = "Remover";
      this.btRemover.UseVisualStyleBackColor = true;
      this.btRemover.Click += new System.EventHandler(this.btRemover_Click);
      // 
      // FormConfig
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(361, 312);
      this.Controls.Add(this.btRemover);
      this.Controls.Add(this.btAdicionar);
      this.Controls.Add(this.label3);
      this.Controls.Add(this.label2);
      this.Controls.Add(this.textLimite);
      this.Controls.Add(this.cbPerfil);
      this.Controls.Add(this.lvPerfil);
      this.Controls.Add(this.label1);
      this.Controls.Add(this.btFechar);
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
      this.Name = "FormConfig";
      this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
      this.Text = "FormConfig";
      this.Load += new System.EventHandler(this.FormConfig_Load);
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.Button btFechar;
    private System.Windows.Forms.Label label1;
    private System.Windows.Forms.ListView lvPerfil;
    private System.Windows.Forms.ColumnHeader columnHeader1;
    private System.Windows.Forms.ColumnHeader columnHeader2;
    private System.Windows.Forms.ComboBox cbPerfil;
    private System.Windows.Forms.TextBox textLimite;
    private System.Windows.Forms.Label label2;
    private System.Windows.Forms.Label label3;
    private System.Windows.Forms.Button btAdicionar;
    private System.Windows.Forms.Button btRemover;
  }
}