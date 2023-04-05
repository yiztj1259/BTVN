using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BTVN_T3.DTO
{
    public class LoaiChucNang
    {
        int maNhomChucNang;
        String tenNhomChucNang;

        public int MaNhomChucNang { get => maNhomChucNang; set => maNhomChucNang = value; }
        public string TenNhomChucNang { get => tenNhomChucNang; set => tenNhomChucNang = value; }
    }
}
