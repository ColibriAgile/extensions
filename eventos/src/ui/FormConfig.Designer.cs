namespace PluginEventos
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
            this.components = new System.ComponentModel.Container();
            this.BtnFechar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.PnlBotoes = new System.Windows.Forms.Panel();
            this.BtnAplicar = new System.Windows.Forms.Button();
            this.eventosBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.Tree = new DevExpress.XtraTreeList.TreeList();
            this.colValor = new DevExpress.XtraTreeList.Columns.TreeListColumn();
            this.BtnMarcarTodos = new System.Windows.Forms.Button();
            this.BtnDesmarcarTodos = new System.Windows.Forms.Button();
            this.ChkMostrarNotificacao = new DevExpress.XtraEditors.CheckEdit();
            this.PnlBotoes.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.eventosBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tree)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ChkMostrarNotificacao.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // BtnFechar
            // 
            this.BtnFechar.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.BtnFechar.Location = new System.Drawing.Point(798, 12);
            this.BtnFechar.Margin = new System.Windows.Forms.Padding(4);
            this.BtnFechar.Name = "BtnFechar";
            this.BtnFechar.Size = new System.Drawing.Size(100, 28);
            this.BtnFechar.TabIndex = 0;
            this.BtnFechar.Text = "&Fechar";
            this.BtnFechar.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.Dock = System.Windows.Forms.DockStyle.Top;
            this.label1.Location = new System.Drawing.Point(0, 0);
            this.label1.Margin = new System.Windows.Forms.Padding(0);
            this.label1.Name = "label1";
            this.label1.Padding = new System.Windows.Forms.Padding(0, 10, 0, 0);
            this.label1.Size = new System.Drawing.Size(911, 31);
            this.label1.TabIndex = 1;
            this.label1.Text = "Selecione os eventos que deseja monitorar e clique em Aplicar.";
            // 
            // PnlBotoes
            // 
            this.PnlBotoes.Controls.Add(this.ChkMostrarNotificacao);
            this.PnlBotoes.Controls.Add(this.BtnDesmarcarTodos);
            this.PnlBotoes.Controls.Add(this.BtnMarcarTodos);
            this.PnlBotoes.Controls.Add(this.BtnAplicar);
            this.PnlBotoes.Controls.Add(this.BtnFechar);
            this.PnlBotoes.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.PnlBotoes.Location = new System.Drawing.Point(0, 683);
            this.PnlBotoes.Name = "PnlBotoes";
            this.PnlBotoes.Size = new System.Drawing.Size(911, 53);
            this.PnlBotoes.TabIndex = 2;
            // 
            // BtnAplicar
            // 
            this.BtnAplicar.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.BtnAplicar.Location = new System.Drawing.Point(690, 12);
            this.BtnAplicar.Margin = new System.Windows.Forms.Padding(4);
            this.BtnAplicar.Name = "BtnAplicar";
            this.BtnAplicar.Size = new System.Drawing.Size(100, 28);
            this.BtnAplicar.TabIndex = 1;
            this.BtnAplicar.Text = "&Aplicar";
            this.BtnAplicar.UseVisualStyleBackColor = true;
            this.BtnAplicar.Click += new System.EventHandler(this.BtnAplicar_Click);
            // 
            // Tree
            // 
            this.Tree.Columns.AddRange(new DevExpress.XtraTreeList.Columns.TreeListColumn[] {
            this.colValor});
            this.Tree.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Tree.Location = new System.Drawing.Point(0, 31);
            this.Tree.Name = "Tree";
            this.Tree.OptionsBehavior.ReadOnly = true;
            this.Tree.OptionsFind.AllowIncrementalSearch = true;
            this.Tree.OptionsFind.AlwaysVisible = true;
            this.Tree.OptionsFind.ExpandNodesOnIncrementalSearch = true;
            this.Tree.OptionsFind.FindNullPrompt = "Digite o nome ou parte do nome do evento...";
            this.Tree.OptionsView.ShowCheckBoxes = true;
            this.Tree.OptionsView.ShowFilterPanelMode = DevExpress.XtraTreeList.ShowFilterPanelMode.ShowAlways;
            this.Tree.Size = new System.Drawing.Size(911, 652);
            this.Tree.TabIndex = 3;
            this.Tree.AfterCheckNode += new DevExpress.XtraTreeList.NodeEventHandler(this.Tree_AfterCheckNode);
            // 
            // colValor
            // 
            this.colValor.Caption = "Evento";
            this.colValor.FieldName = "Evento";
            this.colValor.Name = "colValor";
            this.colValor.OptionsColumn.AllowEdit = false;
            this.colValor.Visible = true;
            this.colValor.VisibleIndex = 0;
            // 
            // BtnMarcarTodos
            // 
            this.BtnMarcarTodos.Location = new System.Drawing.Point(13, 12);
            this.BtnMarcarTodos.Margin = new System.Windows.Forms.Padding(4);
            this.BtnMarcarTodos.Name = "BtnMarcarTodos";
            this.BtnMarcarTodos.Size = new System.Drawing.Size(100, 28);
            this.BtnMarcarTodos.TabIndex = 2;
            this.BtnMarcarTodos.Text = "&Marcar todos";
            this.BtnMarcarTodos.UseVisualStyleBackColor = true;
            this.BtnMarcarTodos.Click += new System.EventHandler(this.BtnMarcarTodos_Click);
            // 
            // BtnDesmarcarTodos
            // 
            this.BtnDesmarcarTodos.Location = new System.Drawing.Point(121, 12);
            this.BtnDesmarcarTodos.Margin = new System.Windows.Forms.Padding(4);
            this.BtnDesmarcarTodos.Name = "BtnDesmarcarTodos";
            this.BtnDesmarcarTodos.Size = new System.Drawing.Size(133, 28);
            this.BtnDesmarcarTodos.TabIndex = 3;
            this.BtnDesmarcarTodos.Text = "&Desmarcar todos";
            this.BtnDesmarcarTodos.UseVisualStyleBackColor = true;
            this.BtnDesmarcarTodos.Click += new System.EventHandler(this.BtnDesmarcarTodos_Click);
            // 
            // ChkMostrarNotificacao
            // 
            this.ChkMostrarNotificacao.Location = new System.Drawing.Point(271, 17);
            this.ChkMostrarNotificacao.Name = "ChkMostrarNotificacao";
            this.ChkMostrarNotificacao.Properties.Caption = "Mostrar notificação";
            this.ChkMostrarNotificacao.Properties.GlyphAlignment = DevExpress.Utils.HorzAlignment.Default;
            this.ChkMostrarNotificacao.Size = new System.Drawing.Size(208, 19);
            this.ChkMostrarNotificacao.TabIndex = 4;
            // 
            // FormConfig
            // 
            this.AcceptButton = this.BtnAplicar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.BtnFechar;
            this.ClientSize = new System.Drawing.Size(911, 736);
            this.Controls.Add(this.Tree);
            this.Controls.Add(this.PnlBotoes);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FormConfig";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Monitor de Eventos e Contextos";
            this.Shown += new System.EventHandler(this.FormConfig_Shown);
            this.PnlBotoes.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.eventosBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tree)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ChkMostrarNotificacao.Properties)).EndInit();
            this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.Button BtnFechar;
    private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel PnlBotoes;
        private System.Windows.Forms.Button BtnAplicar;
        private System.Windows.Forms.BindingSource eventosBindingSource;
        private DevExpress.XtraTreeList.TreeList Tree;
        private DevExpress.XtraTreeList.Columns.TreeListColumn colValor;
        private System.Windows.Forms.Button BtnDesmarcarTodos;
        private System.Windows.Forms.Button BtnMarcarTodos;
        private DevExpress.XtraEditors.CheckEdit ChkMostrarNotificacao;
    }
}