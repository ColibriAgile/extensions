using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace PluginNightClub
{
  public class Perfil
  {
    public string NomePerfil { get; set; }
    public int PerfilId { get; set; }

    public override string ToString()
    {
      return NomePerfil;
    }
  }

  public class PerfilLimite : Perfil
  {
    public int Limite { get; set; }
  }

  public class DadosPerfil
  {
    public SqlConnection _conexao;
    public DadosPerfil(SqlConnection conexao)
    {
      _conexao = conexao;
    }

    public List<Perfil> ObterPerfis()
    {
      List<Perfil> result = new List<Perfil>();
      _conexao.Open();

      try
      {
        SqlCommand command = new SqlCommand("select id, nome from perfil", _conexao);
        SqlDataReader dataReader;
        try
        {
          dataReader = command.ExecuteReader();
          while (dataReader.Read())
          {
            Perfil item = new Perfil();
            item.PerfilId = (int)dataReader.GetValue(0);
            item.NomePerfil = (string)dataReader.GetValue(1);
            result.Add(item);
          }
          dataReader.Close();
        }
        finally
        {
          command.Dispose();
        }
      }
      finally
      {
        _conexao.Close();
      }

      return result;
    }

    public List<PerfilLimite> ObterLimites()
    {
      List<PerfilLimite> result = new List<PerfilLimite>();
      _conexao.Open();

      try
      {
        SqlCommand command = new SqlCommand("select p.nome, m.maximo, m.perfil_id from [nightclub].[perfil] m join perfil p on p.id = m.perfil_id order by m.perfil_id", _conexao);
        try
        {
          SqlDataReader dataReader = command.ExecuteReader();
          while (dataReader.Read())
          {
            PerfilLimite lim = new PerfilLimite();
            lim.NomePerfil = (string)dataReader.GetValue(0);
            lim.Limite = (int)dataReader.GetValue(1);
            lim.PerfilId = (int)dataReader.GetValue(2);
            result.Add(lim);
          }
          dataReader.Close();
        }
        finally
        {
          command.Dispose();
        }
      }
      finally
      {
        _conexao.Close();
      }
      return result;
    }

    public void DefinirLimite(int perfil_id, int limite)
    {
      _conexao.Open();

      try
      {
        SqlCommand command;
        if (limite == 0)
          command = new SqlCommand($"delete from [nightclub].[perfil] where perfil_id = {perfil_id}", _conexao);
        else
          command = new SqlCommand(
            $@"if exists(select perfil_id from [nightclub].[perfil] where perfil_id = {perfil_id})
                update [nightclub].[perfil] set maximo = {limite} where perfil_id = {perfil_id}
              else
                insert into [nightclub].[perfil] (perfil_id, maximo) values ({perfil_id}, {limite})",
            _conexao
          );

        command.ExecuteNonQuery();
      }
      finally
      {
        _conexao.Close();
      }
    }

  public bool DentroLimiteCheckin(int perfil)
    {
      bool ret = true;
      _conexao.Open();

      try
      {
        SqlCommand command = new SqlCommand(
          $"select u.usos, p.maximo from nightclub.uso_perfil u " +
          $" join nightclub.perfil p on u.perfil_id=p.perfil_id " +
          $" where u.perfil_id={perfil}", _conexao);

        SqlDataReader dataReader = command.ExecuteReader();
        if (dataReader.Read())
          ret = (int)dataReader.GetValue(0) < (int)dataReader.GetValue(1);

        return ret;
      }
      finally
      {
        _conexao.Close();
      }
    }
    public void IncrementarCheckin(int perfil)
    {
      bool ret = true;
      _conexao.Open();

      try
      {
        SqlCommand command= new SqlCommand(
            $@"if exists(select usos from [nightclub].[uso_perfil] where perfil_id = {perfil})
                update [nightclub].[uso_perfil] set usos = uso + 1 where perfil_id = {perfil}
              else
                insert into [nightclub].[uso_perfil] (perfil_id, usos) values ({perfil}, 1)",
            _conexao
          );
        command.ExecuteNonQuery();
      }
      finally
      {
        _conexao.Close();
      }
    }
  }
}
