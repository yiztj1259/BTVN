using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BTVN_T3.TangDuLieu
{
    public class KetNoi
    {
        #region Trường
        private String mayChu;
        String coSoDuLieu;
        String maNgDung;
        String matKhau;
        bool xacThucWindows;
        #endregion

        #region Get Set
        public String MayChu { get => mayChu; set => mayChu = value; }
        public String CoSoDuLieu { get => coSoDuLieu; set => coSoDuLieu = value; }
        public String MaNgDung { get => maNgDung; set => maNgDung = value; }
        public String MatKhau { get => matKhau; set => matKhau = value; }
        public bool XacThucWindows { get => xacThucWindows; set => xacThucWindows = value; }
        #endregion

        #region Khởi tạo
        public KetNoi() { }

        public KetNoi(String mayChu, String coSoDuLieu, String maNgDung, String matKhau, bool xacThucWindows)
        {
            this.mayChu = mayChu;
            this.coSoDuLieu = coSoDuLieu;
            this.maNgDung = maNgDung;
            this.matKhau = matKhau;
            this.xacThucWindows = xacThucWindows;
        }
        #endregion

        #region Phương thức
        public String DocChuoiKetNoiTuTep(String duongDan)
        {
            using (FileStream fileStream = new FileStream(duongDan, FileMode.Open, FileAccess.Read, FileShare.Read))
            {
                using (StreamReader streamReader = new StreamReader(fileStream))
                {
                    String dong = streamReader.ReadLine();

                    if (!String.IsNullOrEmpty(dong))
                    {
                        String[] mangChuoi = dong.Split(';');
                        this.mayChu = mangChuoi[0].Substring(mangChuoi[0].IndexOf('=') + 1);
                        this.coSoDuLieu = mangChuoi[1].Substring(mangChuoi[1].IndexOf('=') + 1);
                        this.maNgDung = mangChuoi[2].Substring(mangChuoi[2].IndexOf('=') + 1);
                        this.matKhau = mangChuoi[3].Substring(mangChuoi[3].IndexOf('=') + 1);
                        this.xacThucWindows = Convert.ToBoolean(mangChuoi[4].Substring(mangChuoi[4].IndexOf('=') + 1));
                    }

                }
            }

            return LayChuoiKetNoi();
        }

        public void GhiChuoiKetNoiVaoTep(String duongDan, String mayChu, String coSoDuLieu, String maNgDung, String matKhau, bool xacThucWindows)
        {
            using (FileStream fileStream = new FileStream(duongDan, FileMode.OpenOrCreate, FileAccess.Write, FileShare.Write))
            {
                using (StreamWriter streamWriter = new StreamWriter(fileStream))
                {
                    String chuoiGhi = String.Format("Server = {0}; Database = {1}; UID = {2}; PWD = {3}; WinNT = {4};", mayChu, coSoDuLieu, maNgDung, matKhau, xacThucWindows.ToString());
                    streamWriter.Write(chuoiGhi);
                }
            }
        }

        public String LayChuoiKetNoi()
        {
            if (xacThucWindows)
            {
                return String.Format("Server = {0}; Database = {1}; Integrated Security = True;", mayChu, coSoDuLieu);
            }
            else
            {
                return String.Format("Server = {0}; Database = {1}; UID = {2}; PWD = {3};", mayChu, coSoDuLieu, maNgDung, matKhau);
            }
        }
        #endregion
    }
}
