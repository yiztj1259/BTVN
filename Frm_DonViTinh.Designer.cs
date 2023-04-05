namespace BTVN_T3
{
    partial class Frm_DonViTinh
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
            this.label1 = new System.Windows.Forms.Label();
            this.txtNhapMaDVT = new System.Windows.Forms.TextBox();
            this.btnLayDuLieuDVT = new System.Windows.Forms.Button();
            this.lsDanhSachDonViTinh = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(19, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(101, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Nhập mã ĐVT:";
            // 
            // txtNhapMaDVT
            // 
            this.txtNhapMaDVT.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.txtNhapMaDVT.Location = new System.Drawing.Point(20, 39);
            this.txtNhapMaDVT.Name = "txtNhapMaDVT";
            this.txtNhapMaDVT.Size = new System.Drawing.Size(183, 23);
            this.txtNhapMaDVT.TabIndex = 1;
            // 
            // btnLayDuLieuDVT
            // 
            this.btnLayDuLieuDVT.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnLayDuLieuDVT.Location = new System.Drawing.Point(209, 35);
            this.btnLayDuLieuDVT.Name = "btnLayDuLieuDVT";
            this.btnLayDuLieuDVT.Size = new System.Drawing.Size(104, 30);
            this.btnLayDuLieuDVT.TabIndex = 2;
            this.btnLayDuLieuDVT.Text = "Lấy dữ liệu";
            this.btnLayDuLieuDVT.UseVisualStyleBackColor = true;
            this.btnLayDuLieuDVT.Click += new System.EventHandler(this.btnLayDuLieuDVT_Click);
            // 
            // lsDanhSachDonViTinh
            // 
            this.lsDanhSachDonViTinh.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lsDanhSachDonViTinh.FormattingEnabled = true;
            this.lsDanhSachDonViTinh.ItemHeight = 16;
            this.lsDanhSachDonViTinh.Location = new System.Drawing.Point(22, 77);
            this.lsDanhSachDonViTinh.Name = "lsDanhSachDonViTinh";
            this.lsDanhSachDonViTinh.Size = new System.Drawing.Size(291, 260);
            this.lsDanhSachDonViTinh.TabIndex = 3;
            // 
            // Frm_DonViTinh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(336, 357);
            this.Controls.Add(this.lsDanhSachDonViTinh);
            this.Controls.Add(this.btnLayDuLieuDVT);
            this.Controls.Add(this.txtNhapMaDVT);
            this.Controls.Add(this.label1);
            this.Name = "Frm_DonViTinh";
            this.Text = "Frm_DonViTinh";
            this.Load += new System.EventHandler(this.Frm_DonViTinh_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtNhapMaDVT;
        private System.Windows.Forms.Button btnLayDuLieuDVT;
        private System.Windows.Forms.ListBox lsDanhSachDonViTinh;
    }
}

