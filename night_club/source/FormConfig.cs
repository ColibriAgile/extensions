using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace PluginNightClub
{
  public partial class FormConfig : Form
  {
    public class ComboboxItem
    {
      public string Text { get; set; }
      public int Value { get; set; }

      public override string ToString()
      {
        return Text;
      }
    }

    public SqlConnection conexao;
    public FormConfig()
    {
      InitializeComponent();
    }

    private void FormConfig_Load(object sender, EventArgs e)
    {
      conexao.Open();

      try
      {
        SqlCommand command = new SqlCommand("select id, nome from perfil", conexao);
        SqlDataReader dataReader;
        try
        {
          dataReader = command.ExecuteReader();
          while (dataReader.Read())
          {
            ComboboxItem item = new ComboboxItem();
            item.Value = (int)dataReader.GetValue(0);
            item.Text = (string) dataReader.GetValue(1);
            cbPerfil.Items.Add(item);
          }
          cbPerfil.SelectedIndex = 0;
          dataReader.Close();
        }
        finally
        {
          command.Dispose();
        }
      }
      finally
      {
        conexao.Close();
      }

      MontarItens();
    }

    private void MontarItens()
    {
      conexao.Open();

      lvPerfil.Items.Clear();

      try
      {
        SqlCommand command = new SqlCommand("select p.nome, m.maximo, m.perfil_id from [nightclub].[perfil] m join perfil p on p.id = m.perfil_id order by m.perfil_id", conexao);
        try
        {
          SqlDataReader dataReader = command.ExecuteReader();
          while (dataReader.Read())
          {
            ListViewItem lvi = lvPerfil.Items.Add((string)dataReader.GetValue(0));
            lvi.SubItems.Add(((int)dataReader.GetValue(1)).ToString());
            lvi.Tag = (int)dataReader.GetValue(2);
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
        conexao.Close();
      }
    }

    private void AdicionarItem(int perfil_id, int limite)
    {
      conexao.Open();

      try
      {
        SqlCommand command;
        if (limite == 0)
          command = new SqlCommand($"delete from [nightclub].[perfil] where perfil_id = {perfil_id}", conexao);
        else
          command = new SqlCommand(
            $@"if exists(select perfil_id from [nightclub].[perfil] where perfil_id = {perfil_id})
                update [nightclub].[perfil] set maximo = {limite} where perfil_id = {perfil_id}
              else
                insert into [nightclub].[perfil] (perfil_id, maximo) values ({perfil_id}, {limite})", conexao
          );

        command.ExecuteNonQuery();
      }
      finally
      {
        conexao.Close();
      }
    }

    private void btAdicionar_Click(object sender, EventArgs e)
    {
      string sValor = textLimite.Text;
      int valor = 0;
      if (Int32.TryParse(sValor, out valor) && valor > 0)
      {
        AdicionarItem(((ComboboxItem)cbPerfil.SelectedItem).Value, valor);
        MontarItens();
      }
      else
        Colibri.MostrarMensagem($"Valor inválido para o limite: '{sValor}'", Colibri.TipoMensagem.info, Plugin.ObterNome());
    }

    private void btRemover_Click(object sender, EventArgs e)
    {
      if (lvPerfil.SelectedItems.Count > 0)
      {
        AdicionarItem((int)(lvPerfil.SelectedItems[0].Tag), 0);
        MontarItens();
      }
    }
  }
}
