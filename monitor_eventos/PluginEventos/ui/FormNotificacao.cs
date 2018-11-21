using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Windows.Forms;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NLog;
using NLog.Config;
using NLog.Targets;

namespace PluginEventos.ui
{
    public partial class FormNotificacao: DevExpress.XtraEditors.XtraForm
    {
        public struct Retorno
        {
            #region Propriedades
            public string Acao { get; set; }

            public string Erro { get; set; }

            public bool Ignorar { get; set; }

            public string Modificadores { get; set; }
            #endregion
        }

        #region Propriedades
        public string Acao { get; set; }

        public string Erro { get; set; }
        #endregion

        #region Construtores

        public FormNotificacao()
            => InitializeComponent();
        #endregion

        #region Metodos
        private static void Logar(string evento, string contexto, bool modoServer)
        {
            if (_logger is null)
            {
                string arqNome = modoServer ? "eventos_server.log" : "eventos.log";
                _logConfig = new LoggingConfiguration();
                string pastaLog = Colibri.ObterPastaDeLogs(Assembly.GetExecutingAssembly().GetName().Name);
                _target = new FileTarget
                {
                    Name = "eventos",
                    FileName = Path.Combine(pastaLog, arqNome),
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

        public static Retorno? Executar(string evento, string contexto, bool modoServer, List<string> ignoreList)
        {
            Logar(evento, contexto, modoServer);
            var conf = new Configuracoes();

            if (modoServer || (!conf.EstaAtivado("MostrarEvento")))
                return null;

            using (var frm = new FormNotificacao())
            {
                frm.CarregarEvento(evento, contexto);
                frm.StartPosition = FormStartPosition.CenterScreen;
                frm.LstIgnorados.DataSource = ignoreList;
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
        }

        private string ObterModificadores()
        {
            if (string.IsNullOrWhiteSpace(TxtModificadores.Text))
                return "{}";
            else
            {
                var json = JObject.Parse("{}");
                json.Add("modificadores", JObject.Parse(TxtModificadores.Text));
                return json.ToString();
            }
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
            EdtEvento.Text = evento;
        }

        private void BtnCopiar_Click(object sender, EventArgs e)
            => Clipboard.SetText(TxtContexto.Text);

        private void BtnEnviar_Click(object sender, EventArgs e)
        {
            Erro = MemoErro.Text;
            DialogResult = DialogResult.OK;
        }

        private void BtnInterromper_Click(object sender, EventArgs e)
        {
            Acao = "abort";
            Erro = MemoErro.Text;
            DialogResult = DialogResult.OK;
        }

        #endregion

        #region Private static fields

        private static LoggingConfiguration _logConfig;
        private static Target _target;
        private static Logger _logger;
        #endregion
    }
}
