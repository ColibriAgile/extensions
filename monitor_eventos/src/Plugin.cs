using System.Collections.Generic;
using System.Reflection;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;
using static PluginEventos.FormNotificacao;

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
            public string empresa = "NCRLabs";
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
        private static readonly List<string> _ignoreList = new List<string>();
        #region Metodos
        public static string ObterNome()
            => "MonitorDeEventos";

        public static string ObterVersao()
            => Assembly.GetExecutingAssembly().GetName().Version.ToString();

        public static string ObterDadosFabricante()
        {
            var dados = new DadosDoFabricante();
            dados.fabricante.empresa = "NCRLabs";
            dados.fabricante.desenvolvedor = "NCR Labs";
            return dados.ToJson();
        }

        public static void Configurar(string maquinas)
        {
            var frmConfig = new FormConfig();
            frmConfig.ShowDialog();
            frmConfig.Dispose();
        }

        public static void ConfigurarDB(string servidor, string banco, string usuario, string senha, string provedor)
        {

        }

        public static void Ativar(int umaMaquina)
        {
        }

        public static void Desativar(int umaMaquina)
        {
        }

        public static void ObterMacro(string umaMacro)
        {
        }

        public static string Notificar(string sEvento, string sContexto)
        {
            if (_ignoreList.Contains(sEvento))
                return string.Empty;

            Retorno? retorno = FormNotificacao.Executar(sEvento, sContexto);

            if (retorno is null)
                return string.Empty;

            var ret = retorno.Value;

            if (ret.Ignorar)
                _ignoreList.Add(sEvento);


            var json = JObject.Parse(ret.Modificadores);
            if (!ret.Acao.IsEmptyOrNull())
                json["acao"] = ret.Acao;

            if (!ret.Erro.IsEmptyOrNull())
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

        public static string RegistrarPermissoes()
            => string.Empty;
        #endregion
    }
}
