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
    const string PERM_PODE_AUMENTAR = "4131a855-cc3e-45ce-8b7b-6e4e02082504";
    const string EVENTO_CHECKIN_REALIZADO = "EventoDeTicket.CheckInRealizado";
    const string EVENTO_CHECKIN_INICIADO = "EventoDeTicket.AoIniciarCheckin";
    public static DadosPerfil dados;
    public static List<PerfilLimite> limites = null;

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
      formCfg.dados = dados;
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

    SqlConnection conexao = new SqlConnection(builder.ConnectionString);
    dados = new DadosPerfil(conexao);
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
    private static bool ObterPermissaoCheckin()
    {
      return true;
    }
    public static string Notificar(string sEvento, string sContexto)
    {
      // Aqui você é notificado dos eventos
      dynamic contexto = JObject.Parse(sContexto);

      if (sEvento == EVENTO_CHECKIN_INICIADO)
      {
        
        if (!dados.DentroLimiteCheckin(contexto["perfil"]) || Colibri.VerificarPermissao(PERM_PODE_AUMENTAR, 1) == 0)
        {
          dynamic ret = new JObject();
          ret.erro = "Limite de usos excedido para o perfil!";
          ret.acao = "abort";
          return ((JObject)ret).ToString();
        }
      }
      else if (sEvento == EVENTO_CHECKIN_REALIZADO)
      {
        dados.IncrementarCheckin(contexto["perfil"]);
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
      dynamic ret = new JObject();
      ret.descricao_plugin = "Night Club";
      ret.id = "02a40248-83ea-4fe4-b9a6-a70c0a1da384";
      ret.permissoes = new JArray() as dynamic;
      dynamic permissao = new JObject();
      permissao.descricao = "Exceder o limite de Check in de um perfil";
      permissao.id = PERM_PODE_AUMENTAR;
      permissao.grupos_liberados = new JArray() as dynamic;
      permissao.grupos_liberados.Add(-1);
      permissao.modo_venda = 4;
      ret.permissoes.Add(permissao);
      return ((JObject)ret).ToString();
    }
  }
}
