// O assembly do plugin deve ser Plugin.[NomeDoPlugin]
// O namespace aqui deve ser Plugin[NomeDoPlugin]
namespace PluginEventos
{
    public partial class Colibri
    {
        public enum TipoMensagem
        {
            aguarde,
            aviso,
            info,
            erro,
            sucesso,
            pergunta
        }
    }
}
