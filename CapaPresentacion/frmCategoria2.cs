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
    public partial class frmCategoria2 : Form
    {        

        public frmCategoria2()
        {
            InitializeComponent();            
        }

        // ************************ Load del formulario ************************
        private void frmCategoria_Load(object sender, EventArgs e)
        {
            this.Mostrar();            
        }
        
        // Mostrar todos los registros de la tabla Categorias
        private void Mostrar()
        {
            // this.dataListado.DataSource = "";
            this.dataListado.DataSource = NCategoria.Mostrar();

            this.dataListado.Columns[0].HeaderText = "Id";
            this.dataListado.Columns[0].Width = 70;
            this.dataListado.Columns[0].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            this.dataListado.Columns[0].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            // this.dataListado.Columns[0].Visible = false;

            this.dataListado.Columns[1].HeaderText = "Nombre de la Categoria";
            this.dataListado.Columns[1].Width = 200;

            this.dataListado.Columns[2].HeaderText = "Descripcion de la Categoria";
            this.dataListado.Columns[2].Width = 300;

            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }
        
        private void BuscarNombre()
        {
            this.dataListado.DataSource = NCategoria.BuscarNombre(txtBuscar.Text);
            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }

        // boton buscar
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.BuscarNombre();
        }

        // TextBox Buscar
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            this.BuscarNombre();
        }        

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            /* sfwrwererwe */
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult opcion;
                int id = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idcategoria"].Value);
                string nom = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
                string des = Convert.ToString(this.dataListado.CurrentRow.Cells["descripcion"].Value);

                opcion = MessageBox.Show("¿Esta seguro de eliminar \n" + nom + ".?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if(opcion == DialogResult.Yes)
                {
                    string rpta = "";
                    rpta = NCategoria.Eliminar(Convert.ToInt32(id));
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

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }
               
        private void BtnImprimir_Click(object sender, EventArgs e)
        {
            frmReporteCategoria frm = new frmReporteCategoria();
            frm.ShowDialog();
        }

        private void BtnNuevo_Click(object sender, EventArgs e) => Editar("N");

        private void BtnModificar_Click(object sender, EventArgs e) => Editar("M");

        private void BtnVer_Click(object sender, EventArgs e) => Editar("V");

        private void DataListado_DoubleClick_1(object sender, EventArgs e) => Editar("V");
        public void Editar(string accion)
        {
            frmCategoriaEdit frm = new frmCategoriaEdit();
            frm.Accion = accion;

            if (accion != "N")
            {
                int id = Convert.ToInt32(this.dataListado.CurrentRow.Cells["idcategoria"].Value);
                string nom = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
                string des = Convert.ToString(this.dataListado.CurrentRow.Cells["descripcion"].Value);

                frm.Idcategoria = id;
                frm.setCategoria(nom, des);
            }
            frm.ShowDialog();
            Mostrar();
        }

        private void DataListado_CurrentCellChanged(object sender, EventArgs e)
        {
            /*
            if ( this.dataListado.CurrentRow.Selected.GetType = null)
            { 
                // MessageBox.Show("Cambio");
                string id = Convert.ToString(this.dataListado.CurrentRow.Cells[0].Value);
                string nom = Convert.ToString(this.dataListado.CurrentRow.Cells[1].Value);
                string des = Convert.ToString(this.dataListado.CurrentRow.Cells[2].Value);
                lbl_current.Text = id.Trim() + " - " + nom.Trim() + " - " + des.Trim();
            }
            */
        }
    }
}
