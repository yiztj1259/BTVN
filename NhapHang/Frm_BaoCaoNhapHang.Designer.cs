namespace BTVN_T3.NhapHang
{
    partial class Frm_BaoCaoNhapHang
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
            this.rpvBaoCaoNhapHang = new Microsoft.Reporting.WinForms.ReportViewer();
            this.SuspendLayout();
            // 
            // rpvBaoCaoNhapHang
            // 
            this.rpvBaoCaoNhapHang.LocalReport.ReportEmbeddedResource = "BTVN_T3.BaoCaoChiTietNhapHang.rdlc";
            this.rpvBaoCaoNhapHang.Location = new System.Drawing.Point(12, 12);
            this.rpvBaoCaoNhapHang.Name = "rpvBaoCaoNhapHang";
            this.rpvBaoCaoNhapHang.ServerReport.BearerToken = null;
            this.rpvBaoCaoNhapHang.Size = new System.Drawing.Size(863, 376);
            this.rpvBaoCaoNhapHang.TabIndex = 0;
            // 
            // Frm_BaoCaoNhapHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(821, 400);
            this.Controls.Add(this.rpvBaoCaoNhapHang);
            this.Name = "Frm_BaoCaoNhapHang";
            this.Text = "Báo cáo Nhập hàng";
            this.Load += new System.EventHandler(this.Frm_BaoCaoNhapHang_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer rpvBaoCaoNhapHang;
    }
}