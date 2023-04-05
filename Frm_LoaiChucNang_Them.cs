using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BTVN_T3.DTO;
using BTVN_T3.TangVanHanh;

namespace BTVN_T3
{
    public partial class Frm_LoaiChucNang_Them : Form
    {
        public Frm_LoaiChucNang_Them()
        {
            InitializeComponent();
        }

        BLL_LoaiChucNang bllLCN;
        String loi = String.Empty;
        public bool ktraThem = true;
        public LoaiChucNang loaiChucNang;

        private void Frm_LoaiChucNang_Them_Load(object sender, EventArgs e)
        {
            bllLCN = new BLL_LoaiChucNang();
            if (ktraThem)
            {
                txtTenNhomChucNang.Text = String.Empty;
                this.Text = "Thêm";
                btnThem.Text = "Thêm";
;           }
            else
            {
                txtTenNhomChucNang.Text = loaiChucNang.TenNhomChucNang;
                this.Text = "Sửa";
                btnThem.Text = "Sửa";
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            loaiChucNang.TenNhomChucNang = txtTenNhomChucNang.Text;

            if (bllLCN.CapNhatLoaiChucNang(ref loi, loaiChucNang) > 0)
            {
                if (ktraThem)
                {
                    MessageBox.Show("Thêm loại chức năng thành công");
                }
                else
                {
                    MessageBox.Show("Sửa loại chức năng thành công");
                }
                this.Close();
            }
            else
            {
                MessageBox.Show(loi);
            }
        }
    }
}
