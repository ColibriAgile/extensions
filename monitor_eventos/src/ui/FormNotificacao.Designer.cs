namespace PluginEventos.ui
{
    partial class FormNotificacao
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormNotificacao));
            DevExpress.XtraEditors.Controls.EditorButtonImageOptions editorButtonImageOptions1 = new DevExpress.XtraEditors.Controls.EditorButtonImageOptions();
            DevExpress.Utils.SerializableAppearanceObject serializableAppearanceObject1 = new DevExpress.Utils.SerializableAppearanceObject();
            DevExpress.Utils.SerializableAppearanceObject serializableAppearanceObject2 = new DevExpress.Utils.SerializableAppearanceObject();
            DevExpress.Utils.SerializableAppearanceObject serializableAppearanceObject3 = new DevExpress.Utils.SerializableAppearanceObject();
            DevExpress.Utils.SerializableAppearanceObject serializableAppearanceObject4 = new DevExpress.Utils.SerializableAppearanceObject();
            this.Pnl = new System.Windows.Forms.TableLayoutPanel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.BtnEnviarErroInterromper = new DevExpress.XtraEditors.SimpleButton();
            this.BtnContinuarIgnorar = new DevExpress.XtraEditors.SimpleButton();
            this.BtnCopiar = new DevExpress.XtraEditors.SimpleButton();
            this.BtnEnviarErro = new DevExpress.XtraEditors.SimpleButton();
            this.BtnContinuar = new DevExpress.XtraEditors.SimpleButton();
            this.Tabs = new DevExpress.XtraTab.XtraTabControl();
            this.TabContexto = new DevExpress.XtraTab.XtraTabPage();
            this.TxtContexto = new ICSharpCode.TextEditor.TextEditorControl();
            this.TabModificadores = new DevExpress.XtraTab.XtraTabPage();
            this.TxtModificadores = new ICSharpCode.TextEditor.TextEditorControl();
            this.TabErro = new DevExpress.XtraTab.XtraTabPage();
            this.TxtMensagemErro = new DevExpress.XtraEditors.MemoEdit();
            this.panel2 = new System.Windows.Forms.Panel();
            this.LblTitulo = new DevExpress.XtraEditors.LabelControl();
            this.TxtEvento = new DevExpress.XtraEditors.ButtonEdit();
            this.Pnl.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Tabs)).BeginInit();
            this.Tabs.SuspendLayout();
            this.TabContexto.SuspendLayout();
            this.TabModificadores.SuspendLayout();
            this.TabErro.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtMensagemErro.Properties)).BeginInit();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TxtEvento.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // Pnl
            // 
            this.Pnl.ColumnCount = 1;
            this.Pnl.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.Pnl.Controls.Add(this.panel1, 0, 2);
            this.Pnl.Controls.Add(this.Tabs, 0, 1);
            this.Pnl.Controls.Add(this.panel2, 0, 0);
            this.Pnl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Pnl.Location = new System.Drawing.Point(0, 0);
            this.Pnl.Name = "Pnl";
            this.Pnl.RowCount = 3;
            this.Pnl.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.722222F));
            this.Pnl.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 81.07639F));
            this.Pnl.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.027778F));
            this.Pnl.Size = new System.Drawing.Size(899, 576);
            this.Pnl.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.BtnEnviarErroInterromper);
            this.panel1.Controls.Add(this.BtnContinuarIgnorar);
            this.panel1.Controls.Add(this.BtnCopiar);
            this.panel1.Controls.Add(this.BtnEnviarErro);
            this.panel1.Controls.Add(this.BtnContinuar);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 523);
            this.panel1.Margin = new System.Windows.Forms.Padding(0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(899, 53);
            this.panel1.TabIndex = 0;
            // 
            // BtnEnviarErroInterromper
            // 
            this.BtnEnviarErroInterromper.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnEnviarErroInterromper.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnEnviarErroInterromper.ImageOptions.Image")));
            this.BtnEnviarErroInterromper.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnEnviarErroInterromper.Location = new System.Drawing.Point(333, 7);
            this.BtnEnviarErroInterromper.Margin = new System.Windows.Forms.Padding(0);
            this.BtnEnviarErroInterromper.Name = "BtnEnviarErroInterromper";
            this.BtnEnviarErroInterromper.Size = new System.Drawing.Size(159, 38);
            this.BtnEnviarErroInterromper.TabIndex = 5;
            this.BtnEnviarErroInterromper.Text = "Enviar erro e interromper";
            this.BtnEnviarErroInterromper.Click += new System.EventHandler(this.BtnEnviarErroInterromper_Click);
            // 
            // BtnContinuarIgnorar
            // 
            this.BtnContinuarIgnorar.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnContinuarIgnorar.DialogResult = System.Windows.Forms.DialogResult.Abort;
            this.BtnContinuarIgnorar.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnContinuarIgnorar.ImageOptions.Image")));
            this.BtnContinuarIgnorar.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnContinuarIgnorar.Location = new System.Drawing.Point(626, 7);
            this.BtnContinuarIgnorar.Margin = new System.Windows.Forms.Padding(0);
            this.BtnContinuarIgnorar.Name = "BtnContinuarIgnorar";
            this.BtnContinuarIgnorar.Size = new System.Drawing.Size(134, 38);
            this.BtnContinuarIgnorar.TabIndex = 4;
            this.BtnContinuarIgnorar.Text = "Continuar e ignorar";
            // 
            // BtnCopiar
            // 
            this.BtnCopiar.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnCopiar.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnCopiar.ImageOptions.Image")));
            this.BtnCopiar.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnCopiar.Location = new System.Drawing.Point(12, 7);
            this.BtnCopiar.Name = "BtnCopiar";
            this.BtnCopiar.Size = new System.Drawing.Size(117, 38);
            this.BtnCopiar.TabIndex = 3;
            this.BtnCopiar.Text = "Copiar";
            this.BtnCopiar.Click += new System.EventHandler(this.BtnCopiar_Click);
            // 
            // BtnEnviarErro
            // 
            this.BtnEnviarErro.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnEnviarErro.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnEnviarErro.ImageOptions.Image")));
            this.BtnEnviarErro.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnEnviarErro.Location = new System.Drawing.Point(501, 7);
            this.BtnEnviarErro.Margin = new System.Windows.Forms.Padding(0);
            this.BtnEnviarErro.Name = "BtnEnviarErro";
            this.BtnEnviarErro.Size = new System.Drawing.Size(117, 38);
            this.BtnEnviarErro.TabIndex = 2;
            this.BtnEnviarErro.Text = "Enviar erro";
            this.BtnEnviarErro.Click += new System.EventHandler(this.BtnEnviarErro_Click);
            // 
            // BtnContinuar
            // 
            this.BtnContinuar.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.BtnContinuar.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.BtnContinuar.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("BtnContinuar.ImageOptions.Image")));
            this.BtnContinuar.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnContinuar.Location = new System.Drawing.Point(766, 7);
            this.BtnContinuar.Margin = new System.Windows.Forms.Padding(0);
            this.BtnContinuar.Name = "BtnContinuar";
            this.BtnContinuar.Size = new System.Drawing.Size(117, 38);
            this.BtnContinuar.TabIndex = 1;
            this.BtnContinuar.Text = "Continuar";
            // 
            // Tabs
            // 
            this.Tabs.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.Tabs.BorderStylePage = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.Tabs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Tabs.Location = new System.Drawing.Point(3, 59);
            this.Tabs.Name = "Tabs";
            this.Tabs.SelectedTabPage = this.TabContexto;
            this.Tabs.Size = new System.Drawing.Size(893, 461);
            this.Tabs.TabIndex = 1;
            this.Tabs.TabPages.AddRange(new DevExpress.XtraTab.XtraTabPage[] {
            this.TabContexto,
            this.TabModificadores,
            this.TabErro});
            // 
            // TabContexto
            // 
            this.TabContexto.Controls.Add(this.TxtContexto);
            this.TabContexto.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("TabContexto.ImageOptions.Image")));
            this.TabContexto.Name = "TabContexto";
            this.TabContexto.Size = new System.Drawing.Size(887, 430);
            this.TabContexto.Text = "Contexto";
            // 
            // TxtContexto
            // 
            this.TxtContexto.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TxtContexto.Highlighting = "JavaScript";
            this.TxtContexto.IsIconBarVisible = true;
            this.TxtContexto.Location = new System.Drawing.Point(0, 0);
            this.TxtContexto.Name = "TxtContexto";
            this.TxtContexto.ReadOnly = true;
            this.TxtContexto.ShowVRuler = false;
            this.TxtContexto.Size = new System.Drawing.Size(887, 430);
            this.TxtContexto.TabIndex = 0;
            this.TxtContexto.Text = resources.GetString("TxtContexto.Text");
            this.TxtContexto.VRulerRow = 120;
            // 
            // TabModificadores
            // 
            this.TabModificadores.Controls.Add(this.TxtModificadores);
            this.TabModificadores.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("TabModificadores.ImageOptions.Image")));
            this.TabModificadores.Name = "TabModificadores";
            this.TabModificadores.Size = new System.Drawing.Size(887, 430);
            this.TabModificadores.Text = "Modificadores";
            // 
            // TxtModificadores
            // 
            this.TxtModificadores.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TxtModificadores.Highlighting = "JavaScript";
            this.TxtModificadores.IsIconBarVisible = true;
            this.TxtModificadores.Location = new System.Drawing.Point(0, 0);
            this.TxtModificadores.Name = "TxtModificadores";
            this.TxtModificadores.ReadOnly = true;
            this.TxtModificadores.ShowVRuler = false;
            this.TxtModificadores.Size = new System.Drawing.Size(887, 430);
            this.TxtModificadores.TabIndex = 1;
            this.TxtModificadores.Text = resources.GetString("TxtModificadores.Text");
            this.TxtModificadores.VRulerRow = 120;
            // 
            // TabErro
            // 
            this.TabErro.Controls.Add(this.TxtMensagemErro);
            this.TabErro.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("TabErro.ImageOptions.Image")));
            this.TabErro.Name = "TabErro";
            this.TabErro.Size = new System.Drawing.Size(887, 430);
            this.TabErro.Text = "Atribuir erro";
            // 
            // TxtMensagemErro
            // 
            this.TxtMensagemErro.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TxtMensagemErro.EditValue = "Mensagem de erro de teste.";
            this.TxtMensagemErro.Location = new System.Drawing.Point(0, 0);
            this.TxtMensagemErro.Name = "TxtMensagemErro";
            this.TxtMensagemErro.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 10F);
            this.TxtMensagemErro.Properties.Appearance.Options.UseFont = true;
            this.TxtMensagemErro.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.TxtMensagemErro.Size = new System.Drawing.Size(887, 430);
            this.TxtMensagemErro.TabIndex = 3;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.LblTitulo);
            this.panel2.Controls.Add(this.TxtEvento);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(5, 5);
            this.panel2.Margin = new System.Windows.Forms.Padding(5);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(889, 46);
            this.panel2.TabIndex = 2;
            // 
            // LblTitulo
            // 
            this.LblTitulo.Appearance.Font = new System.Drawing.Font("Tahoma", 10F);
            this.LblTitulo.Appearance.Options.UseFont = true;
            this.LblTitulo.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.None;
            this.LblTitulo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LblTitulo.Location = new System.Drawing.Point(0, 0);
            this.LblTitulo.Name = "LblTitulo";
            this.LblTitulo.Size = new System.Drawing.Size(889, 18);
            this.LblTitulo.TabIndex = 1;
            this.LblTitulo.Text = "Nome do Evento";
            // 
            // TxtEvento
            // 
            this.TxtEvento.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.TxtEvento.EditValue = "EventoDeCaixa.AoAdicionarMeioDePagamento";
            this.TxtEvento.Location = new System.Drawing.Point(0, 18);
            this.TxtEvento.Name = "TxtEvento";
            this.TxtEvento.Properties.Appearance.Font = new System.Drawing.Font("Consolas", 12F);
            this.TxtEvento.Properties.Appearance.Options.UseFont = true;
            this.TxtEvento.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.HotFlat;
            editorButtonImageOptions1.Image = ((System.Drawing.Image)(resources.GetObject("editorButtonImageOptions1.Image")));
            this.TxtEvento.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Glyph, "", -1, true, true, false, editorButtonImageOptions1, new DevExpress.Utils.KeyShortcut(System.Windows.Forms.Keys.None), serializableAppearanceObject1, serializableAppearanceObject2, serializableAppearanceObject3, serializableAppearanceObject4, "", null, null, DevExpress.Utils.ToolTipAnchor.Default)});
            this.TxtEvento.Properties.ReadOnly = true;
            this.TxtEvento.Properties.ButtonClick += new DevExpress.XtraEditors.Controls.ButtonPressedEventHandler(this.TxtEvento_Properties_ButtonClick);
            this.TxtEvento.Size = new System.Drawing.Size(889, 28);
            this.TxtEvento.TabIndex = 0;
            // 
            // FormNotificacao
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(899, 576);
            this.Controls.Add(this.Pnl);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FormNotificacao";
            this.Text = "Notificação de evento";
            this.Pnl.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Tabs)).EndInit();
            this.Tabs.ResumeLayout(false);
            this.TabContexto.ResumeLayout(false);
            this.TabModificadores.ResumeLayout(false);
            this.TabErro.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.TxtMensagemErro.Properties)).EndInit();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.TxtEvento.Properties)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel Pnl;
        private System.Windows.Forms.Panel panel1;
        private DevExpress.XtraEditors.SimpleButton BtnCopiar;
        private DevExpress.XtraEditors.SimpleButton BtnEnviarErro;
        private DevExpress.XtraEditors.SimpleButton BtnContinuar;
        private DevExpress.XtraTab.XtraTabControl Tabs;
        private DevExpress.XtraTab.XtraTabPage TabContexto;
        private DevExpress.XtraTab.XtraTabPage TabModificadores;
        private System.Windows.Forms.Panel panel2;
        private DevExpress.XtraEditors.LabelControl LblTitulo;
        private ICSharpCode.TextEditor.TextEditorControl TxtContexto;
        private ICSharpCode.TextEditor.TextEditorControl TxtModificadores;
        private DevExpress.XtraEditors.SimpleButton BtnContinuarIgnorar;
        private DevExpress.XtraEditors.ButtonEdit TxtEvento;
        private DevExpress.XtraTab.XtraTabPage TabErro;
        private DevExpress.XtraEditors.MemoEdit TxtMensagemErro;
        private DevExpress.XtraEditors.SimpleButton BtnEnviarErroInterromper;
    }
}