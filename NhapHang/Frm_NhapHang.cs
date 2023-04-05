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

namespace BTVN_T3.NhapHang
{
    public partial class Frm_NhapHang : Form
    {
        String maPhieuNhap = String.Empty;
        BLL_PhieuNhap bllPN;
        String loi = String.Empty;
        DataTable dtChiTieuPhieuNhap;

        public Frm_NhapHang()
        {
            InitializeComponent();
        }

        private void Frm_NhapHang_Load(object sender, EventArgs e)
        {
            bllPN = new BLL_PhieuNhap();

            if (KiemTraPhieuNhapTonTaiTheoUser(BienToanCuc.maNhanVien))
            {
                NapThongTinTheoPhieuNhapCu(maPhieuNhap);
            }
            else
            {
                txtMaPhieuNhap.Text = TaoPhieuMoi();
                txtNhanVienNhap.Text = BienToanCuc.maNhanVien;

                if (bllPN.ThemPhieuNhapMoi(ref loi, txtMaPhieuNhap.Text, dtpNgayNhap.Value, txtNhanVienNhap.Text) == 0)
                {
                    MessageBox.Show("Gà");
                }
            }
        }

        private void NapThongTinTheoPhieuNhapCu(String maPhieuNhap)
        {
            dtChiTieuPhieuNhap = new DataTable();
            dtChiTieuPhieuNhap = bllPN.LayDanhSachSanPhamTheoPhieuNhap(ref loi, maPhieuNhap);
            dgvDSSanPhamNhap.DataSource = dtChiTieuPhieuNhap.DefaultView;

            if (dtChiTieuPhieuNhap.Rows.Count > 0)
            {
                txtMaPhieuNhap.Text = dtChiTieuPhieuNhap.Rows[0]["MaPhieuNhap"].ToString();
                txtNhanVienNhap.Text = dtChiTieuPhieuNhap.Rows[0]["MaNhanVien"].ToString();
                dtpNgayNhap.Value = Convert.ToDateTime(dtChiTieuPhieuNhap.Rows[0]["NgayNhap"].ToString());
            }
            else
            {
                txtMaPhieuNhap.Text = maPhieuNhap;
                txtNhanVienNhap.Text = BienToanCuc.maNhanVien;
            }
            
        }

        private String TaoPhieuMoi()
        {
            return bllPN.SinhMaPhieuMoi(ref loi);
        }

        private bool KiemTraPhieuNhapTonTaiTheoUser(string maNhanVien)
        {
            bool ketQua = false;

            maPhieuNhap = bllPN.LayPhieuNhapChuaHoanThanh(ref loi, maNhanVien);
            if (maPhieuNhap.ToLower().Equals('0'))
            {
                ketQua = false;
            }
            else
            {
                ketQua = true;
            }

            return ketQua;
        }
    }
}
