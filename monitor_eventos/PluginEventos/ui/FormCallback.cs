namespace PluginEventos.ui
{
    using System.Windows.Forms;
    using DevExpress.XtraEditors;

    public partial class FormCallback : XtraForm
    {
        public FormCallback()
        {
            InitializeComponent();
        }

        public static void Executar()
        {
            using var frm = new FormCallback();

            if (frm.ShowDialog() == DialogResult.OK)
                Colibri.Callback(frm.EdtEvento.Text, frm.TxtContexto.Text);
        }
    }
}