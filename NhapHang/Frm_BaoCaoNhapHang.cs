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
using Microsoft.Reporting.WinForms;

namespace BTVN_T3.NhapHang
{
    public partial class Frm_BaoCaoNhapHang : Form
    {
        BLL_PhieuNhap bllPN;
        DataTable dtBaoCao;
        String loi = String.Empty;
        public DateTime ngayBatDau;
        public DateTime ngayKetThuc;

        public Frm_BaoCaoNhapHang()
        {
            InitializeComponent();
        }

        private void Frm_BaoCaoNhapHang_Load(object sender, EventArgs e)
        {
            bllPN = new BLL_PhieuNhap();

            dtBaoCao = new DataTable();
            dtBaoCao = bllPN.LayDuLieuChiTietPhieuNhapTheoNgay(ref loi, ngayBatDau, ngayKetThuc);

            rpvBaoCaoNhapHang.Reset();
            rpvBaoCaoNhapHang.LocalReport.ReportEmbeddedResource = "BTVN_T3.BaoCaoChiTietNhapHang.rdlc";
            rpvBaoCaoNhapHang.LocalReport.DataSources.Clear();

            ReportDataSource reportDataSource = new ReportDataSource("BoDuLieu", dtBaoCao);
            rpvBaoCaoNhapHang.LocalReport.DataSources.Add(reportDataSource);

            ReportParameter[] parameters = new ReportParameter[2];
            parameters[0] = new ReportParameter("ngayBatDau", ngayBatDau.ToShortDateString(), true);
            parameters[1] = new ReportParameter("ngayKetThuc", ngayKetThuc.ToShortDateString(), true);
            rpvBaoCaoNhapHang.LocalReport.SetParameters(parameters);

            this.rpvBaoCaoNhapHang.RefreshReport();
        }

        private void rpvBaoCaoNhapHang_Load(object sender, EventArgs e)
        {
            
        }
    }
}
