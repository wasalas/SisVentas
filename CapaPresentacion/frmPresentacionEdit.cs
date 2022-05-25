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
    public partial class frmPresentacionEdit : Form
    {
        private int _idpresentacion;
        private string _accion;

        public int Idpresentacion { get => _idpresentacion; set => _idpresentacion = value; }
        public string Accion { get => _accion; set => _accion = value; }

        public frmPresentacionEdit()
        {
            InitializeComponent();
        }

        private void CargaDatos()
        {
            if (this.Accion == "V")
            {
                txtNombre.Enabled = false;
                txtDescripcion.Enabled = false;
                btnGrabar.Enabled = false;
            }
        }

        public void setPresentacion(string nombre, string descripcion)
        {
            txtId.Text = Convert.ToString(this.Idpresentacion);
            txtNombre.Text = nombre;
            txtDescripcion.Text = descripcion;
        }

        public void GrabarNuevo()
        {
            string rpta = "";
            try
            {
                rpta = NPresentacion.Insertar(this.txtNombre.Text.Trim().ToUpper(), this.txtDescripcion.Text.Trim());
                if (rpta.Equals("Ok"))
                {
                    MessageBox.Show("Se inserto de forma correcta el registro", "Informacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "-" + ex.StackTrace);
            }
        }
        public void GrabarModificar()
        {
            string rpta = "";
            try
            {
                rpta = NPresentacion.Editar(Convert.ToInt32(this.txtId.Text),
                                        this.txtNombre.Text.Trim().ToUpper(),
                                        this.txtDescripcion.Text.Trim());
                if (rpta.Equals("Ok"))
                {
                    MessageBox.Show("Se actualizo de forma correcta el registro", "Informacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "-" + ex.StackTrace);
            }
        }

        private void FrmPresentacionEdit_Load(object sender, EventArgs e)
        {
            CargaDatos();
        }

        private void BtnGrabar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text.Equals(""))
            {
                MessageBox.Show("Ingrese el Nombre", "Informacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (this.Accion == "N")
                GrabarNuevo();

            if (this.Accion == "M")
                GrabarModificar();
        }
        private void BtnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
