using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BTVN_T3.TangDuLieu;

namespace BTVN_T3.TangVanHanh
{
    public class BLL_PhieuNhap
    {
        CoSoDuLieu duLieu;

        public BLL_PhieuNhap()
        {
            duLieu = new CoSoDuLieu();
        }

        public String LayPhieuNhapChuaHoanThanh(ref String loi, string maNhanVien)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaNhanVien", maNhanVien),
            };

            return duLieu.DocDuLieuDoiTuong(ref loi, "YSP_PhieuNhap_KiemTraPhieuTonTaiTheoUser", System.Data.CommandType.StoredProcedure, thamSoSQL).ToString();
        }

        public DataTable LayDanhSachSanPhamTheoPhieuNhap(ref String loi, String maPhieuNhap)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaPhieuNhap", maPhieuNhap),
            };

            return duLieu.DocDuLieuDataTable(ref loi, "YSP_PhieuNhap_NapThongTinPhieuNhapCu", CommandType.StoredProcedure, thamSoSQL);
        }

        public String SinhMaPhieuMoi(ref String loi)
        {
            return duLieu.DocDuLieuDoiTuong(ref loi, "YSP_PhieuNhap_TaoPhieuMoi", CommandType.StoredProcedure, null).ToString();
        }

        public int ThemPhieuNhapMoi(ref String loi, String maPhieuNhap, DateTime ngayNhap, String maNhanVien)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaPhieuNhap", maPhieuNhap),
                new SqlParameter("@NgayNhap", ngayNhap),
                new SqlParameter("@MaNhanVien", maNhanVien),
            };

            return duLieu.ThucThiThuTuc(ref loi, "YSP_PhieuNhap_Insert202303", CommandType.StoredProcedure, thamSoSQL);
        }
    }
}
