using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class DDetalle_Venta
    {
        private int _Iddetalle_Venta;
        private int _Idventa;
        private int _Iddetalle_Ingreso;
        private int _Cantidad;
        private decimal _Precio_Venta;
        private decimal _Descuento;        

        public int Iddetalle_Venta { get => _Iddetalle_Venta; set => _Iddetalle_Venta = value; }
        public int Idventa { get => _Idventa; set => _Idventa = value; }
        public int Iddetalle_Ingreso { get => _Iddetalle_Ingreso; set => _Iddetalle_Ingreso = value; }
        public int Cantidad { get => _Cantidad; set => _Cantidad = value; }
        public decimal Precio_Venta { get => _Precio_Venta; set => _Precio_Venta = value; }
        public decimal Descuento { get => _Descuento; set => _Descuento = value; }

        public DDetalle_Venta()
        {
            
        }
        public DDetalle_Venta(int iddetalle_venta, int idventa, int iddetalle_ingreso, int cantidad, decimal precio_venta, decimal descuento)
        {
            this.Iddetalle_Venta = iddetalle_venta;
            this.Idventa = idventa;
            this.Iddetalle_Ingreso = iddetalle_ingreso;
            this.Cantidad = cantidad;
            this.Precio_Venta = precio_venta;
            this.Descuento = descuento;
        }

        // metodo insertar
        public string Insertar(DDetalle_Venta Detalle_Venta, ref SqlConnection SqlCon, ref SqlTransaction SqlTran)
        {
            string rpta = "";
            try
            {


                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.Transaction = SqlTran;
                SqlCmd.CommandText = "spInsertar_detalle_venta";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParIddetalle_Venta = new SqlParameter();
                ParIddetalle_Venta.ParameterName = "@iddetalle_venta";
                ParIddetalle_Venta.SqlDbType = SqlDbType.Int;
                ParIddetalle_Venta.Direction = ParameterDirection.Output;
                SqlCmd.Parameters.Add(ParIddetalle_Venta);

                SqlParameter ParIdventa = new SqlParameter();
                ParIdventa.ParameterName = "@idventa";
                ParIdventa.SqlDbType = SqlDbType.Int;
                ParIdventa.Value = Detalle_Venta.Idventa;
                SqlCmd.Parameters.Add(ParIdventa);

                SqlParameter ParIddetalle_ingreso = new SqlParameter();
                ParIddetalle_ingreso.ParameterName = "@iddetalle_ingreso";
                ParIddetalle_ingreso.SqlDbType = SqlDbType.Int;
                ParIddetalle_ingreso.Value = Detalle_Venta._Iddetalle_Ingreso;
                SqlCmd.Parameters.Add(ParIddetalle_ingreso);

                SqlParameter ParCantidad = new SqlParameter();
                ParCantidad.ParameterName = "@cantidad";
                ParCantidad.SqlDbType = SqlDbType.Int;
                ParCantidad.Value = Detalle_Venta.Cantidad;
                SqlCmd.Parameters.Add(ParCantidad);

                SqlParameter ParPrecio_Venta = new SqlParameter();
                ParPrecio_Venta.ParameterName = "@precio_venta";
                ParPrecio_Venta.SqlDbType = SqlDbType.Money;
                ParPrecio_Venta.Value = Detalle_Venta.Precio_Venta;
                SqlCmd.Parameters.Add(ParPrecio_Venta);

                SqlParameter ParDescuento = new SqlParameter();
                ParDescuento.ParameterName = "@descuento";
                ParDescuento.SqlDbType = SqlDbType.Money;
                ParDescuento.Value = Detalle_Venta.Descuento;
                SqlCmd.Parameters.Add(ParDescuento);

                rpta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se ingreso el registro";
            }
            catch (Exception ex)
            {
                rpta = ex.Message;
            }
            return rpta;
        }
    }
}
