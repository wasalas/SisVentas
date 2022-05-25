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
    public partial class frmPresentacion : Form
    {
        
        public frmPresentacion()
        {
            InitializeComponent();            
        }

        private void frmPresentacion_Load(object sender, EventArgs e)
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

        // Mostrar todos los registros de la tabla Presentacion
        private void Mostrar()
        {
            // this.dataListado.DataSource = "";
            this.dataListado.DataSource = NPresentacion.Mostrar();

            this.dataListado.Columns[0].HeaderText = "Id";
            this.dataListado.Columns[0].Width = 70;
            this.dataListado.Columns[0].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            this.dataListado.Columns[0].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            // this.dataListado.Columns[0].Visible = false;

            this.dataListado.Columns[1].HeaderText = "Nombre de la Presentacion";
            this.dataListado.Columns[1].Width = 200;

            this.dataListado.Columns[2].HeaderText = "Descripcion de la Presentacion";
            this.dataListado.Columns[2].Width = 300;

            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }

        // Buscar nombre
        private void BuscarNombre()
        {
            this.dataListado.DataSource = NPresentacion.BuscarNombre(txtBuscar.Text);            
            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }

        public void Editar( string accion)
        {
            frmPresentacionEdit frm = new frmPresentacionEdit();
            frm.Accion = accion;

            if (accion != "N")
            {
                int id = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idpresentacion"].Value);
                string nom = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
                string des = Convert.ToString(this.dataListado.CurrentRow.Cells["descripcion"].Value);

                frm.Idpresentacion = id;
                frm.setPresentacion(nom, des);
            }
            frm.ShowDialog();
            Mostrar();
        }

        private void BtnNuevo_Click_1(object sender, EventArgs e)
        {
            Editar("N");
        }

        private void BtnModificar_Click(object sender, EventArgs e)
        {
            Editar("M");
        }

        private void BtnVer_Click(object sender, EventArgs e)
        {
            Editar("V");
        }

        private void BtnEliminar_Click_1(object sender, EventArgs e)
        {
            try
            {
                DialogResult opcion;
                int id = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idpresentacion"].Value);
                string nom = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
                string des = Convert.ToString(this.dataListado.CurrentRow.Cells["descripcion"].Value);

                opcion = MessageBox.Show("¿Esta seguro de eliminar \n" + nom + ".?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (opcion == DialogResult.Yes)
                {
                    string rpta = "";
                    rpta = NPresentacion.Eliminar(Convert.ToInt32(id));
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

        private void BtnImprimir_Click(object sender, EventArgs e)
        {
            frmReportePresentacion frm = new frmReportePresentacion();
            frm.ShowDialog();
        }

        private void BtnSalir_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void DataListado_DoubleClick_1(object sender, EventArgs e)
        {
            Editar("V");
        }

        private void TxtBuscar_TextChanged_1(object sender, EventArgs e)
        {
            this.BuscarNombre();
        }

        private void BtnBuscar_Click_1(object sender, EventArgs e)
        {
            this.BuscarNombre();
        }

        private void DataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
