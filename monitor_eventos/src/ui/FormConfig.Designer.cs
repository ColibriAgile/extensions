namespace PluginEventos.ui
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormConfig));
            this.label1 = new System.Windows.Forms.Label();
            this.PnlBotoes = new System.Windows.Forms.Panel();
            this.BtnDesmarcarTodos = new DevExpress.XtraEditors.SimpleButton();
            this.BtnMarcarTodos = new DevExpress.XtraEditors.SimpleButton();
            this.BtnAplicar = new DevExpress.XtraEditors.SimpleButton();
            this.BtnFechar = new DevExpress.XtraEditors.SimpleButton();
            this.ChkMostrarNotificacao = new DevExpress.XtraEditors.CheckEdit();
            this.Tree = new DevExpress.XtraTreeList.TreeList();
            this.colValor = new DevExpress.XtraTreeList.Columns.TreeListColumn();
            this.PnlBotoes.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ChkMostrarNotificacao.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tree)).BeginInit();
            this.SuspendLayout();
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
            this.PnlBotoes.Controls.Add(this.BtnDesmarcarTodos);
            this.PnlBotoes.Controls.Add(this.BtnMarcarTodos);
            this.PnlBotoes.Controls.Add(this.BtnAplicar);
            this.PnlBotoes.Controls.Add(this.BtnFechar);
            this.PnlBotoes.Controls.Add(this.ChkMostrarNotificacao);
            this.PnlBotoes.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.PnlBotoes.Location = new System.Drawing.Point(0, 683);
            this.PnlBotoes.Name = "PnlBotoes";
            this.PnlBotoes.Size = new System.Drawing.Size(911, 53);
            this.PnlBotoes.TabIndex = 2;
            // 
            // BtnDesmarcarTodos
            // 
            this.BtnDesmarcarTodos.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnDesmarcarTodos.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnDesmarcarTodos.ImageOptions.Image")));
            this.BtnDesmarcarTodos.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnDesmarcarTodos.Location = new System.Drawing.Point(134, 7);
            this.BtnDesmarcarTodos.Margin = new System.Windows.Forms.Padding(0);
            this.BtnDesmarcarTodos.Name = "BtnDesmarcarTodos";
            this.BtnDesmarcarTodos.Size = new System.Drawing.Size(117, 38);
            this.BtnDesmarcarTodos.TabIndex = 8;
            this.BtnDesmarcarTodos.Text = "Desmarcar todos";
            this.BtnDesmarcarTodos.Click += new System.EventHandler(this.BtnDesmarcarTodos_Click);
            // 
            // BtnMarcarTodos
            // 
            this.BtnMarcarTodos.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnMarcarTodos.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnMarcarTodos.ImageOptions.Image")));
            this.BtnMarcarTodos.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnMarcarTodos.Location = new System.Drawing.Point(9, 7);
            this.BtnMarcarTodos.Margin = new System.Windows.Forms.Padding(0);
            this.BtnMarcarTodos.Name = "BtnMarcarTodos";
            this.BtnMarcarTodos.Size = new System.Drawing.Size(117, 38);
            this.BtnMarcarTodos.TabIndex = 7;
            this.BtnMarcarTodos.Text = "Marcar todos";
            this.BtnMarcarTodos.Click += new System.EventHandler(this.BtnMarcarTodos_Click);
            // 
            // BtnAplicar
            // 
            this.BtnAplicar.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnAplicar.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.BtnAplicar.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnAplicar.ImageOptions.Image")));
            this.BtnAplicar.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnAplicar.Location = new System.Drawing.Point(658, 7);
            this.BtnAplicar.Margin = new System.Windows.Forms.Padding(0);
            this.BtnAplicar.Name = "BtnAplicar";
            this.BtnAplicar.Size = new System.Drawing.Size(117, 38);
            this.BtnAplicar.TabIndex = 6;
            this.BtnAplicar.Text = "Aplicar";
            this.BtnAplicar.Click += new System.EventHandler(this.BtnAplicar_Click);
            // 
            // BtnFechar
            // 
            this.BtnFechar.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnFechar.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.BtnFechar.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnFechar.ImageOptions.Image")));
            this.BtnFechar.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnFechar.Location = new System.Drawing.Point(785, 7);
            this.BtnFechar.Margin = new System.Windows.Forms.Padding(0);
            this.BtnFechar.Name = "BtnFechar";
            this.BtnFechar.Size = new System.Drawing.Size(117, 38);
            this.BtnFechar.TabIndex = 5;
            this.BtnFechar.Text = "Fechar";
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
            // Tree
            // 
            this.Tree.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
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
            // FormConfig
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
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
            ((System.ComponentModel.ISupportInitialize)(this.ChkMostrarNotificacao.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tree)).EndInit();
            this.ResumeLayout(false);

    }

    #endregion
    private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel PnlBotoes;
        private DevExpress.XtraTreeList.TreeList Tree;
        private DevExpress.XtraTreeList.Columns.TreeListColumn colValor;
        private DevExpress.XtraEditors.CheckEdit ChkMostrarNotificacao;
        private DevExpress.XtraEditors.SimpleButton BtnAplicar;
        private DevExpress.XtraEditors.SimpleButton BtnFechar;
        private DevExpress.XtraEditors.SimpleButton BtnDesmarcarTodos;
        private DevExpress.XtraEditors.SimpleButton BtnMarcarTodos;
    }
}