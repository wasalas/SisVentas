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

namespace CapaPresentacion.Consultas
{
    public partial class frmConsulta_Stock_Articulos : Form
    {
        public frmConsulta_Stock_Articulos()
        {
            InitializeComponent();
        }

        private void OcultarColumnas()
        {
            this.dataListado.Columns[0].Visible = false;            
        }

        // Mostrar todos los registros de la tabla Articulo
        private void Mostrar()
        {
            this.dataListado.DataSource = NArticulo.Stock_Articulos();
            this.OcultarColumnas();
            lblTotal.Text = "Total filas : " + Convert.ToString(dataListado.Rows.Count);
        }
        private void frmConsulta_Stock_Articulos_Load(object sender, EventArgs e)
        {
            this.Mostrar();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
