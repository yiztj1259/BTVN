using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BTVN_T3.TangDuLieu;
using BTVN_T3.DTO;

namespace BTVN_T3.TangVanHanh
{
    public class BLL_SanPham
    {
        CoSoDuLieu duLieu;

        public BLL_SanPham()
        {
            duLieu = new CoSoDuLieu();
        }

        public SqlDataReader LayDanhSachSanPham(ref String loi, String maSP)
        {
            return duLieu.DocDuLieuSqlDataReader(ref loi, "PSP_SanPham_Select230225", System.Data.CommandType.StoredProcedure, new SqlParameter("@MaSP", maSP));
        }

        public object LayMaxIDSanPham(ref String loi)
        {
            return duLieu.DocDuLieuDoiTuong(ref loi, "PSP_SanPham_MaxID", System.Data.CommandType.StoredProcedure, null);
        }

        public DataTable LayDanhSachSanPhamIDTuyChon(ref String loi, String maSP)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaSP", maSP),
            };

            return duLieu.DocDuLieuDataTable(ref loi, "PSP_SanPham_Select230204", CommandType.StoredProcedure, thamSoSQL);
        }

        public DataTable LayDanhSachDonViTinh(ref String loi)
        {
            return duLieu.DocDuLieuDataTable(ref loi, "PSP_DonViTinh_SelectCbo", CommandType.StoredProcedure, null);
        }

        public DataTable LayDanhSachLoaiSanPham(ref String loi)
        {
            return duLieu.DocDuLieuDataTable(ref loi, "PSP_LoaiSanPham_SelectCbo", CommandType.StoredProcedure, null);
        }

        public DataTable LayDanhSachSanPhamTheoDVT(ref String loi, int maDVT)
        {
            return duLieu.DocDuLieuDataTable(ref loi, "PSP_SanPham_SelectMaDVT", CommandType.StoredProcedure, new SqlParameter("@MaDVT", maDVT));
        }

        public DataTable LayDanhSachSanPhamTheoLSP(ref String loi, int maLSP)
        {
            return duLieu.DocDuLieuDataTable(ref loi, "PSP_SanPham_SelectMaLSP", CommandType.StoredProcedure, new SqlParameter("@MaLSP", maLSP));
        }

        public int ThemSanPham(ref String loi, SanPham sanPham)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaSP", sanPham.MaSP),
                new SqlParameter("@TenSP", sanPham.TenSP),
                new SqlParameter("@SoTon", sanPham.SoTon),
                new SqlParameter("@MaDVT", sanPham.MaDVT),
            };
            return duLieu.ThucThiThuTuc(ref loi, "PSP_SanPham_InsertAndUpdate230304", CommandType.StoredProcedure, thamSoSQL);
        }
    }
}
