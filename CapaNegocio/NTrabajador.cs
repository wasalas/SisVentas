using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NTrabajador
    {
        // metod Insertar que llama al metodo insertar de la clase DTrabajador (capa Datos)
        public static string Insertar(string nombre, string apellidos, string sexo, DateTime fecha_nacimiento, string num_documento, string direccion, string telefono, string email, string acceso, string usuario, string password)
        {
            DTrabajador obj = new DTrabajador();

            obj.Nombre = nombre;
            obj.Apellidos = apellidos;
            obj.Sexo = sexo;
            obj.Fecha_Nacimiento = fecha_nacimiento;
            obj.Num_Documento = num_documento;
            obj.Direccion = direccion;
            obj.Telefono = telefono;
            obj.Email = email;
            obj.Acceso = acceso;
            obj.Usuario = usuario;
            obj.Password = password;

            return obj.Insertar(obj);
        }

        // metod Editar que llama al metodo Editar de la clase DTrabajador (capa Datos)
        public static string Editar(int idtrabajador, string nombre, string apellidos, string sexo, DateTime fecha_nacimiento, string num_documento, string direccion, string telefono, string email, string acceso, string usuario, string password)
        {
            DTrabajador obj = new DTrabajador();

            obj.Idtrabajador = idtrabajador;
            obj.Nombre = nombre;
            obj.Apellidos = apellidos;
            obj.Sexo = sexo;
            obj.Fecha_Nacimiento = fecha_nacimiento;
            obj.Num_Documento = num_documento;
            obj.Direccion = direccion;
            obj.Telefono = telefono;
            obj.Email = email;
            obj.Acceso = acceso;
            obj.Usuario = usuario;
            obj.Password = password;
            return obj.Editar(obj);
        }

        // metod Eliminar que llama al metodo Eliminar de la clase DTrabajador (capa Datos)
        public static string Eliminar(int idtrabajador)
        {
            DTrabajador obj = new DTrabajador();
            obj.Idtrabajador = idtrabajador;

            return obj.Eliminar(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DTrabajador (capa Datos)
        public static DataTable Mostrar()
        {
            return new DTrabajador().Mostrar();
        }

        public static DataTable BuscarApellidos(string textoBuscar)
        {
            DTrabajador obj = new DTrabajador();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarApellidos(obj);
        }
        public static DataTable BuscarNum_Documento(string textoBuscar)
        {
            DTrabajador obj = new DTrabajador();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarNum_Documento(obj);
        }
        public static DataTable Login(string usuario, string password)
        {
            DTrabajador obj = new DTrabajador();
            obj.Usuario = usuario;
            obj.Password = password;
            return obj.Login(obj);
        }
    }
}
