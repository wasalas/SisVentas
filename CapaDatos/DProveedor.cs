using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class DProveedor
    {
        private int _Idproveedor;
        private string _Razon_Social;
        private string _Sector_Comercial;
        private string _Tipo_Documento;
        private string _Num_Documento;
        private string _Direccion;
        private string _Telefono;
        private string _Email;
        private string _Url;
        private string _TextoBuscar;

        public int Idproveedor { get => _Idproveedor; set => _Idproveedor = value; }
        public string Razon_Social { get => _Razon_Social; set => _Razon_Social = value; }
        public string Sector_Comercial { get => _Sector_Comercial; set => _Sector_Comercial = value; }
        public string Tipo_Documento { get => _Tipo_Documento; set => _Tipo_Documento = value; }
        public string Num_Documento { get => _Num_Documento; set => _Num_Documento = value; }
        public string Direccion { get => _Direccion; set => _Direccion = value; }
        public string Telefono { get => _Telefono; set => _Telefono = value; }
        public string Email { get => _Email; set => _Email = value; }
        public string Url { get => _Url; set => _Url = value; }
        public string TextoBuscar { get => _TextoBuscar; set => _TextoBuscar = value; }
        // constructor vacio
        public DProveedor()
        {
        }

        // constructor con parametros
        public DProveedor(int idproveedor, string razon_social, string sector_comercial, string tipo_documento, string num_documento, string direccion, string telefono, string email, string url, string textobuscar)
        {
            this.Idproveedor = idproveedor;
            this.Razon_Social = razon_social;
            this.Sector_Comercial = sector_comercial;
            this.Tipo_Documento = tipo_documento;
            this.Num_Documento= num_documento;
            this.Direccion = direccion;
            this.Telefono = telefono;
            this.Email = email;
            this.Url = url;
            this.TextoBuscar = textobuscar;
        }

        // metodo insertar
        public string Insertar(DProveedor Proveedor)
        {
            string rpta = "";
            SqlConnection SqlCon = new SqlConnection();
            try
            {
                SqlCon.ConnectionString = Conexion.Cn;
                SqlCon.Open();

                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spInsertar_Proveedor";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParIdproveedor = new SqlParameter();
                ParIdproveedor.ParameterName = "@idproveedor";
                ParIdproveedor.SqlDbType = SqlDbType.Int;
                ParIdproveedor.Direction = ParameterDirection.Output;
                SqlCmd.Parameters.Add(ParIdproveedor);

                SqlParameter ParRazon_Social = new SqlParameter();
                ParRazon_Social.ParameterName = "@razon_social";
                ParRazon_Social.SqlDbType = SqlDbType.VarChar;
                ParRazon_Social.Size = 150;
                ParRazon_Social.Value = Proveedor.Razon_Social;
                SqlCmd.Parameters.Add(ParRazon_Social);

                SqlParameter ParSector_Comercial = new SqlParameter();
                ParSector_Comercial.ParameterName = "@sector_comercial";
                ParSector_Comercial.SqlDbType = SqlDbType.VarChar;
                ParSector_Comercial.Size = 50;
                ParSector_Comercial.Value = Proveedor.Sector_Comercial;
                SqlCmd.Parameters.Add(ParSector_Comercial);

                SqlParameter ParTipo_Documento = new SqlParameter();
                ParTipo_Documento.ParameterName = "@tipo_documento";
                ParTipo_Documento.SqlDbType = SqlDbType.VarChar;
                ParTipo_Documento.Size = 20;
                ParTipo_Documento.Value = Proveedor.Tipo_Documento;
                SqlCmd.Parameters.Add(ParTipo_Documento);

                SqlParameter ParNum_Documento = new SqlParameter();
                ParNum_Documento.ParameterName = "@num_documento";
                ParNum_Documento.SqlDbType = SqlDbType.VarChar;
                ParNum_Documento.Size = 11;
                ParNum_Documento.Value = Proveedor.Num_Documento;
                SqlCmd.Parameters.Add(ParNum_Documento);

                SqlParameter ParDireccion = new SqlParameter();
                ParDireccion.ParameterName = "@direccion";
                ParDireccion.SqlDbType = SqlDbType.VarChar;
                ParDireccion.Size = 100;
                ParDireccion.Value = Proveedor.Direccion;
                SqlCmd.Parameters.Add(ParDireccion);

                SqlParameter ParTelefono = new SqlParameter();
                ParTelefono.ParameterName = "@telefono";
                ParTelefono.SqlDbType = SqlDbType.VarChar;
                ParTelefono.Size = 10;
                ParTelefono.Value = Proveedor.Telefono;
                SqlCmd.Parameters.Add(ParTelefono);

                SqlParameter ParEmail = new SqlParameter();
                ParEmail.ParameterName = "@email";
                ParEmail.SqlDbType = SqlDbType.VarChar;
                ParEmail.Size = 50;
                ParEmail.Value = Proveedor.Email;
                SqlCmd.Parameters.Add(ParEmail);

                SqlParameter ParUrl = new SqlParameter();
                ParUrl.ParameterName = "@url";
                ParUrl.SqlDbType = SqlDbType.VarChar;
                ParUrl.Size = 100;
                ParUrl.Value = Proveedor.Url;
                SqlCmd.Parameters.Add(ParUrl);

                rpta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se ingreso el registro";

            }
            catch (Exception ex)
            {

                rpta = ex.Message;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open) SqlCon.Close();
            }

            return rpta;
        }

        // metodo editar
        public string Editar(DProveedor Proveedor)
        {
            string rpta = "";
            SqlConnection SqlCon = new SqlConnection();
            try
            {
                SqlCon.ConnectionString = Conexion.Cn;
                SqlCon.Open();

                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spEditar_proveedor";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParIdproveedor = new SqlParameter();
                ParIdproveedor.ParameterName = "@idproveedor";
                ParIdproveedor.SqlDbType = SqlDbType.Int;
                ParIdproveedor.Value = Proveedor.Idproveedor;
                SqlCmd.Parameters.Add(ParIdproveedor);

                SqlParameter ParRazon_Social = new SqlParameter();
                ParRazon_Social.ParameterName = "@razon_social";
                ParRazon_Social.SqlDbType = SqlDbType.VarChar;
                ParRazon_Social.Size = 150;
                ParRazon_Social.Value = Proveedor.Razon_Social;
                SqlCmd.Parameters.Add(ParRazon_Social);

                SqlParameter ParSector_Comercial = new SqlParameter();
                ParSector_Comercial.ParameterName = "@sector_comercial";
                ParSector_Comercial.SqlDbType = SqlDbType.VarChar;
                ParSector_Comercial.Size = 50;
                ParSector_Comercial.Value = Proveedor.Sector_Comercial;
                SqlCmd.Parameters.Add(ParSector_Comercial);

                SqlParameter ParTipo_Documento = new SqlParameter();
                ParTipo_Documento.ParameterName = "@tipo_documento";
                ParTipo_Documento.SqlDbType = SqlDbType.VarChar;
                ParTipo_Documento.Size = 20;
                ParTipo_Documento.Value = Proveedor.Tipo_Documento;
                SqlCmd.Parameters.Add(ParTipo_Documento);

                SqlParameter ParNum_Documento = new SqlParameter();
                ParNum_Documento.ParameterName = "@num_documento";
                ParNum_Documento.SqlDbType = SqlDbType.VarChar;
                ParNum_Documento.Size = 11;
                ParNum_Documento.Value = Proveedor.Num_Documento;
                SqlCmd.Parameters.Add(ParNum_Documento);

                SqlParameter ParDireccion = new SqlParameter();
                ParDireccion.ParameterName = "@direccion";
                ParDireccion.SqlDbType = SqlDbType.VarChar;
                ParDireccion.Size = 100;
                ParDireccion.Value = Proveedor.Direccion;
                SqlCmd.Parameters.Add(ParDireccion);

                SqlParameter ParTelefono = new SqlParameter();
                ParTelefono.ParameterName = "@telefono";
                ParTelefono.SqlDbType = SqlDbType.VarChar;
                ParTelefono.Size = 10;
                ParTelefono.Value = Proveedor.Telefono;
                SqlCmd.Parameters.Add(ParTelefono);

                SqlParameter ParEmail = new SqlParameter();
                ParEmail.ParameterName = "@email";
                ParEmail.SqlDbType = SqlDbType.VarChar;
                ParEmail.Size = 50;
                ParEmail.Value = Proveedor.Email;
                SqlCmd.Parameters.Add(ParEmail);

                SqlParameter ParUrl = new SqlParameter();
                ParUrl.ParameterName = "@url";
                ParUrl.SqlDbType = SqlDbType.VarChar;
                ParUrl.Size = 100;
                ParUrl.Value = Proveedor.Url;
                SqlCmd.Parameters.Add(ParUrl);

                rpta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se actualizo el registro";

            }
            catch (Exception ex)
            {

                rpta = ex.Message;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open) SqlCon.Close();
            }

            return rpta;
        }

        // metodo eliminar
        public string Eliminar(DProveedor Proveedor)
        {
            string rpta = "";
            SqlConnection SqlCon = new SqlConnection();
            try
            {
                SqlCon.ConnectionString = Conexion.Cn;
                SqlCon.Open();

                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spEliminar_proveedor";
                SqlCmd.CommandType = CommandType.StoredProcedure;


                SqlParameter ParIdproveedor = new SqlParameter();
                ParIdproveedor.ParameterName = "@idproveedor";
                ParIdproveedor.SqlDbType = SqlDbType.Int;
                ParIdproveedor.Value = Proveedor.Idproveedor;
                SqlCmd.Parameters.Add(ParIdproveedor);
                
                rpta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se elimino el registro";

            }
            catch (Exception ex)
            {
                rpta = ex.Message;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open) SqlCon.Close();
            }

            return rpta;
        }

        // metodo mostrar
        public DataTable Mostrar()
        {
            string rpta = "";
            DataTable DtResultado = new DataTable("proveedor");
            SqlConnection SqlCon = new SqlConnection();
            try
            {
                SqlCon.ConnectionString = Conexion.Cn;
                //SqlCon.Open();  // aparece comentado en el video

                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spMostrar_proveedor";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter SqlDat = new SqlDataAdapter(SqlCmd);
                SqlDat.Fill(DtResultado);
            }
            catch (Exception ex)
            {
                rpta = ex.Message;
                DtResultado = null;
            }
            finally
            {
                // if (SqlCon.State == ConnectionState.Open) SqlCon.Close();   // aparece comentado en el video
            }
            return DtResultado;
        }

        // metodo buscar razon social
        public DataTable BuscarRazon_Social(DProveedor Proveedor)
        {
            string rpta = "";
            DataTable DtResultado = new DataTable("proveedor");
            SqlConnection SqlCon = new SqlConnection();
            try
            {
                SqlCon.ConnectionString = Conexion.Cn;
                //SqlCon.Open();

                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spBuscar_razon_social_proveedor";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParTextoBuscar = new SqlParameter();
                ParTextoBuscar.ParameterName = "@textobuscar";
                ParTextoBuscar.SqlDbType = SqlDbType.VarChar;
                ParTextoBuscar.Size = 150;
                ParTextoBuscar.Value = Proveedor.TextoBuscar;
                SqlCmd.Parameters.Add(ParTextoBuscar);


                SqlDataAdapter SqlDat = new SqlDataAdapter(SqlCmd);
                SqlDat.Fill(DtResultado);

            }
            catch (Exception ex)
            {

                rpta = ex.Message;
                DtResultado = null;
            }
            finally
            {
                //if (SqlCon.State == ConnectionState.Open) SqlCon.Close();
            }
            return DtResultado;
        }

        // metodo buscar numero_documento
        public DataTable BuscarNum_Documento(DProveedor Proveedor)
        {
            string rpta = "";
            DataTable DtResultado = new DataTable("proveedor");
            SqlConnection SqlCon = new SqlConnection();
            try
            {
                SqlCon.ConnectionString = Conexion.Cn;
                //SqlCon.Open();

                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spBuscar_num_documento_proveedor";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParTextoBuscar = new SqlParameter();
                ParTextoBuscar.ParameterName = "@textobuscar";
                ParTextoBuscar.SqlDbType = SqlDbType.VarChar;
                ParTextoBuscar.Size = 11;
                ParTextoBuscar.Value = Proveedor.TextoBuscar;
                SqlCmd.Parameters.Add(ParTextoBuscar);


                SqlDataAdapter SqlDat = new SqlDataAdapter(SqlCmd);
                SqlDat.Fill(DtResultado);

            }
            catch (Exception ex)
            {

                rpta = ex.Message;
                DtResultado = null;
            }
            finally
            {
                //if (SqlCon.State == ConnectionState.Open) SqlCon.Close();
            }
            return DtResultado;
        }

    }
}
