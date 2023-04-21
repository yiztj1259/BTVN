using BTVN_T3.TangVanHanh;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BTVN_T3.NhapHang
{
    public partial class Frm_ChiTietNhapHang : Form
    {
        BLL_PhieuNhap bllPN;
        DataTable dtCTPN;
        String loi = String.Empty;
        int tongThanhTien = 0;

        public Frm_ChiTietNhapHang()
        {
            InitializeComponent();
        }

        private void Frm_ChiTietNhapHang_Load(object sender, EventArgs e)
        {
            bllPN = new BLL_PhieuNhap();
        }

        private void btnThongKe_Click(object sender, EventArgs e)
        {
            HienThiChiTietNhapHang(dtpNgayBatDau.Value, dtpNgayKetThuc.Value);
        }

        private void HienThiChiTietNhapHang(DateTime ngayBatDau, DateTime ngayKetThuc)
        {
            dtCTPN = new DataTable();
            dtCTPN = bllPN.LayDuLieuChiTietPhieuNhapTheoNgay(ref loi, ngayBatDau, ngayKetThuc);

            dgvChiTietNhapHang.DataSource = dtCTPN.DefaultView;

            for (int i = 0; i < dtCTPN.Columns.Count; i++)
            {
                cbxCot.Items.Add(dtCTPN.Columns[i].ColumnName.ToString());
            }

            TinhTongThanhTien(dtCTPN.DefaultView);
        }

        private void TinhTongThanhTien(DataView dataView)
        {
            tongThanhTien = 0;

            foreach (DataRowView item in dataView)
            {
                tongThanhTien += Convert.ToInt32(item["ThanhTien"].ToString());
            }

            lblTongThanhTien.Text = String.Format("{0:#,####0}", tongThanhTien);
        }

        private void txtLoc_TextChanged(object sender, EventArgs e)
        {
            DataView dataView = dtCTPN.DefaultView;
            if (cbxCot.SelectedIndex > -1)
            {
                try
                {
                    if (!String.IsNullOrEmpty(txtLoc.Text))
                    {
                        dataView.RowFilter = String.Format("{0} like '{1}%'", cbxCot.Text, txtLoc.Text);
                    }
                    else
                    {
                        dataView.RowFilter = String.Empty;
                    }
                }
                catch (Exception)
                {

                    if (!String.IsNullOrEmpty(txtLoc.Text))
                    {
                        dataView.RowFilter = String.Format("{0} = {1}", cbxCot.Text, txtLoc.Text);
                    }
                    else
                    {
                        dataView.RowFilter = String.Empty;
                    }
                }
            }
            dgvChiTietNhapHang.DataSource = dataView;
            TinhTongThanhTien(dataView);
        }

        private void btnSapXep_Click(object sender, EventArgs e)
        {
            if (btnSapXep.Text.Equals("ASC"))
            {
                btnSapXep.Text = "DESC";
            }
            else
            {
                btnSapXep.Text = "ASC";
            }

            DataView dataView = dtCTPN.DefaultView;

            if (cbxCot.SelectedIndex > -1)
            {
                dataView.Sort = String.Format("{0} {1}", cbxCot.Text, btnSapXep.Text);
            }

            dgvChiTietNhapHang.DataSource = dataView;
        }

        private void btnBaoCao_Click(object sender, EventArgs e)
        {
            Frm_BaoCaoNhapHang frm_BaoCao = new Frm_BaoCaoNhapHang();
            frm_BaoCao.ngayBatDau = dtpNgayBatDau.Value;
            frm_BaoCao.ngayKetThuc = dtpNgayKetThuc.Value;
            frm_BaoCao.ShowDialog();
        }
    }
}
