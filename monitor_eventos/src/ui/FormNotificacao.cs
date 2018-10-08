using System;
using System.IO;
using System.Reflection;
using System.Windows.Forms;
using DevExpress.XtraEditors.Controls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NLog;
using NLog.Config;
using NLog.Targets;

namespace PluginEventos.ui
{
    public partial class FormNotificacao: Form
    {
        private static LoggingConfiguration _logConfig;
        private static Target _target;
        private static Logger _logger;
        public struct Retorno
        {
            public bool Ignorar { get; set; }
            public string Modificadores { get; set; }
            public string Erro { get; set; }
            public string Acao { get; set; }
        }

        #region Propriedades
        public string Acao { get; set; }
        public string Erro { get; set; }
        #endregion

        public FormNotificacao() => InitializeComponent();

        #region Metodos
        private static void Logar(string evento, string contexto, bool modoServer)
        {
            if (_logger is null)
            {
                string arqNome = modoServer ? "eventos_server.log" : "eventos.log";
                _logConfig = new LoggingConfiguration();
                _target = new FileTarget
                {
                    Name = "eventos",
                    FileName = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), arqNome),
                    ArchiveEvery = FileArchivePeriod.Day,
                    ArchiveNumbering = ArchiveNumberingMode.DateAndSequence,
                    ArchiveOldFileOnStartup = true,
                    Layout = "${date}: ${message}${newline}",
                    CreateDirs = true
                };
                _logConfig.AddTarget(_target);
                _logConfig.AddRuleForAllLevels(_target);
                LogManager.Configuration = _logConfig;
                _logger = LogManager.GetLogger("eventos");
            }
            _logger.Info($"{evento} -> {contexto}");
        }

        public static Retorno? Executar(string evento, string contexto, bool modoServer)
        {
            Logar(evento, contexto, modoServer);
            var conf = new Configuracoes();
            if (modoServer || !conf.EstaAtivado("MostrarEvento"))
                return null;
            var frm = new FormNotificacao();
            frm.CarregarEvento(evento, contexto);
            frm.StartPosition = FormStartPosition.CenterScreen;
            DialogResult ret = frm.ShowDialog();
            var retorno = new Retorno
            {
                Ignorar = ret == DialogResult.Abort,
                Modificadores = frm.ObterModificadores(),
                Acao = frm.Acao,
                Erro = frm.Erro
            };
            return retorno;
        }

        private string ObterModificadores()
        {
            if (TxtModificadores.Text.IsEmptyOrNull())
                return "{}";
            else
            {
                var json = JObject.Parse("{}");
                json.Add("modificadores", JObject.Parse(TxtModificadores.Text));
                return json.ToString();
            }
        }

        private void ValidarAbaErroSelecionada()
        {
            Tabs.SelectedTabPage = TabErro;
            TxtMensagemErro.SelectAll();
            TxtMensagemErro.Focus();
            MessageBox.Show("Informe a mensagem de erro antes de enviar um erro.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void CarregarEvento(string evento, string contexto)
        {
            var ctx = JObject.Parse(contexto);
            bool temModificadores = ctx.ContainsKey("modificadores");
            TxtModificadores.Text = temModificadores ? ctx["modificadores"].ToString(Formatting.Indented) : string.Empty;
            TabModificadores.PageVisible = temModificadores;
            if (temModificadores)
                ctx.Remove("modificadores");
            TxtContexto.Text = ctx.ToString(Formatting.Indented);
            TxtContexto.ReadOnly = true;
            TxtModificadores.ReadOnly = false;
            TxtEvento.Text = evento;

        }
        #endregion

        #region Eventos
        private void BtnCopiar_Click(object sender, EventArgs e)
            => Clipboard.SetText(TxtContexto.Text);

        private void BtnEnviarErro_Click(object sender, EventArgs e)
        {
            if (Tabs.SelectedTabPage == TabErro)
            {
                Erro = TxtMensagemErro.Text;
                DialogResult = DialogResult.OK;
            }
            else
                ValidarAbaErroSelecionada();
        }

        private void TxtEvento_Properties_ButtonClick(object sender, ButtonPressedEventArgs e)
            => Clipboard.SetText(TxtEvento.Text);

        private void BtnEnviarErroInterromper_Click(object sender, EventArgs e)
        {
            if (Tabs.SelectedTabPage == TabErro)
            {
                Acao = "abort";
                Erro = TxtMensagemErro.Text;
                DialogResult = DialogResult.Abort;
            }
            else
                ValidarAbaErroSelecionada();

        }
        #endregion
    }
}
