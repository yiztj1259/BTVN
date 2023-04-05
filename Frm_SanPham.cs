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
    public partial class Frm_SanPham : Form
    {
        public Frm_SanPham()
        {
            InitializeComponent();
        }

        BLL_SanPham bllSP;
        DataTable dataTable;
        SanPham sanPham;
        String loi = String.Empty;

        private void Frm_SanPham_Load(object sender, EventArgs e)
        {
            bllSP= new BLL_SanPham();
            HienThiDanhSachSanPham();
            HienThiComboBoxDonViTinh();
            HienThiComboBoxLoaiSanPham(); 
        }

        private void HienThiDanhSachSanPham(int maLSP = 0)
        {
            dataTable = new DataTable();
            dataTable = bllSP.LayDanhSachSanPhamTheoLSP(ref loi, maLSP);

            dgvDanhSachSanPham.DataSource = dataTable.DefaultView;
        }

        private void HienThiComboBoxDonViTinh()
        {
            DataTable dataTable = new DataTable();
            dataTable = bllSP.LayDanhSachDonViTinh(ref loi);

            cbxDonViTinh.DataSource = dataTable;
            cbxDonViTinh.DisplayMember = "TenDVT";
            cbxDonViTinh.ValueMember = "MaDVT";

            cbxDonViTinh.SelectedIndex = -1;
            cbxDonViTinh.Text = "---Chọn đơn vị tính---";
        }

        bool ktraNapCbxLoaiSanPham = false;
        private void HienThiComboBoxLoaiSanPham()
        {
            DataTable dataTable = new DataTable();
            dataTable = bllSP.LayDanhSachLoaiSanPham(ref loi);

            cbxLoaiSanPham.DataSource = dataTable;
            cbxLoaiSanPham.DisplayMember = "TenLSP";
            cbxLoaiSanPham.ValueMember = "MaLSP";

            cbxLoaiSanPham.SelectedIndex = -1;
            cbxLoaiSanPham.Text = "---Chọn loại sản phẩm---";

            ktraNapCbxLoaiSanPham = true;
        }


        private void cbxDonViTinh_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void cbxLoaiSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            int maLSP = 0;

            if (ktraNapCbxLoaiSanPham)
            {
                maLSP = Convert.ToInt32(cbxLoaiSanPham.SelectedValue);
            }

            HienThiDanhSachSanPham(maLSP);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            txtMaSP.Text = TaoMaSPTuDong();
            txtTenSP.Focus();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (CapNhatSanPham(txtMaSP.Text, txtTenSP.Text, txtSoTon.Text, cbxDonViTinh.SelectedValue.ToString()))
            {
                HienThiDanhSachSanPham();
            }       
        }

        private bool CapNhatSanPham(String maSP, String tenSP, String soTon, String maDVT)
        {
            SanPham sanPham = new SanPham()
            {
                MaSP = maSP,
                TenSP = tenSP,
                SoTon = Convert.ToInt32(soTon),
                MaDVT= Convert.ToInt32(maDVT),
            };

            if (bllSP.ThemSanPham(ref loi, sanPham) > 0)
            {
                return true;
            }
            return false;
        }

        private String TaoMaSPTuDong()
        {
            string maSP = string.Empty;
            int maxID = Convert.ToInt32(bllSP.LayMaxIDSanPham(ref loi).ToString().Substring(2));
            maSP = string.Format("SP{0:0000000}", maxID + 1);

            return maSP;
        }

        private void dgvDanhSachSanPham_Click(object sender, EventArgs e)
        {
            if (dgvDanhSachSanPham.Rows.Count > 0)
            {
                sanPham = new SanPham()
                {
                    MaSP = dgvDanhSachSanPham.CurrentRow.Cells["colMaSP"].Value.ToString(),
                    TenSP = dgvDanhSachSanPham.CurrentRow.Cells["colTenSP"].Value.ToString(),
                    SoTon = Convert.ToInt32(dgvDanhSachSanPham.CurrentRow.Cells["colSoTon"].Value.ToString()),
                    MaDVT = Convert.ToInt32(dgvDanhSachSanPham.CurrentRow.Cells["colMaDVT"].Value.ToString()),
                };
            }

            HienThongTinSanPhamDangXuLy();
        }

        private void HienThongTinSanPhamDangXuLy()
        {
            txtMaSP.Text = sanPham.MaSP;
            txtTenSP.Text = sanPham.TenSP;
            txtSoTon.Text = sanPham.SoTon.ToString();
            cbxDonViTinh.SelectedValue = sanPham.MaDVT;
        }
    }
}
