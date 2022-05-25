using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    class Conexion
    {
        // public static string Cn = "Data Source=DESKWSW10; Initial Catalog=dbVentas; Integrated Security=True";
        public static string Cn = Properties.Settings.Default.cn;
    }
}
