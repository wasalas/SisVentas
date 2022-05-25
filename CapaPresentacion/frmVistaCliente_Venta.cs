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
    public partial class frmVistaCliente_Venta : Form
    {
        // ocultar columnas
        private void OcultarColumnas()
        {
            this.dataListado.Columns[0].Visible = false;
            this.dataListado.Columns[1].Visible = false;
        }

        // Mostrar todos los registros de la tabla Categorias
        private void Mostrar()
        {
            this.dataListado.DataSource = NCliente.Mostrar();
            this.OcultarColumnas();
            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }

        // Buscar apellidos
        private void BuscarApellidos()
        {
            this.dataListado.DataSource = NCliente.BuscarApellidos(txtBuscar.Text);
            this.OcultarColumnas();
            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }

        // Buscar numero documento
        private void BuscarNum_Documento()
        {
            this.dataListado.DataSource = NCliente.BuscarNum_Documento(txtBuscar.Text);
            this.OcultarColumnas();
            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }
        public frmVistaCliente_Venta()
        {
            InitializeComponent();
        }

        private void frmVistaCliente_Venta_Load(object sender, EventArgs e)
        {
            Mostrar();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (this.cbBuscar.Text.Equals("Apellidos"))
            {
                this.BuscarApellidos();
            }
            if (this.cbBuscar.Text.Equals("Documento"))
            {
                this.BuscarNum_Documento();
            }
        }

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            string par1, par2;
            frmVenta form = frmVenta.GetInstancia();
            par1 = Convert.ToString(this.dataListado.CurrentRow.Cells["idcliente"].Value);
            par2 = Convert.ToString(this.dataListado.CurrentRow.Cells["apellidos"].Value) + " " +
                Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
            form.setCliente(par1, par2);
            this.Hide();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
