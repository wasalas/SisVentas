namespace CapaPresentacion
{
    partial class frmReportePresentacion
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.dsPrincipal = new CapaPresentacion.dsPrincipal();
            this.spReporte_facturaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.spReporte_facturaTableAdapter = new CapaPresentacion.dsPrincipalTableAdapters.spReporte_facturaTableAdapter();
            this.spMostrar_presentacionBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.spMostrar_presentacionTableAdapter = new CapaPresentacion.dsPrincipalTableAdapters.spMostrar_presentacionTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.dsPrincipal)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spReporte_facturaBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrar_presentacionBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.spMostrar_presentacionBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "CapaPresentacion.Reportes.rptPresentacion.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(800, 450);
            this.reportViewer1.TabIndex = 0;
            // 
            // dsPrincipal
            // 
            this.dsPrincipal.DataSetName = "dsPrincipal";
            this.dsPrincipal.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // spReporte_facturaBindingSource
            // 
            this.spReporte_facturaBindingSource.DataMember = "spReporte_factura";
            this.spReporte_facturaBindingSource.DataSource = this.dsPrincipal;
            // 
            // spReporte_facturaTableAdapter
            // 
            this.spReporte_facturaTableAdapter.ClearBeforeFill = true;
            // 
            // spMostrar_presentacionBindingSource
            // 
            this.spMostrar_presentacionBindingSource.DataMember = "spMostrar_presentacion";
            this.spMostrar_presentacionBindingSource.DataSource = this.dsPrincipal;
            // 
            // spMostrar_presentacionTableAdapter
            // 
            this.spMostrar_presentacionTableAdapter.ClearBeforeFill = true;
            // 
            // frmReportePresentacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.reportViewer1);
            this.Name = "frmReportePresentacion";
            this.Text = "frmReportePresentacion";
            this.Load += new System.EventHandler(this.FrmReportePresentacion_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dsPrincipal)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spReporte_facturaBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrar_presentacionBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource spReporte_facturaBindingSource;
        private dsPrincipal dsPrincipal;
        private dsPrincipalTableAdapters.spReporte_facturaTableAdapter spReporte_facturaTableAdapter;
        private System.Windows.Forms.BindingSource spMostrar_presentacionBindingSource;
        private dsPrincipalTableAdapters.spMostrar_presentacionTableAdapter spMostrar_presentacionTableAdapter;
    }
}