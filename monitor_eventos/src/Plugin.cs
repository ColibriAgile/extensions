using System;
using System.Collections.Generic;
using System.Reflection;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;
using PluginEventos.ui;
using static PluginEventos.ui.FormNotificacao;

// O assembly do plugin deve ser Plugin.[NomeDoPlugin]
// O namespace aqui deve ser Plugin[NomeDoPlugin]
namespace PluginEventos
{
    internal class DadosDoFabricante
    {

        public Fabricante fabricante;
        public Suporte suporte;

        public class Fabricante
        {
            public string desenvolvedor = "NCR Colibri";
            public string direitos_de_copia = string.Empty;
            public string empresa = "NCR Labs";
            public string marcas_registradas = string.Empty;
            public string termos_da_licenca = string.Empty;
        }

        public class Suporte
        {
            public string email = "colibri.agile@ncr.com";
            public string telefone = "";
            public string url = "www.colibri.com.br";
        }

        #region Construtor
        public DadosDoFabricante()
        {
            fabricante = new Fabricante();
            suporte = new Suporte();
        }
        #endregion

        #region Metodos
        public string ToJson()
        {
            var serializer = new JavaScriptSerializer();
            return serializer.Serialize(this);
        }
        #endregion
    }

    public class Plugin
    {
        private static readonly Lazy<List<string>> _ignoreList = new Lazy<List<string>>(() => new List<string>());
        private static bool _modoServer;
        #region Metodos
        public static string ObterNome()
            => "Monitor de eventos";

        public static string ObterVersao()
            => Assembly.GetExecutingAssembly().GetName().Version.ToString();

        public static string ObterDadosFabricante()
            => new DadosDoFabricante().ToJson();

        public static void Configurar(string maquinas)
        {
            using (var frmConfig = new FormConfig())
            {
                frmConfig.ShowDialog();
            }
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
            List<string> eventos = config.ObterEventosMarcados();
            foreach (string evento in eventos)
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
        #endregion
    }
}
