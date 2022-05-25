﻿using System;
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
    public partial class frmReporteCategoria : Form
    {
        public frmReporteCategoria()
        {
            InitializeComponent();
        }

        private void FrmReporteCategoria_Load(object sender, EventArgs e)
        {
            try
            {
                // TODO: esta línea de código carga datos en la tabla 'dsPrincipal.spMostrar_categoria' 
                // Puede moverla o quitarla según sea necesario.
                this.spMostrar_categoriaTableAdapter.Fill(this.dsPrincipal.spMostrar_categoria);
                this.reportViewer1.RefreshReport();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al ejecutar el reporte : " + ex.Message, "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Error);
                this.reportViewer1.RefreshReport();
            }            
        }
    }
}
