﻿#nullable enable
namespace PluginEventos.ui
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Reflection;
    using System.Windows.Forms;
    using DevExpress.XtraEditors;
    using Ncr.Ui;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;
    using NLog;
    using NLog.Config;
    using NLog.Targets;

    public partial class FormNotificacao : XtraForm
    {
        public struct Retorno
        {
            public string? Acao { get; set; }

            public string? Erro { get; set; }

            public bool Ignorar { get; set; }

            public string Modificadores { get; set; }
        }

        public string? Acao { get; set; }

        public string? Erro { get; set; }
        public bool PermiteInterromper { get; private set; }

        public FormNotificacao()
            => InitializeComponent();

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

            using var frm = new FormNotificacao();

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

        private string ObterModificadores()
        {
            if (string.IsNullOrWhiteSpace(TxtModificadores.Text))
                return "{}";

            var json = JObject.Parse("{}");
            json.Add("modificadores", JObject.Parse(TxtModificadores.Text));
            return json.ToString();
        }

        private void CarregarEvento(string evento, string contexto)
        {
            var ctx = JObject.Parse(contexto);
            bool temModificadores = ctx.ContainsKey("modificadores");
            TxtModificadores.Text = temModificadores ? ctx["modificadores"]?.ToString(Formatting.Indented) : string.Empty;
            TabModificadores.PageVisible = temModificadores;

            if (temModificadores)
                ctx.Remove("modificadores");

            PermiteInterromper = !ctx.ContainsKey("tolera_falhas") || !(bool)ctx["tolera_falhas"]!;

            LblToleraFalhas.Visible = !PermiteInterromper;
            TxtContexto.Text = ctx.ToString(Formatting.Indented);
            TxtContexto.ReadOnly = true;
            TxtModificadores.ReadOnly = false;
            EdtEvento.Text = evento;
        }

        private void BtnCopiar_Click(object sender, EventArgs e)
            => Clipboard.SetText(TxtContexto.Text);

        private void BtnEnviar_Click(object sender, EventArgs e)
        {
            VerificarSePodeInterromper();
            Erro = MemoErro.Text;
            DialogResult = DialogResult.OK;
        }

        private void BtnInterromper_Click(object sender, EventArgs e)
        {
            VerificarSePodeInterromper();
            Acao = "abort";
            Erro = MemoErro.Text;
            DialogResult = DialogResult.OK;
        }

        private void VerificarSePodeInterromper()
        {
            if (!PermiteInterromper)
                DlgMsg.Avisar
                (
                    "Este evento está sinalizado como tolerante a falhas. " +
                    "Isso significa que não é possível interromper este evento a partir de um plugin. " +
                    "Você ainda pode enviar uma mensagem junto com o ABORT, mas ela será somente gravada nos logs sem alerta visual. "
                );
        }

        private static LoggingConfiguration? _logConfig;
        private static Target? _target;
        private static Logger? _logger;

        private void BtnCallback_Click(object sender, EventArgs e)
            => FormCallback.Executar();
    }
}
