using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using System.Data;
namespace CapaNegocio
{
    public class NCategoria
    {
        // metod Insertar que llama al metodo insertar de la clase DCategoria (capa Datos)
        public static string Insertar( string nombre, string descripcion)
        {
            DCategoria obj = new DCategoria();
            obj.Nombre = nombre;
            obj.Descripcion = descripcion;

            return obj.Insertar(obj);
        }

        // metod Editar que llama al metodo Editar de la clase DCategoria (capa Datos)
        public static string Editar(int idcategoria, string nombre, string descripcion)
        {
            DCategoria obj = new DCategoria();
            obj.Idcategoria = idcategoria;
            obj.Nombre = nombre;
            obj.Descripcion = descripcion;

            return obj.Editar(obj);
        }

        // metod Eliminar que llama al metodo Eliminar de la clase DCategoria (capa Datos)
        public static string Eliminar(int idcategoria)
        {
            DCategoria obj = new DCategoria();
            obj.Idcategoria = idcategoria;            

            return obj.Eliminar(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DCategoria (capa Datos)
        public static DataTable Mostrar()
        {
            return new DCategoria().Mostrar();
        }

        public static DataTable BuscarNombre( string textoBuscar)
        {
            DCategoria obj = new DCategoria();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarNombre(obj);
        }        
    }
}
