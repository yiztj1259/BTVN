using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BTVN_T3.TangDuLieu;

namespace BTVN_T3.TangVanHanh
{
    public class BLL_DonViTinh
    {
        CoSoDuLieu duLieu;

        public BLL_DonViTinh()
        {
            duLieu = new CoSoDuLieu();
        }

        public SqlDataReader LayDanhSachDonViTinh(ref String loi, int maDVT)
        {
            return duLieu.DocDuLieuSqlDataReader(ref loi, "DBH_DonViTinh_Select", System.Data.CommandType.StoredProcedure, new SqlParameter("@MaDVT", maDVT));
        }
    }
}
