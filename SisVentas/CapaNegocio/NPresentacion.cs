using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using System.Data;

namespace CapaNegocio
{
    public class NPresentacion
    {
        // metod Insertar que llama al metodo insertar de la clase DPresentacion (capa Datos)
        public static string Insertar(string nombre, string descripcion)
        {
            DPresentacion obj = new DPresentacion();
            obj.Nombre = nombre;
            obj.Descripcion = descripcion;

            return obj.Insertar(obj);
        }

        // metod Editar que llama al metodo Editar de la clase DPresentacion (capa Datos)
        public static string Editar(int idpresentacion, string nombre, string descripcion)
        {
            DPresentacion obj = new DPresentacion();
            obj.Idpresentacion = idpresentacion;
            obj.Nombre = nombre;
            obj.Descripcion = descripcion;

            return obj.Editar(obj);
        }

        // metod Eliminar que llama al metodo Eliminar de la clase DPresentacion (capa Datos)
        public static string Eliminar(int idpresentacion)
        {
            DPresentacion obj = new DPresentacion();
            obj.Idpresentacion = idpresentacion;

            return obj.Eliminar(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DPresentacion (capa Datos)
        public static DataTable Mostrar()
        {
            return new DPresentacion().Mostrar();
        }

        public static DataTable BuscarNombre(string textoBuscar)
        {
            DPresentacion obj = new DPresentacion();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarNombre(obj);
        }
    }
}
