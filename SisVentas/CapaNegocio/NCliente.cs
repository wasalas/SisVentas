using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NCliente
    {
        // metod Insertar que llama al metodo insertar de la clase DCliente (capa Datos)
        public static string Insertar(string nombre, string apellidos, string sexo, DateTime fecha_nacimiento, string tipo_documento, string num_documento, string direccion, string telefono, string email)
        {
            DCliente obj = new DCliente();

            obj.Nombre = nombre;
            obj.Apellidos = apellidos;
            obj.Sexo = sexo;
            obj.Fecha_Nacimiento = fecha_nacimiento;
            obj.Tipo_Documento = tipo_documento;
            obj.Num_Documento = num_documento;
            obj.Direccion = direccion;
            obj.Telefono = telefono;
            obj.Email = email;            

            return obj.Insertar(obj);
        }

        // metod Editar que llama al metodo Editar de la clase DCliente (capa Datos)
        public static string Editar(int idcliente, string nombre, string apellidos, string sexo, DateTime fecha_nacimiento, string tipo_documento, string num_documento, string direccion, string telefono, string email)
        {
            DCliente obj = new DCliente();

            obj.Idcliente = idcliente;
            obj.Nombre = nombre;
            obj.Apellidos = apellidos;
            obj.Sexo = sexo;
            obj.Fecha_Nacimiento = fecha_nacimiento;
            obj.Tipo_Documento = tipo_documento;
            obj.Num_Documento = num_documento;
            obj.Direccion = direccion;
            obj.Telefono = telefono;
            obj.Email = email;

            return obj.Editar(obj);
        }

        // metod Eliminar que llama al metodo Eliminar de la clase DCliente (capa Datos)
        public static string Eliminar(int idcliente)
        {
            DCliente obj = new DCliente();
            obj.Idcliente = idcliente;

            return obj.Eliminar(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DCliente (capa Datos)
        public static DataTable Mostrar()
        {
            return new DCliente().Mostrar();
        }

        public static DataTable BuscarApellidos(string textoBuscar)
        {
            DCliente obj = new DCliente();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarApellidos(obj);
        }
        public static DataTable BuscarNum_Documento(string textoBuscar)
        {
            DCliente obj = new DCliente();
            obj.TextoBuscar = textoBuscar;
            return obj.BuscarNum_Documento(obj);
        }       
    }
}
