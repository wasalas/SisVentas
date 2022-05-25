using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class frmReporteArticulos : Form
    {
        public frmReporteArticulos()
        {
            InitializeComponent();
        }

        private void frmReporteArticulos_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'dsPrincipal.spMostrar_articulo' Puede moverla o quitarla según sea necesario.
            this.spMostrar_articuloTableAdapter.Fill(this.dsPrincipal.spMostrar_articulo);


            this.reportViewer1.RefreshReport();
        }
    }
}
