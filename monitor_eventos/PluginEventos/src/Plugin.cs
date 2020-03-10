// O assembly do plugin deve ser Plugin.[NomeDoPlugin]
// O namespace aqui deve ser Plugin[NomeDoPlugin]
namespace PluginEventos
{
    using System;
    using System.Collections.Generic;
    using System.Reflection;
    using Newtonsoft.Json.Linq;
    using PluginEventos.ui;
    using static PluginEventos.ui.FormNotificacao;

    public static class Plugin
    {
        private static readonly Lazy<List<string>> _ignoreList = new Lazy<List<string>>(() => new List<string>());
        private static bool _modoServer;

        public static string ObterNome()
            => "Monitor de eventos";

        public static string ObterVersao()
            => Assembly.GetExecutingAssembly().GetName().Version.ToString();

        public static bool ObterGlobal()
            => false;

        public static string ObterDadosFabricante()
            => new DadosDoFabricante().ToString();

        #pragma warning disable RCS1163 // Unused parameter.
        #pragma warning disable IDE0060 // Remove unused parameter        
        public static string ObterDadosLicenca(string info)
            => "{\"chave_extensao\": \"79701D1D-FA1C-44CD-A789-6E867D8FBC23\", \"sistema\": true}";

        public static void Configurar(string maquinas)
        #pragma warning restore IDE0060 // Remove unused parameter
        #pragma warning restore RCS1163 // Unused parameter.
        {
            using var frmConfig = new FormConfig();

            frmConfig.ShowDialog();
        }

        public static string Notificar(string sEvento, string sContexto)
        {
            if (!_modoServer)
            {
                if (_ignoreList.Value.Contains(sEvento))
                    return string.Empty;
            }

            Retorno? retorno = FormNotificacao.Executar(sEvento, sContexto, _modoServer, _ignoreList.Value);

            if (retorno is null)
                return string.Empty;

            Retorno ret = retorno.Value;

            if ((!_modoServer) && ret.Ignorar)
                _ignoreList.Value.Add(sEvento);

            var json = JObject.Parse(ret.Modificadores);
            if (!string.IsNullOrWhiteSpace(ret.Acao))
                json["acao"] = ret.Acao;

            if (!string.IsNullOrWhiteSpace(ret.Erro))
                json["erro"] = ret.Erro;

            return json.ToString();
        }

        public static void RegistrarAssinaturas()
        {
            var config = new Configuracoes();

            foreach (string evento in config.ObterEventosMarcados())
            {
                string nome = evento.Replace("_", ".");
                Colibri.AssinarEvento(nome);
            }
        }

        public static void RegistrarAssinaturasServer()
        {
            RegistrarAssinaturas();
            _modoServer = true;
        }

        public static string RegistrarPermissoes()
            => string.Empty;
    }
}
