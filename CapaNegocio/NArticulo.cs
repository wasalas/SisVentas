using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using System.Data;

namespace CapaNegocio
{
    public class NArticulo
    {
        // metod Insertar que llama al metodo insertar de la clase DArticulo (capa Datos)
        public static string Insertar(string codigo, string nombre, string descripcion, byte[] imagen, int idcategoria, int idpresentacion)
        {
            DArticulo obj = new DArticulo();
            obj.Codigo = codigo;
            obj.Nombre = nombre;
            obj.Descripcion = descripcion;
            obj.Imagen = imagen;
            obj.Idcategoria = idcategoria;
            obj.Idpresentacion = idpresentacion;

            return obj.Insertar(obj);
        }

        // metod Editar que llama al metodo Editar de la clase DArticulo (capa Datos)
        public static string Editar(int idarticulo, string codigo, string nombre, string descripcion, byte[] imagen, int idcategoria, int idpresentacion)
        {
            DArticulo obj = new DArticulo();
            obj.Idarticulo = idarticulo;
            obj.Codigo = codigo;
            obj.Nombre = nombre;
            obj.Descripcion = descripcion;
            obj.Imagen = imagen;
            obj.Idcategoria = idcategoria;
            obj.Idpresentacion = idpresentacion;

            return obj.Editar(obj);
        }

        // metod Eliminar que llama al metodo Eliminar de la clase DArticulo (capa Datos)
        public static string Eliminar(int idarticulo)
        {
            DArticulo obj = new DArticulo();
            obj.Idarticulo = idarticulo;

            return obj.Eliminar(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DArticulo (capa Datos)
        public static DataTable Mostrar()
        {
            return new DArticulo().Mostrar();
        }

        public static DataTable BuscarNombre(string textoBuscar)
        {
            DArticulo obj = new DArticulo();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarNombre(obj);
        }
        public static DataTable Stock_Articulos()
        {
            return new DArticulo().Stock_Articulos();
        }
    }
}
