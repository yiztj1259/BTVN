using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BTVN_T3.TangDuLieu;

namespace BTVN_T3.TangVanHanh
{
    public class BLL_KetNoi
    {
        CoSoDuLieu duLieu;

        public BLL_KetNoi()
        {
            duLieu= new CoSoDuLieu();
        }

        public bool KiemTraKetNoi(ref string loi)
        {
            return duLieu.KiemTraKetNoi(ref loi);
        }

        public void GhiChuoiKetNoi(String duongDan, String mayChu, String coSoDuLieu, String maNgDung, String matKhau, bool xacThucWindows)
        {
            duLieu.GhiChuoiKetNoi(duongDan, mayChu, coSoDuLieu, maNgDung, matKhau, xacThucWindows);
        }
    }
}
