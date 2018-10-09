using System;
using System.IO;
using System.Reflection;
using System.Windows.Forms;
using DevExpress.XtraTreeList;
using DevExpress.XtraTreeList.Nodes;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace PluginEventos.ui
{
    public partial class FormConfig: DevExpress.XtraEditors.XtraForm
    {
        private const string MOSTRA_EVENTO = "MostrarEvento";
        private Configuracoes _config;

        #region Constructor
        public FormConfig()
        {
            InitializeComponent();
            CarregarTreeList();
        }
        #endregion

        #region Eventos
        private void FormConfig_Shown(object sender, EventArgs e)
            => Tree.ExpandAll();

        private void Tree_AfterCheckNode(object sender, NodeEventArgs e)
        {
            if (e.Node.Checked)
                e.Node.CheckAll();
            else
                e.Node.UncheckAll();
        }

        private void BtnMarcarTodos_Click(object sender, EventArgs e)
            => Tree.CheckAll();

        private void BtnDesmarcarTodos_Click(object sender, EventArgs e)
            => Tree.UncheckAll();

        private void BtnAplicar_Click(object sender, EventArgs e)
        {
            foreach (TreeListNode node in Tree.NodesIterator.All)
            {
                if (node.HasChildren)
                    continue;

                _config.GravarConfiguracao(ObterNomeEvento(node), node.Checked);
            }
            _config.GravarConfiguracao(MOSTRA_EVENTO, ChkMostrarNotificacao.Checked);
        }
        #endregion

        #region Metodos
        private void CarregarTreeList()
        {
            string arquivoEventos = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "eventos.json");

            _config = new Configuracoes();
            ChkMostrarNotificacao.Checked = _config.EstaAtivado(MOSTRA_EVENTO);
            using (StreamReader file = File.OpenText(arquivoEventos))
            using (var reader = new JsonTextReader(file))
            {
                var json = (JObject) JToken.ReadFrom(reader)["eventos"];
                var item = (JProperty) json.First;

                while (!(item is null))
                {
                    TreeListNode node = Tree.Nodes.Add(item.Name);
                    node.SetValue(0, item.Name);
                    var itens = (JArray) item.First;
                    string nome = "";
                    foreach (JToken filho in itens)
                    {
                        nome = ((JValue) filho).Value.ToString();
                        TreeListNode nodeEvento = node.Nodes.Add(nome);
                        nodeEvento.SetValue(0, nome);
                        bool selecionado = _config.EstaAtivado(ObterNomeEvento(nodeEvento));
                        nodeEvento.Checked = selecionado;
                    }
                    item = (JProperty) item.Next;
                }
            }
        }

        private static string ObterNomeEvento(TreeListNode node)
            => $"{node.ParentNode.GetValue(0)}_{node.GetValue(0)}";
        #endregion
    }
}
