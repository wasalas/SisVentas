using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NProveedor
    {
        // metod Insertar que llama al metodo insertar de la clase DProveedor (capa Datos)
        public static string Insertar(string razon_social, string sector_comercial, string tipo_documento, string num_documento, string direccion, string telefono, string email, string url)
        {
            DProveedor obj = new DProveedor();

            obj.Razon_Social = razon_social;
            obj.Sector_Comercial = sector_comercial;
            obj.Tipo_Documento = tipo_documento;
            obj.Num_Documento = num_documento;
            obj.Direccion = direccion;
            obj.Telefono = telefono;
            obj.Email = email;
            obj.Url = url;                       

            return obj.Insertar(obj);
        }

        // metod Editar que llama al metodo Editar de la clase DProveedor (capa Datos)
        public static string Editar(int idproveedor, string razon_social, string sector_comercial, string tipo_documento, string num_documento, string direccion, string telefono, string email, string url)
        {
            DProveedor obj = new DProveedor();
            obj.Idproveedor = idproveedor;
            obj.Razon_Social = razon_social;
            obj.Sector_Comercial = sector_comercial;
            obj.Tipo_Documento = tipo_documento;
            obj.Num_Documento = num_documento;
            obj.Direccion = direccion;
            obj.Telefono = telefono;
            obj.Email = email;
            obj.Url = url;

            return obj.Editar(obj);
        }

        // metod Eliminar que llama al metodo Eliminar de la clase DProveedor (capa Datos)
        public static string Eliminar(int idproveedor)
        {
            DProveedor obj = new DProveedor();
            obj.Idproveedor = idproveedor;

            return obj.Eliminar(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DCategoria (capa Datos)
        public static DataTable Mostrar()
        {
            return new DProveedor().Mostrar();
        }

        public static DataTable BuscarRazon_Social(string textoBuscar)
        {
            DProveedor obj = new DProveedor();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarRazon_Social(obj);
        }
        public static DataTable BuscarNum_Documento(string textoBuscar)
        {
            DProveedor obj = new DProveedor();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarNum_Documento(obj);
        }

        // min 8:13 del video
    }
}
