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
    public partial class frmCategoriaEdit : Form
    {
        private int _idcategoria;
        private string _accion;

        public int Idcategoria { get => _idcategoria; set => _idcategoria = value; }
        public string Accion { get => _accion; set => _accion = value; }

        public frmCategoriaEdit(int idcategoria = 0)
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

        private void BtnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void GroupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void FrmCategoriaEdit_Load(object sender, EventArgs e)
        {
            CargaDatos();
            // txtId.Text = Convert.ToString(this.Idcategoria);
        }

        public void setCategoria(string nombre, string descripcion)
        {
            txtId.Text = Convert.ToString(this.Idcategoria);
            txtNombre.Text = nombre;
            txtDescripcion.Text = descripcion;
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
        public void GrabarNuevo()
        {
            string rpta = "";
            try
            {
                rpta = NCategoria.Insertar(this.txtNombre.Text.Trim().ToUpper(), this.txtDescripcion.Text.Trim());
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
                rpta = NCategoria.Editar(Convert.ToInt32(this.txtId.Text),
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
    }
}
