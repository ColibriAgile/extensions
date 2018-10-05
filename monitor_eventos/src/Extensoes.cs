using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PluginEventos
{
    public static class Extensoes
    {
        public static bool IsEmptyOrNull(this string str)
            => string.IsNullOrEmpty(str);
    }
}
