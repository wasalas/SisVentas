using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NIngreso
    {
        // metod Insertar que llama al metodo insertar de la clase DCategoria (capa Datos)
        public static string Insertar(int idtrabajador, int idproveedor, DateTime fecha, string tipo_comprobante, string serie, string correlativo, decimal igv, string estado, DataTable dtDetalles)
        {
            DIngreso obj = new DIngreso();
            obj.Idtrabajador = idtrabajador;
            obj.Idproveedor = idproveedor;
            obj.Fecha = fecha;
            obj.Tipo_Comprobante = tipo_comprobante;
            obj.Serie = serie;
            obj.Correlativo = correlativo;
            obj.Igv = igv;
            obj.Estado = estado;
            List<DDetalle_Ingreso> detalles = new List<DDetalle_Ingreso>();
            foreach (DataRow row in dtDetalles.Rows)
            {
                DDetalle_Ingreso detalle = new DDetalle_Ingreso();
                detalle.Idarticulo = Convert.ToInt32(row["idarticulo"].ToString());
                detalle.Precio_Compra = Convert.ToDecimal(row["precio_compra"].ToString());
                detalle.Precio_Venta = Convert.ToDecimal(row["precio_venta"].ToString());
                detalle.Stock_Inicial = Convert.ToInt32(row["stock_inicial"].ToString());
                // detalle.Stock_Actual = Convert.ToInt32(row["stock_actual"].ToString());
                detalle.Fecha_Produccion = Convert.ToDateTime(row["fecha_produccion"].ToString());
                detalle.Fecha_Vencimiento = Convert.ToDateTime(row["fecha_vencimiento"].ToString());
                detalles.Add(detalle);
            }

            return obj.Insertar(obj, detalles);
        }

        
        // metod Anular que llama al metodo Eliminar de la clase DCategoria (capa Datos)
        public static string Anular(int idingreso)
        {
            DIngreso obj = new DIngreso();
            obj.Idingreso = idingreso;

            return obj.Anular(obj);
        }

        // metod Mostrar que llama al metodo Mostrar de la clase DCategoria (capa Datos)
        public static DataTable Mostrar()
        {
            return new DIngreso().Mostrar();
        }

        public static DataTable BuscarFechas(string textoBuscar, string textoBuscar2)
        {
            DIngreso obj = new DIngreso();
            
            return obj.BuscarFechas(textoBuscar, textoBuscar2);
        }

        public static DataTable MostrarDetalle(string textoBuscar)
        {
            DIngreso obj = new DIngreso();

            return obj.MostrarDetalle(textoBuscar);
        }
    }
}
