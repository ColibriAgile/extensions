namespace PluginEventos.ui
{
    partial class FormCallback
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
            DevExpress.Utils.SuperToolTip superToolTip1 = new DevExpress.Utils.SuperToolTip();
            DevExpress.Utils.ToolTipTitleItem toolTipTitleItem1 = new DevExpress.Utils.ToolTipTitleItem();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormCallback));
            DevExpress.Utils.ToolTipItem toolTipItem1 = new DevExpress.Utils.ToolTipItem();
            DevExpress.Utils.SuperToolTip superToolTip2 = new DevExpress.Utils.SuperToolTip();
            DevExpress.Utils.ToolTipTitleItem toolTipTitleItem2 = new DevExpress.Utils.ToolTipTitleItem();
            DevExpress.Utils.ToolTipItem toolTipItem2 = new DevExpress.Utils.ToolTipItem();
            DevExpress.Utils.ToolTipSeparatorItem toolTipSeparatorItem1 = new DevExpress.Utils.ToolTipSeparatorItem();
            DevExpress.Utils.ToolTipTitleItem toolTipTitleItem3 = new DevExpress.Utils.ToolTipTitleItem();
            this.LayoutControl = new DevExpress.XtraLayout.LayoutControl();
            this.BtnContinuar = new DevExpress.XtraEditors.SimpleButton();
            this.BtnCancelar = new DevExpress.XtraEditors.SimpleButton();
            this.EdtEvento = new DevExpress.XtraEditors.ButtonEdit();
            this.Root = new DevExpress.XtraLayout.LayoutControlGroup();
            this.ItemEvento = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemContinuarIgnorar = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemContinuar = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemEspaco = new DevExpress.XtraLayout.EmptySpaceItem();
            this.TxtContexto = new ICSharpCode.TextEditor.TextEditorControl();
            this.layoutControlItem1 = new DevExpress.XtraLayout.LayoutControlItem();
            ((System.ComponentModel.ISupportInitialize)(this.LayoutControl)).BeginInit();
            this.LayoutControl.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.EdtEvento.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Root)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemEvento)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemContinuarIgnorar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemContinuar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemEspaco)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).BeginInit();
            this.SuspendLayout();
            // 
            // LayoutControl
            // 
            this.LayoutControl.BackColor = System.Drawing.Color.White;
            this.LayoutControl.Controls.Add(this.TxtContexto);
            this.LayoutControl.Controls.Add(this.BtnContinuar);
            this.LayoutControl.Controls.Add(this.BtnCancelar);
            this.LayoutControl.Controls.Add(this.EdtEvento);
            this.LayoutControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LayoutControl.Location = new System.Drawing.Point(0, 0);
            this.LayoutControl.Name = "LayoutControl";
            this.LayoutControl.OptionsCustomizationForm.DesignTimeCustomizationFormPositionAndSize = new System.Drawing.Rectangle(1494, 163, 650, 632);
            this.LayoutControl.Root = this.Root;
            this.LayoutControl.Size = new System.Drawing.Size(766, 556);
            this.LayoutControl.TabIndex = 6;
            // 
            // BtnContinuar
            // 
            this.BtnContinuar.Appearance.BackColor = DevExpress.LookAndFeel.DXSkinColors.FillColors.Success;
            this.BtnContinuar.Appearance.Options.UseBackColor = true;
            this.BtnContinuar.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.HotFlat;
            this.BtnContinuar.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.BtnContinuar.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnContinuar.Location = new System.Drawing.Point(689, 511);
            this.BtnContinuar.Margin = new System.Windows.Forms.Padding(0);
            this.BtnContinuar.Name = "BtnContinuar";
            this.BtnContinuar.Size = new System.Drawing.Size(72, 40);
            this.BtnContinuar.StyleController = this.LayoutControl;
            toolTipTitleItem1.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("resource.Image")));
            toolTipTitleItem1.Text = "Continuar";
            toolTipItem1.LeftIndent = 6;
            toolTipItem1.Text = "Continua a execução do aplicativo.";
            superToolTip1.Items.Add(toolTipTitleItem1);
            superToolTip1.Items.Add(toolTipItem1);
            this.BtnContinuar.SuperTip = superToolTip1;
            this.BtnContinuar.TabIndex = 2;
            this.BtnContinuar.Text = "Continuar";
            this.BtnContinuar.Click += new System.EventHandler(this.BtnContinuar_Click);
            // 
            // BtnCancelar
            // 
            this.BtnCancelar.Appearance.BackColor = DevExpress.LookAndFeel.DXSkinColors.FillColors.Primary;
            this.BtnCancelar.Appearance.Options.UseBackColor = true;
            this.BtnCancelar.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.HotFlat;
            this.BtnCancelar.DialogResult = System.Windows.Forms.DialogResult.Abort;
            this.BtnCancelar.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftTop;
            this.BtnCancelar.Location = new System.Drawing.Point(573, 511);
            this.BtnCancelar.Margin = new System.Windows.Forms.Padding(0);
            this.BtnCancelar.Name = "BtnCancelar";
            this.BtnCancelar.Size = new System.Drawing.Size(111, 40);
            this.BtnCancelar.StyleController = this.LayoutControl;
            toolTipTitleItem2.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("resource.Image1")));
            toolTipTitleItem2.Text = "Continuar e ignorar";
            toolTipItem2.LeftIndent = 6;
            toolTipItem2.Text = "Continua a execução mas coloca o evento atual na lista de eventos a serem ignorad" +
    "os durante a execução atual.";
            toolTipTitleItem3.LeftIndent = 6;
            toolTipTitleItem3.Text = "Ao reiniciar a aplicação, a lista de eventos não é mantida.";
            superToolTip2.Items.Add(toolTipTitleItem2);
            superToolTip2.Items.Add(toolTipItem2);
            superToolTip2.Items.Add(toolTipSeparatorItem1);
            superToolTip2.Items.Add(toolTipTitleItem3);
            this.BtnCancelar.SuperTip = superToolTip2;
            this.BtnCancelar.TabIndex = 5;
            this.BtnCancelar.Text = "Cancelar";
            // 
            // EdtEvento
            // 
            this.EdtEvento.EditValue = "EventoDeTeste.Teste";
            this.EdtEvento.Location = new System.Drawing.Point(2, 5);
            this.EdtEvento.Name = "EdtEvento";
            this.EdtEvento.Properties.Appearance.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.EdtEvento.Properties.Appearance.Options.UseFont = true;
            this.EdtEvento.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.EdtEvento.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.EdtEvento.Properties.NullText = "EventoDePlugin.TEFEmitido";
            this.EdtEvento.Properties.NullValuePrompt = "EventoDePlugin.TEFEmitido";
            this.EdtEvento.Properties.NullValuePromptShowForEmptyValue = true;
            this.EdtEvento.Properties.UseReadOnlyAppearance = false;
            this.EdtEvento.Size = new System.Drawing.Size(762, 20);
            this.EdtEvento.StyleController = this.LayoutControl;
            this.EdtEvento.TabIndex = 4;
            // 
            // Root
            // 
            this.Root.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.Root.GroupBordersVisible = false;
            this.Root.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.ItemEvento,
            this.ItemContinuarIgnorar,
            this.ItemContinuar,
            this.ItemEspaco,
            this.layoutControlItem1});
            this.Root.Name = "Root";
            this.Root.Padding = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.Root.Size = new System.Drawing.Size(766, 556);
            this.Root.TextVisible = false;
            // 
            // ItemEvento
            // 
            this.ItemEvento.AppearanceItemCaption.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.ItemEvento.AppearanceItemCaption.Options.UseFont = true;
            this.ItemEvento.Control = this.EdtEvento;
            this.ItemEvento.Location = new System.Drawing.Point(0, 0);
            this.ItemEvento.Name = "ItemEvento";
            this.ItemEvento.Padding = new DevExpress.XtraLayout.Utils.Padding(2, 2, 5, 5);
            this.ItemEvento.Size = new System.Drawing.Size(766, 30);
            this.ItemEvento.TextSize = new System.Drawing.Size(0, 0);
            this.ItemEvento.TextVisible = false;
            // 
            // ItemContinuarIgnorar
            // 
            this.ItemContinuarIgnorar.Control = this.BtnCancelar;
            this.ItemContinuarIgnorar.Location = new System.Drawing.Point(573, 506);
            this.ItemContinuarIgnorar.MaxSize = new System.Drawing.Size(0, 50);
            this.ItemContinuarIgnorar.MinSize = new System.Drawing.Size(116, 50);
            this.ItemContinuarIgnorar.Name = "ItemContinuarIgnorar";
            this.ItemContinuarIgnorar.Padding = new DevExpress.XtraLayout.Utils.Padding(0, 5, 5, 5);
            this.ItemContinuarIgnorar.Size = new System.Drawing.Size(116, 50);
            this.ItemContinuarIgnorar.SizeConstraintsType = DevExpress.XtraLayout.SizeConstraintsType.Custom;
            this.ItemContinuarIgnorar.TextSize = new System.Drawing.Size(0, 0);
            this.ItemContinuarIgnorar.TextVisible = false;
            // 
            // ItemContinuar
            // 
            this.ItemContinuar.Control = this.BtnContinuar;
            this.ItemContinuar.Location = new System.Drawing.Point(689, 506);
            this.ItemContinuar.MaxSize = new System.Drawing.Size(0, 50);
            this.ItemContinuar.MinSize = new System.Drawing.Size(66, 50);
            this.ItemContinuar.Name = "ItemContinuar";
            this.ItemContinuar.Padding = new DevExpress.XtraLayout.Utils.Padding(0, 5, 5, 5);
            this.ItemContinuar.Size = new System.Drawing.Size(77, 50);
            this.ItemContinuar.SizeConstraintsType = DevExpress.XtraLayout.SizeConstraintsType.Custom;
            this.ItemContinuar.TextSize = new System.Drawing.Size(0, 0);
            this.ItemContinuar.TextVisible = false;
            // 
            // ItemEspaco
            // 
            this.ItemEspaco.AllowHotTrack = false;
            this.ItemEspaco.Location = new System.Drawing.Point(0, 506);
            this.ItemEspaco.Name = "ItemEspaco";
            this.ItemEspaco.Size = new System.Drawing.Size(573, 50);
            this.ItemEspaco.TextSize = new System.Drawing.Size(0, 0);
            // 
            // TxtContexto
            // 
            this.TxtContexto.Highlighting = "JavaScript";
            this.TxtContexto.IsIconBarVisible = true;
            this.TxtContexto.Location = new System.Drawing.Point(2, 32);
            this.TxtContexto.Name = "TxtContexto";
            this.TxtContexto.ReadOnly = true;
            this.TxtContexto.ShowVRuler = false;
            this.TxtContexto.Size = new System.Drawing.Size(762, 472);
            this.TxtContexto.TabIndex = 7;
            this.TxtContexto.Text = "{}";
            this.TxtContexto.VRulerRow = 120;
            // 
            // layoutControlItem1
            // 
            this.layoutControlItem1.Control = this.TxtContexto;
            this.layoutControlItem1.Location = new System.Drawing.Point(0, 30);
            this.layoutControlItem1.Name = "layoutControlItem1";
            this.layoutControlItem1.Size = new System.Drawing.Size(766, 476);
            this.layoutControlItem1.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem1.TextVisible = false;
            // 
            // FormCallback
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(766, 556);
            this.Controls.Add(this.LayoutControl);
            this.Name = "FormCallback";
            this.Text = "FormCallback";
            ((System.ComponentModel.ISupportInitialize)(this.LayoutControl)).EndInit();
            this.LayoutControl.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.EdtEvento.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Root)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemEvento)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemContinuarIgnorar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemContinuar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemEspaco)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraLayout.LayoutControl LayoutControl;
        private DevExpress.XtraEditors.SimpleButton BtnContinuar;
        private DevExpress.XtraEditors.SimpleButton BtnCancelar;
        private DevExpress.XtraEditors.ButtonEdit EdtEvento;
        private DevExpress.XtraLayout.LayoutControlGroup Root;
        private DevExpress.XtraLayout.LayoutControlItem ItemEvento;
        private DevExpress.XtraLayout.LayoutControlItem ItemContinuarIgnorar;
        private DevExpress.XtraLayout.LayoutControlItem ItemContinuar;
        private DevExpress.XtraLayout.EmptySpaceItem ItemEspaco;
        private ICSharpCode.TextEditor.TextEditorControl TxtContexto;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem1;
    }
}