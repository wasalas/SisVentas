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
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            MostrarHora();
            this.txtUsuario.Text = "wasalas";
            this.txtPassword.Text = "wasalas7140";
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            MostrarHora();
        }

        private void cbSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void MostrarHora()
        {
            lblHora.Text = DateTime.Now.ToString();
        }

        private void cbIngresar_Click(object sender, EventArgs e)
        {
            DataTable Datos = NTrabajador.Login(txtUsuario.Text, txtPassword.Text);
            if (Datos.Rows.Count == 0)
            {
                MessageBox.Show("Usuario y Clave no existen", "Informacion", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                frmPrincipal frm = new frmPrincipal();
                frm.Idtrabajador = Datos.Rows[0][0].ToString();                
                frm.Apellidos = Datos.Rows[0][1].ToString();
                frm.Nombre = Datos.Rows[0][2].ToString();
                frm.Acceso = Datos.Rows[0][3].ToString();

                frm.Show();
                this.Hide();
            }
        }
    }
}
