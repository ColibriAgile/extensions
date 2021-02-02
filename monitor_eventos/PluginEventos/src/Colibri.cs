namespace PluginEventos
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Reflection;
    using Newtonsoft.Json.Linq;

    public static class Colibri
    {
        private static Dictionary<string, object> _dictFuncoes;
        private static string _pastaBase = "";

        public enum TipoMensagem
        {
            Aguarde,
            Aviso,
            Info,
            Erro,
            Sucesso,
            Pergunta
        }

        public static void AssinarEvento(string evento)
            => ((Action<string>)_dictFuncoes["AssinarEvento"])(evento);

        public static void AssinarEventos(params string[] eventos)
        {
            foreach (string evento in eventos)
                AssinarEvento(evento);
        }

        public static void AtribuirFuncoes(Dictionary<string, object> dictDeFuncoes)
            => _dictFuncoes = dictDeFuncoes;

        public static void Callback(string evento, string contexto)
            => ((Action<string, string>)_dictFuncoes["Callback"])(evento, contexto);

        public static void GravarConfig(string config, int maquinaId, string valor)
            => ((Action<string, int, string>)_dictFuncoes["GravarConfig"])(config, maquinaId, valor);

        public static int MostrarMensagem(string dados)
            => ((Func<string, int>)_dictFuncoes["MostrarMensagem"])(dados);

        public static int MostrarMensagem
        (
            string mensagem,
            TipoMensagem tipo,
            string titulo = "",
            string botaoPadrao = "nao",
            string alinhamento = "esquerda",
            string id = ""
        )
        {
            var dados = new JObject()
            {
                ["mensagem"] = mensagem,
                ["tipo"] = tipo.ToString(),
                ["titulo"] = titulo,
                ["alinhamento"] = alinhamento,
                ["id"] = id,
                ["botao_padrao"] = botaoPadrao
            };

            return MostrarMensagem(dados.ToString());
        }

        public static string MostrarTeclado(string dados)
            => ((Func<string, string>)_dictFuncoes["MostrarTeclado"])(dados);

        public static string ObterConfigs(int maquina)
            => ((Func<int, string>)_dictFuncoes["ObterConfigs"])(maquina);

        public static int VerificarPermissao(string guid, int elevar)
            => ((Func<string, int, int>)_dictFuncoes["VerificarPermissao"])(guid, elevar);

        public static string ObterPastaDeLogs(string subpasta)
        {
            if (string.IsNullOrWhiteSpace(_pastaBase))
            {
                string s = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
                while (true)
                {
                    if (Directory.Exists(Path.Combine(s!, "logs\\")))
                    {
                        _pastaBase = Path.Combine(s, "logs");
                        break;
                    }
                    s = Path.GetDirectoryName(s);
                    if (s != null && s.Length < 4)
                        throw new DirectoryNotFoundException(s);
                }
            }
            return Path.Combine(_pastaBase, subpasta);
        }
    }
}