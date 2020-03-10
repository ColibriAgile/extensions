namespace PluginEventos
{
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;
    using Newtonsoft.Json.Serialization;

    public sealed class DadosDoFabricante
    {
        public DetalhesDoFabricante Fabricante { get; } = new DetalhesDoFabricante();

        public DetalhesDoSuporte Suporte { get; } = new DetalhesDoSuporte();

        public sealed class DetalhesDoFabricante
        {
            public string Desenvolvedor { get; set; } = "NCR";
            public string DireitosDeCopia { get; set; }
            public string Empresa { get; set; } = "NCR Corporation";
            public string MarcasRegistradas { get; set; }
            public string TermosDaLicenca { get; set; }
        }

        public sealed class DetalhesDoSuporte
        {
            public string Email { get; set; } = "suporte@ncr.com";
            public string Telefone { get; set; }
            public string Url { get; set; } = "https://www.ncr.com/br-pt/colibri";
        }

        /// <summary>
        ///     Retorna os dadps do fabricante em formato JSON.
        /// </summary>
        public override string ToString()
        {
            var contractResolver = new DefaultContractResolver
            {
                NamingStrategy = new SnakeCaseNamingStrategy()
            };
            var serializer = new JsonSerializer
            {
                ContractResolver = contractResolver,
                NullValueHandling = NullValueHandling.Include,
                DateFormatHandling = DateFormatHandling.IsoDateFormat,
                DateTimeZoneHandling = DateTimeZoneHandling.Unspecified,
                Formatting = Formatting.Indented,
                FloatParseHandling = FloatParseHandling.Decimal,
            };
            return JObject.FromObject(this, serializer).ToString();
        }
    }
}