using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NVenta
    {
        // metod Insertar que llama al metodo insertar de la clase DCategoria (capa Datos)
        public static string Insertar(int idcliente, int idtrabajador, DateTime fecha, string tipo_comprobante, string serie, string correlativo, decimal igv, DataTable dtDetalles)
        {
            DVenta obj = new DVenta();
            obj.Idcliente = idcliente;
            obj.Idtrabajador = idtrabajador;            
            obj.Fecha = fecha;
            obj.Tipo_Comprobante = tipo_comprobante;
            obj.Serie = serie;
            obj.Correlativo = correlativo;
            obj.Igv = igv;            
            List<DDetalle_Venta> detalles = new List<DDetalle_Venta>();
            foreach (DataRow row in dtDetalles.Rows)
            {
                DDetalle_Venta detalle = new DDetalle_Venta();
                detalle.Iddetalle_Ingreso = Convert.ToInt32(row["iddetalle_ingreso"].ToString());
                detalle.Cantidad = Convert.ToInt32(row["cantidad"].ToString());
                detalle.Precio_Venta = Convert.ToDecimal(row["precio_venta"].ToString());
                detalle.Descuento = Convert.ToDecimal(row["descuento"].ToString());                
                detalles.Add(detalle);
            }

            return obj.Insertar(obj, detalles);
        }


        // metod Anular que llama al metodo Eliminar de la clase DCategoria (capa Datos)
        public static string Eliminar(int idventa)
        {
            DVenta obj = new DVenta();
            obj.Idventa = idventa;

            return obj.Eliminar(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DVenta (capa Datos)
        public static DataTable Mostrar()
        {
            return new DVenta().Mostrar();
        }

        public static DataTable BuscarFechas(string textoBuscar, string textoBuscar2)
        {
            DVenta obj = new DVenta();
            return obj.BuscarFechas(textoBuscar, textoBuscar2);
        }

        public static DataTable MostrarDetalle(string textoBuscar)
        {
            DVenta obj = new DVenta();
            return obj.MostrarDetalle(textoBuscar);
        }

        public static DataTable MostrarArticulo_Venta_Nombre(string textoBuscar)
        {
            DVenta obj = new DVenta();
            return obj.MostrarArticulo_Venta_Nombre(textoBuscar);
        }
        public static DataTable MostrarArticulo_Venta_Codigo(string textoBuscar)
        {
            DVenta obj = new DVenta();
            return obj.MostrarArticulo_Venta_Codigo(textoBuscar);
        }
    }
}
