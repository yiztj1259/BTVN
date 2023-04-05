using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BTVN_T3.DTO
{
    public class SanPham
    {
        String maSP, tenSP;
        int soTon, maDVT;

        public String MaSP { get => maSP; set => maSP = value; }
        public String TenSP { get => tenSP; set => tenSP = value; }
        public int SoTon { get => soTon; set => soTon = value; }
        public int MaDVT { get => maDVT; set => maDVT = value; }
    }
}
