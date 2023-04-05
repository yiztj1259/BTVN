using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BTVN_T3.DTO;
using BTVN_T3.TangDuLieu;

namespace BTVN_T3.TangVanHanh
{
    public class BLL_LoaiChucNang
    {
        CoSoDuLieu duLieu;

        public BLL_LoaiChucNang()
        { 
            duLieu = new CoSoDuLieu();
        }

        public DataTable LayDanhSachLoaiChucNang(ref String loi, int maNhomChucNang = 0)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaNhomChucNang", maNhomChucNang),
            };

            return duLieu.DocDuLieuDataTable(ref loi, "PSP_LoaiChucNang_Select", CommandType.StoredProcedure, thamSoSQL);
        }

        public int CapNhatLoaiChucNang(ref String loi, LoaiChucNang loaiChucNang)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaNhomChucNang", loaiChucNang.MaNhomChucNang),
                new SqlParameter("@TenNhomChucNang", loaiChucNang.TenNhomChucNang),
            };

            return duLieu.ThucThiThuTuc(ref loi, "PSP_LoaiChucNang_InsertAndUpdate", CommandType.StoredProcedure, thamSoSQL);
        }

        public int XoaLoaiChucNang(ref String loi, int maNhomChucNang)
        {
            SqlParameter[] thamSoSQL = new SqlParameter[]
            {
                new SqlParameter("@MaNhomChucNang", maNhomChucNang),
            };

            return duLieu.ThucThiThuTuc(ref loi, "PSP_LoaiChucNang_Delete", CommandType.StoredProcedure, thamSoSQL);
        }
    }
}
