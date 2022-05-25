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
    public partial class frmReporteFactura : Form
    {
        private int _Idventa;
        public int Idventa { get => _Idventa; set => _Idventa = value; }
        public frmReporteFactura()
        {
            InitializeComponent();
        }

        

        private void frmReporteFactura_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'dsPrincipal.spReporte_factura' Puede moverla o quitarla según sea necesario.

            try
            {
                this.spReporte_facturaTableAdapter.Fill(this.dsPrincipal.spReporte_factura, this.Idventa);
                this.reportViewer1.RefreshReport();
            }
            catch (Exception)
            {
                this.reportViewer1.RefreshReport();
                throw;
            }
            
        }

        private void ReportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
