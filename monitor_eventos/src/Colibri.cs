using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;

// O assembly do plugin deve ser Plugin.[NomeDoPlugin]
// O namespace aqui deve ser Plugin[NomeDoPlugin]
namespace PluginEventos
{
    public partial class Colibri
    {

        public static Dictionary<string, object> dictFuncoes;
        private static string _pastaBase = "";

        #region Metodos
        public static void AssinarEvento(string evento) 
            => ((Action<string>) dictFuncoes["AssinarEvento"])(evento);

        public static void Callback(string evento, string contexto) 
            => ((Action<string, string>) dictFuncoes["Callback"])(evento, contexto);

        public static void GravarConfig(string config, int maquinaId, string valor) 
            => ((Action<string, int, string>) dictFuncoes["GravarConfig"])(config, maquinaId, valor);

        public static int MostrarMensagem(string mensagem, TipoMensagem tipo, string titulo = "", string botaoPadrao = "nao", string alinhamento = "esquerda", string id = "")
        {
            string dados = $"{{\"mensagem\":\"{mensagem}\", \"tipo\":\"{tipo.ToString()}\", \"titulo\":\"{titulo}\", \"alinhamento\": \"{alinhamento}\", \"id\": \"{id}\"}}";
            return MostrarMensagem(dados);
        }
        public static int MostrarMensagem(string dados) 
            => ((Func<string, int>) dictFuncoes["MostrarMensagem"])(dados);

        public static string MostrarTeclado(string dados) 
            => ((Func<string, string>) dictFuncoes["MostrarTeclado"])(dados);

        public static string ObterConfigs(int maquina) 
            => ((Func<int, string>) dictFuncoes["ObterConfigs"])(maquina);

        public static int VerificarPermissao(string GUID, int elevar) 
            => ((Func<string, int, int>) dictFuncoes["VerificarPermissao"])(GUID, elevar);

        public static void AtribuirFuncoes(Dictionary<string, object> dictFuncoes)
            => Colibri.dictFuncoes = dictFuncoes;

        public static string ObterPastaDeLogs(string subpasta)
        {
            if (string.IsNullOrWhiteSpace(_pastaBase))
            {
                string s = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
                while (true)
                {
                    if (Directory.Exists(Path.Combine(s, "logs\\")))
                    {
                        _pastaBase = Path.Combine(s, "logs");
                        break;
                    }
                    s = Path.GetDirectoryName(s);
                    if (s.Length < 4)
                        throw new DirectoryNotFoundException(s);
                }
            }
            return Path.Combine(_pastaBase, subpasta);
        }
        #endregion
    }
}
