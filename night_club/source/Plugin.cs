using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Reflection;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


// O assembly do plugin deve ser Plugin.[NomeDoPlugin]
// O namespace aqui deve ser Plugin[NomeDoPlugin]
namespace PluginNightClub
{
  class DadosDoFabricante
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
      JavaScriptSerializer serializer = new JavaScriptSerializer();
      return serializer.Serialize(this);
    }
  }

  public class Plugin
  {
    const string EVENTO_CHECKIN_REALIZADO = "EventoDeTicket.CheckInRealizado";
    public static SqlConnection conexao;

    /******************************************
     * 
     * Funções obrigatórias
     * 
     ******************************************/
    public static string ObterNome()
    {
      return "Night Club";
    }

    public static string ObterVersao()
    {
      return Assembly.GetExecutingAssembly().GetName().Version.ToString();
    }

    public static string ObterDadosFabricante()
    {
      DadosDoFabricante dados = new DadosDoFabricante();
      dados.fabricante.empresa = "NCR";
      dados.fabricante.desenvolvedor = "NCR Labs";
      dados.suporte.email = "colibri.agile@gmail.com";
      return dados.ToJson();
    }

    /******************************************
     * 
     * Funções opcionais
     * 
     ******************************************/
    public static void Configurar(string maquinas)
    {
      FormConfig formCfg = new FormConfig();
      formCfg.conexao = conexao;
      formCfg.ShowDialog();
      formCfg.Dispose();
    }

    public static void ConfigurarDB(string servidor, string banco, string usuario, string senha, string provedor)
    {
      SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder()
      {
        DataSource = servidor,
        InitialCatalog = banco,
        UserID = usuario,
        Password = senha,
      };

      conexao = new SqlConnection(builder.ConnectionString);
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
      // Aqui você é notificado dos eventos
      dynamic contexto = JObject.Parse(sContexto);

      if (sEvento == EVENTO_CHECKIN_REALIZADO)
      {
        if (contexto["perfil"] == 2)
          Colibri.MostrarMensagem("teste", Colibri.TipoMensagem.aviso, "Titulo", "perfil 2", "direita");
      }

      return "";
    }
    public static void RegistrarAssinaturas()
    {
      // Aqui você assina os eventos
      Colibri.AssinarEvento(EVENTO_CHECKIN_REALIZADO);
    }

    public static string RegistrarPermissoes()
    {
      return "";
    }
  }
}
