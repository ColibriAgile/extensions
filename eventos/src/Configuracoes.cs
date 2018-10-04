using System.Collections.Generic;
using Newtonsoft.Json.Linq;

namespace PluginEventos
{
    public class Configuracoes
    {
        private readonly JObject config;

        public Configuracoes()
        {
            JObject arqConfig = JObject.Parse(Colibri.ObterConfigs(0));
            if (arqConfig != null && arqConfig.TryGetValue("configs", out JToken confs) && (confs is JObject))
                config = (JObject) confs;
        }

        public bool EstaAtivado(string nome)
        {
            return config != null && config.TryGetValue(nome, out JToken token) &&
                ((JObject) token).GetValue("valor").ToString().Equals("1");
        }

        public void GravarConfiguracao(string nome, bool valor) 
            => Colibri.GravarConfig(nome, 0, valor ? "1" : null);

        public List<string> ObterEventosMarcados()
        {
            var eventos = new List<string>();
            if (config is null)
                return eventos;

            foreach (KeyValuePair<string, JToken> item in config)
            {
                if (!item.Key.StartsWith("EventoDe"))
                    continue;

                if (((JObject) item.Value).TryGetValue("valor", out JToken token) && token.ToString().Equals("1"))
                    eventos.Add(item.Key);
            }
            return eventos;
        }
    }
}
