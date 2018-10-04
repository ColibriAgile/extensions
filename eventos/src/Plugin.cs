using System.Collections.Generic;
using System.Reflection;
using System.Web.Script.Serialization;

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
        #region Metodos
        /******************************************
          * 
          * Funções obrigatórias
          * 
          ******************************************/
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

        /******************************************
         * 
         * Funções opcionais
         * 
         ******************************************/
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
            //Colibri.MostrarMensagem("Teste", Colibri.TipoMensagem.aviso);
            // Aqui você é notificado dos eventos
            return string.Empty;
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
