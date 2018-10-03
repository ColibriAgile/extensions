using System.Reflection;
using System.Web.Script.Serialization;

// O assembly do plugin deve ser Plugin.[NomeDoPlugin]
// O namespace aqui deve ser Plugin[NomeDoPlugin]
namespace PluginEventos
{
    internal class DadosDoFabricante
    {
        public class Fabricante
        {
            public string empresa = "NCR";
            public string desenvolvedor = "NCR Colibri";
            public string termos_da_licenca = "";
            public string direitos_de_copia = "";
            public string marcas_registradas = "";
        }

        public class Suporte
        {
            public string email = "";
            public string url = "";
            public string telefone = "";
        }

        public Fabricante fabricante;
        public Suporte suporte;

        public DadosDoFabricante()
        {
            fabricante = new Fabricante();
            suporte = new Suporte();
        }

        public string ToJson()
        {
            var serializer = new JavaScriptSerializer();
            return serializer.Serialize(this);
        }
    }

    public class Plugin    {
        /******************************************
          * 
          * Funções obrigatórias
          * 
          ******************************************/
        public static string ObterNome() 
            => "Eventos";

        public static string ObterVersao() 
            => Assembly.GetExecutingAssembly().GetName().Version.ToString();

        public static string ObterDadosFabricante()
        {
            var dados = new DadosDoFabricante();
            dados.fabricante.empresa = "NCR";
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
            Colibri.MostrarMensagem("teste", Colibri.TipoMensagem.aviso, "Titulo", "sim", "direita");
            var testDialog = new FormConfig();
            testDialog.ShowDialog();
            testDialog.Dispose();
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
            Colibri.MostrarMensagem("Teste", Colibri.TipoMensagem.aviso);
            // Aqui você é notificado dos eventos
            return "";
        }

        public static void RegistrarAssinaturas()
        {
            // Aqui você assina os eventos
            Colibri.AssinarEvento("EventoDeSistema.PluginsCarregados");
        }

        public static string RegistrarPermissoes() 
            => "";
    }
}
