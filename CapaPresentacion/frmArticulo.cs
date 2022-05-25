using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmArticulo : Form
    {        

        public void Editar(string accion)
        {
            frmArticuloEdit frm = new frmArticuloEdit();
            frm.Accion = accion;

            if (accion != "N")
            {
                int id     = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idarticulo"].Value);
                int codigo = Convert.ToInt32(this.dataListado.CurrentRow.Cells["codigo"].Value);
                string nom = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
                string des = Convert.ToString(this.dataListado.CurrentRow.Cells["descripcion"].Value);

                byte[] imagenBuffer = (byte[])this.dataListado.CurrentRow.Cells["imagen"].Value;
                System.IO.MemoryStream ms = new System.IO.MemoryStream(imagenBuffer);

                int idcategoria  = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idcategoria"].Value);
                string categoria = Convert.ToString(this.dataListado.CurrentRow.Cells["categoria"].Value);

                int idpresentacion  = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idpresentacion"].Value);
                string presentacion = Convert.ToString(this.dataListado.CurrentRow.Cells["presentacion"].Value);

                frm.Idarticulo = id;
                frm.setArticulo(codigo, nom, des, ms, idcategoria, categoria, idpresentacion, presentacion);
            }
            frm.ShowDialog();            
            Mostrar();
        }

        public frmArticulo()
        {
            InitializeComponent();
        }

        private void frmArticulo_Load(object sender, EventArgs e)
        {            
            this.Mostrar();            
        }

        // Mostrar mensaje de confirmacion
        private void MensajeOk(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // Mostrar mensaje de error
        private void MensajeError(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }       

        // Mostrar todos los registros de la tabla Articulo
        private void Mostrar()
        {
            this.dataListado.DataSource = NArticulo.Mostrar();

            this.dataListado.Columns[0].HeaderText = "Id";
            this.dataListado.Columns[0].Width = 30;
            this.dataListado.Columns[0].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            this.dataListado.Columns[0].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;            

            this.dataListado.Columns[1].HeaderText = "Codigo";
            this.dataListado.Columns[1].Width = 50;
            this.dataListado.Columns[1].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            this.dataListado.Columns[1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;

            this.dataListado.Columns[2].HeaderText = "Nombre del Articulo";
            this.dataListado.Columns[2].Width = 150;

            this.dataListado.Columns[3].HeaderText = "Descripcion del Articulo";
            this.dataListado.Columns[3].Width = 200;

            this.dataListado.Columns[4].HeaderText = "Imagen";
            this.dataListado.Columns[4].Width = 80;

            this.dataListado.Columns[5].HeaderText = "id Categoria";
            this.dataListado.Columns[5].Width = 10;
            this.dataListado.Columns[5].Visible = false;

            this.dataListado.Columns[6].HeaderText = "Categoria";
            this.dataListado.Columns[6].Width = 100;

            this.dataListado.Columns[7].HeaderText = "id presentacion";
            this.dataListado.Columns[7].Width = 10;
            this.dataListado.Columns[7].Visible = false;

            this.dataListado.Columns[8].HeaderText = "Presentacion";
            this.dataListado.Columns[8].Width = 100;

            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }

        // Buscar nombre
        private void BuscarNombre()
        {
            this.dataListado.DataSource = NArticulo.BuscarNombre(txtBuscar.Text);
            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }
       
        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }        

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.BuscarNombre();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            this.BuscarNombre();            
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            Editar("N");
        }       

        private void btnEditar_Click(object sender, EventArgs e)
        {
            Editar("M");
        }
                
        private void Mostrar_DatoSel()
        {
            String id = Convert.ToString(this.dataListado.CurrentRow.Cells["idarticulo"].Value);
            string nom = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
            lblDatoSel.Text = id + " - " + nom;
        }
        private void dataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            Mostrar_DatoSel();            
        }

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            Editar("V");           
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult opcion;
                int id = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idarticulo"].Value);
                string nom = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
                string des = Convert.ToString(this.dataListado.CurrentRow.Cells["descripcion"].Value);

                opcion = MessageBox.Show("¿Esta seguro de eliminar \n" + nom + ".?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (opcion == DialogResult.Yes)
                {
                    string rpta = "";
                    rpta = NArticulo.Eliminar(id);
                    if (rpta.Equals("Ok"))
                    {
                        MessageBox.Show("Se elimino satisfactoriamente el registro", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        MessageBox.Show(rpta, "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    Mostrar();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + " - " + ex.StackTrace);
            }         
        }        

        private void btnImprimir_Click(object sender, EventArgs e)
        {
            frmReporteArticulos frm = new frmReporteArticulos();
            frm.ShowDialog();
        }

        private void BtnVer_Click(object sender, EventArgs e)
        {
            Editar("V");
        }

        private void DataListado_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void DataListado_CurrentCellChanged(object sender, EventArgs e)
        {
            
        }
    }
}
