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
    public partial class frmCliente : Form
    {
        private bool isNuevo = false;
        private bool isEditar = false;
        public frmCliente()
        {
            InitializeComponent();
            this.ttMensaje.SetToolTip(this.txtNombre, "Ingrese el nombre del cliente");
            this.ttMensaje.SetToolTip(this.txtApellidos, "Ingrese los apellidos del cliente");
            this.ttMensaje.SetToolTip(this.txtNum_Documento, "Ingrese el Nº documento del cliente");
            this.ttMensaje.SetToolTip(this.txtDireccion, "Ingrese la dirección del cliente");
        }
        // Mostrar mensaje de confirmacion
        private void MensajeOk(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // Mostrar mensaje de error
        private void MensajeError(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        // Limpiar todos los controles del formulario
        private void Limpiar()
        {
            this.txtIdcliente.Text = string.Empty;
            this.txtNombre.Text = string.Empty;
            this.txtApellidos.Text = string.Empty;
            this.txtDireccion.Text = string.Empty;
            this.txtNum_Documento.Text = string.Empty;
            this.txtTelefono.Text = string.Empty;            
            this.txtEmail.Text = string.Empty;            
        }

        // Habilitar los controles del formularios
        private void Habilitar(bool valor)
        {
            this.txtIdcliente.ReadOnly = !valor;
            this.txtNombre.ReadOnly = !valor;
            this.txtApellidos.ReadOnly = !valor;
            this.txtDireccion.ReadOnly = !valor;            
            this.cbTipo_Documento.Enabled = valor;
            this.txtNum_Documento.ReadOnly = !valor;
            this.txtTelefono.ReadOnly = !valor;            
            this.txtEmail.ReadOnly = !valor;            
        }

        // Habilitar Botones
        private void Botones()
        {
            if (this.isNuevo || this.isEditar)       // Alt + 124
            {
                this.Habilitar(true);
                this.btnNuevo.Enabled = false;
                this.btnGuardar.Enabled = true;
                this.btnEditar.Enabled = false;
                this.btnCancelar.Enabled = true;
            }
            else
            {
                this.Habilitar(false);
                this.btnNuevo.Enabled = true;
                this.btnGuardar.Enabled = false;
                this.btnEditar.Enabled = true;
                this.btnCancelar.Enabled = false;
            }
        }

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

        private void frmCliente_Load(object sender, EventArgs e)
        {
            this.Mostrar();
            this.Habilitar(false);
            this.Botones();
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

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult opcion;
                opcion = MessageBox.Show("¿Realmente desea eliminar los registros seleccionados.?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (opcion == DialogResult.Yes)
                {
                    string codigo = "", rpta = "";
                    foreach (DataGridViewRow row in dataListado.Rows)
                    {
                        if (Convert.ToBoolean(row.Cells[0].Value))
                        {
                            codigo = Convert.ToString(row.Cells[1].Value);
                            rpta = NCliente.Eliminar(Convert.ToInt32(codigo));

                            if (rpta.Equals("Ok"))
                            {
                                this.MensajeOk("Se elimino satisfactoriamente el registro");
                            }
                            else
                            {
                                this.MensajeError(rpta);
                            }
                        }
                    }
                    Mostrar();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + " - " + ex.StackTrace);
            }
        }

        private void chkEliminar_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEliminar.Checked)
            {
                this.dataListado.Columns[0].Visible = true;
            }
            else
            {
                this.dataListado.Columns[0].Visible = false;
            }
        }

        private void dataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dataListado.Columns["eliminar"].Index)
            {
                DataGridViewCheckBoxCell ChkEliminar = (DataGridViewCheckBoxCell)dataListado.Rows[e.RowIndex].Cells["Eliminar"];
                ChkEliminar.Value = !Convert.ToBoolean(ChkEliminar.Value);
            }
        }

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            this.txtIdcliente.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["idcliente"].Value);
            this.txtNombre.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["nombre"].Value);
            this.txtApellidos.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["apellidos"].Value);
            this.cbSexo.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["sexo"].Value);
            this.dtFecha_Nacimiento.Value = Convert.ToDateTime(this.dataListado.CurrentRow.Cells["fecha_nacimiento"].Value);
            this.cbTipo_Documento.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["tipo_documento"].Value);
            this.txtNum_Documento.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["num_documento"].Value);
            this.txtDireccion.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["direccion"].Value);
            this.txtTelefono.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["telefono"].Value);
            this.txtEmail.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["email"].Value);
            
            this.tabControl1.SelectedIndex = 1;
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            this.isNuevo = true;
            this.isEditar = false;
            this.Botones();
            this.Limpiar();
            this.Habilitar(true);
            this.txtNombre.Focus();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string rpta = "";
                if (this.txtNombre.Text == string.Empty || this.txtApellidos.Text == string.Empty || this.txtNum_Documento.Text == string.Empty || this.txtDireccion.Text == string.Empty)
                {
                    MensajeError("Falta ingresar algunos datos, seran remarcados");
                    errorIcono.SetError(txtNombre, "Ingrese el nombre");
                    errorIcono.SetError(txtApellidos, "Ingrese los apellidos");
                    errorIcono.SetError(txtDireccion, "Ingrese la razón social");
                    errorIcono.SetError(txtNum_Documento, "Ingrese la razón social");
                }
                else
                {
                    if (this.isNuevo)
                    {
                        rpta = NCliente.Insertar(this.txtNombre.Text.Trim().ToUpper(),
                            this.txtApellidos.Text.Trim().ToUpper(),
                            this.cbSexo.Text.Trim(),
                            dtFecha_Nacimiento.Value,
                            this.cbTipo_Documento.Text.Trim(),
                            this.txtNum_Documento.Text.Trim(),
                            this.txtDireccion.Text.Trim(),
                            this.txtTelefono.Text.Trim(),
                            this.txtEmail.Text.Trim());
                    }
                    else
                    {
                        rpta = NCliente.Editar(Convert.ToInt32(this.txtIdcliente.Text),
                            this.txtNombre.Text.Trim().ToUpper(),
                            this.txtApellidos.Text.Trim().ToUpper(),
                            this.cbSexo.Text.Trim(),
                            dtFecha_Nacimiento.Value,
                            this.cbTipo_Documento.Text.Trim(),
                            this.txtNum_Documento.Text.Trim(),
                            this.txtDireccion.Text.Trim(),
                            this.txtTelefono.Text.Trim(),
                            this.txtEmail.Text.Trim());
                    }
                    if (rpta.Equals("Ok"))
                    {
                        if (this.isNuevo)
                        {
                            this.MensajeOk("Se Inserto de forma correcta el registro");
                        }
                        else
                        {
                            this.MensajeOk("Se Actualizo de forma correcta el registro");
                        }
                    }
                    else
                    {
                        this.MensajeError(rpta);
                    }
                    this.isNuevo = false;
                    this.isEditar = false;
                    this.Botones();
                    this.Limpiar();
                    this.Mostrar();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (!this.txtIdcliente.Text.Equals(""))
            {
                this.isEditar = true;
                this.Botones();
                this.Habilitar(true);
            }
            else
            {
                this.MensajeError("Debe seleccionar primero el registro a modificar");
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.isNuevo = false;
            this.isEditar = false;
            this.Botones();
            this.Limpiar();
            this.Habilitar(false);
            this.txtIdcliente.Text = string.Empty;
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
