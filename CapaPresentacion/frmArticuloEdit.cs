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
    public partial class frmArticuloEdit : Form, IContract  // IContract (1 de 3)
    {
        private int _idarticulo;
        private string _accion;

        public void Ejecutar(string texto1, string texto2)  // IContract (2 de 3)
        {
            // IContract (3 de 3)
            this.txtIdCategoria.Text = texto1;
            this.txtCategoria.Text = texto2;
        }           

        public int Idarticulo { get => _idarticulo; set => _idarticulo = value; }
        public string Accion { get => _accion; set => _accion = value; }        

        public void setArticulo(int codigo, string nom, string des, System.IO.MemoryStream imagen, int idcategoria, string categoria, int idpresentacion, string presentacion)
        {
            txtId.Text = Convert.ToString(this.Idarticulo);
            txtCodigo.Text = Convert.ToString(codigo);
            txtNombre.Text = nom;
            txtDescripcion.Text = des;

            txtIdCategoria.Text = Convert.ToString(idcategoria);
            txtCategoria.Text = categoria;

            cbIdPresentacion.SelectedValue = idpresentacion;            

            this.pxImagen.Image = Image.FromStream(imagen);
            this.pxImagen.SizeMode = PictureBoxSizeMode.StretchImage;            
        }
        public void CargaDatos()
        {
            if (this.Accion == "V")
            {
                txtCodigo.Enabled = false;                
                txtNombre.Enabled = false;
                txtDescripcion.Enabled = false;

                txtCategoria.Enabled = false;
                btnBuscarCategoria.Enabled = false;

                cbIdPresentacion.Enabled = false;

                btnAgregarImagen.Enabled = false;
                btnQuitarImagen.Enabled = false;

                btnGuardar.Enabled = false;
            }            
        }

        private void MensajeError(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        private void MensajeOk(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        private void LlenarComboPresentacion()
        {
            cbIdPresentacion.DataSource = NPresentacion.Mostrar();
            cbIdPresentacion.ValueMember = "idpresentacion";
            cbIdPresentacion.DisplayMember = "nombre";
        }
        public frmArticuloEdit()
        {
            InitializeComponent();
            LlenarComboPresentacion();            
        }

        private void FrmArticuloEdit_Load(object sender, EventArgs e)
        {
            this.ttMensaje.SetToolTip(this.txtNombre, "Ingrese el nombre del articulo");
            this.ttMensaje.SetToolTip(this.pxImagen, "Seleccione la imagen del articulo");
            this.ttMensaje.SetToolTip(this.txtCategoria, "Seleccione la categoria del articulo");
            this.ttMensaje.SetToolTip(this.cbIdPresentacion, "Ingrese la presentacion del articulo");
            CargaDatos();
        }

        private void BtnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        public void GrabarNuevo()
        {
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            this.pxImagen.Image.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            byte[] imagen = ms.GetBuffer();

            string rpta = "";

            try
            {
                rpta = NArticulo.Insertar(this.txtCodigo.Text,
                           this.txtNombre.Text.Trim().ToUpper(),
                           this.txtDescripcion.Text.Trim(),
                           imagen, Convert.ToInt32(this.txtIdCategoria.Text),
                           Convert.ToInt32(cbIdPresentacion.SelectedValue));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
            if (rpta.Equals("Ok"))
            {
                this.MensajeOk("Se Inserto de forma correcta el registro");
                this.Close();
            }
            else
            {
                this.MensajeError(rpta);                
            }
        }
         public void GrabarModificar()
        {
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            this.pxImagen.Image.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            byte[] imagen = ms.GetBuffer();

            string rpta = "";

            try
            {
                rpta = NArticulo.Editar(Convert.ToInt32(this.txtId.Text),
                            this.txtCodigo.Text,
                            this.txtNombre.Text.Trim().ToUpper(),
                            this.txtDescripcion.Text.Trim(),
                            imagen, Convert.ToInt32(this.txtIdCategoria.Text),
                            Convert.ToInt32(cbIdPresentacion.SelectedValue));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }

            if (rpta.Equals("Ok"))
            {
                this.MensajeOk("Se Actualizo de forma correcta el registro");
                this.Close();
            }
            else
            {
                this.MensajeError(rpta);                
            }
        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (this.txtNombre.Text == string.Empty || this.txtIdCategoria.Text == string.Empty || this.txtCodigo.Text == string.Empty)
            {
                MensajeError("Falta ingresar algunos datos, seran remarcados");
                errorIcono.SetError(txtNombre, "Ingrese un valor");
                errorIcono.SetError(txtCodigo, "Ingrese un valor");
                errorIcono.SetError(txtCategoria, "Ingrese un valor");
                return;
            }

            if (this.Accion == "N")
            {
                GrabarNuevo();
            }
                

            if (this.Accion == "M")
            {
                GrabarModificar();
            }
        }

        private void BtnAgregarImagen_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialogo = new OpenFileDialog();
            DialogResult resultado = dialogo.ShowDialog();

            if (resultado == DialogResult.OK)
            {
                this.pxImagen.SizeMode = PictureBoxSizeMode.StretchImage;
                this.pxImagen.Image = Image.FromFile(dialogo.FileName);
            }
        }

        private void BtnQuitarImagen_Click(object sender, EventArgs e)
        {
            this.pxImagen.SizeMode = PictureBoxSizeMode.StretchImage;
            this.pxImagen.Image = global::CapaPresentacion.Properties.Resources.attach;
        }

        private void BtnBuscarCategoria_Click(object sender, EventArgs e)
        {
            frmVistaCategoria_Articulo form = new frmVistaCategoria_Articulo();
            form.contrato = this;
            form.ShowDialog();
        }
    }
}
