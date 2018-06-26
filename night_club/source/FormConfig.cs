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
    public DadosPerfil dados;
    public FormConfig()
    {
      InitializeComponent();
    }

    private void FormConfig_Load(object sender, EventArgs e)
    {
      foreach (Perfil p in dados.ObterPerfis())
        cbPerfil.Items.Add(p);
      cbPerfil.SelectedIndex = 0;
      MontarItens();
    }

    private void MontarItens()
    {
      lvPerfil.Items.Clear();
      List<PerfilLimite> perfilLimite = dados.ObterLimites();

      foreach (PerfilLimite p in dados.ObterPerfis())
      {
        ListViewItem lvi = lvPerfil.Items.Add(p.NomePerfil);
        lvi.SubItems.Add(p.Limite.ToString());
        lvi.Tag = p.PerfilId;
      }
    }

    private void btAdicionar_Click(object sender, EventArgs e)
    {
      string sValor = textLimite.Text;
      int valor = 0;
      if (Int32.TryParse(sValor, out valor) && valor > 0)
      {
        dados.DefinirLimite(((Perfil)cbPerfil.SelectedItem).PerfilId, valor);
        MontarItens();
      }
      else
        Colibri.MostrarMensagem($"Valor inválido para o limite: '{sValor}'", Colibri.TipoMensagem.info, Plugin.ObterNome());
    }

    private void btRemover_Click(object sender, EventArgs e)
    {
      if (lvPerfil.SelectedItems.Count > 0)
      {
        dados.DefinirLimite((int)(lvPerfil.SelectedItems[0].Tag), 0);
        MontarItens();
      }
    }
  }
}
