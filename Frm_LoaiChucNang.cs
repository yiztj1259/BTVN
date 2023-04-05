using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BTVN_T3.TangVanHanh;
using BTVN_T3.DTO;

namespace BTVN_T3
{
    public partial class Frm_LoaiChucNang : Form
    {
        public Frm_LoaiChucNang()
        {
            InitializeComponent();
        }

        BLL_LoaiChucNang bllLCN;
        DataTable dataTable;
        public LoaiChucNang loaiChucNang;
        String loi = String.Empty;

        private void Frm_LoaiChucNang_Load(object sender, EventArgs e)
        {
            bllLCN = new BLL_LoaiChucNang();
            loaiChucNang = new LoaiChucNang();
            HienThiDanhSachLoaiChucNang();
        }

        private void HienThiDanhSachLoaiChucNang()
        {
            dataTable = new DataTable();
            dataTable = bllLCN.LayDanhSachLoaiChucNang(ref loi);

            dgvNhomChucNang.DataSource = dataTable.DefaultView;
            GanGiaTriLoaiChucNang();
        }

        private void btnNapLai_Click(object sender, EventArgs e)
        {
            HienThiDanhSachLoaiChucNang();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            Frm_LoaiChucNang_Them frm_LoaiChucNang_Them = new Frm_LoaiChucNang_Them();
            frm_LoaiChucNang_Them.ktraThem = true;
            frm_LoaiChucNang_Them.loaiChucNang = new LoaiChucNang();
            frm_LoaiChucNang_Them.ShowDialog();
            HienThiDanhSachLoaiChucNang();
        }

        private void GanGiaTriLoaiChucNang()
        {
            if (dgvNhomChucNang.Rows.Count > 0)
            {
                loaiChucNang.MaNhomChucNang = Convert.ToInt32(dgvNhomChucNang.CurrentRow.Cells["colMaNhomChucNang"].Value.ToString());
                loaiChucNang.TenNhomChucNang = dgvNhomChucNang.CurrentRow.Cells["colTenNhomChucNang"].Value.ToString();
            }
        }

        private void dgvNhomChucNang_Click(object sender, EventArgs e)
        {
            GanGiaTriLoaiChucNang();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            Frm_LoaiChucNang_Them frm_LoaiChucNang_Them = new Frm_LoaiChucNang_Them();
            frm_LoaiChucNang_Them.ktraThem = false;
            frm_LoaiChucNang_Them.loaiChucNang = loaiChucNang;
            frm_LoaiChucNang_Them.ShowDialog();
            HienThiDanhSachLoaiChucNang();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (bllLCN.XoaLoaiChucNang(ref loi, loaiChucNang.MaNhomChucNang) > 0)
            {
                MessageBox.Show("Xóa loại chức năng thành công!");
                HienThiDanhSachLoaiChucNang();
            }
            else
            {
                MessageBox.Show(loi);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
