using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using System.Xml;

namespace BTVN_T3.TangDuLieu
{
    public class CoSoDuLieu
    {
        SqlConnection ketNoiSQL;
        SqlCommand lenhSQL;
        SqlDataAdapter dataAdapter;
        KetNoi ketNoi;

        public CoSoDuLieu() {
            ketNoi = new KetNoi("WHITERUN", "Data_BanHang_HocTap", "sa", "MatKhauSQL", false);
            ketNoiSQL = new SqlConnection()
            {
                ConnectionString = ketNoi.LayChuoiKetNoi()
            };
        }

        #region Phương thức kết nối
        public bool KiemTraKetNoi(ref String loi)
        {
            try
            {
                ketNoiSQL.Open();
                return true;
            }
            catch (Exception ngoaiLe)
            {
                loi = ngoaiLe.Message;
                return false;
            }
            finally
            {
                ketNoiSQL.Close();
            }
        }

        public void GhiChuoiKetNoi(String duongDan, String mayChu, String coSoDuLieu, String maNgDung, String matKhau, bool xacThucWindows)
        {
            ketNoi.GhiChuoiKetNoiVaoTep(duongDan, mayChu, coSoDuLieu, maNgDung, matKhau, xacThucWindows);
        }
        #endregion

        #region Phương thức thao tác dữ liệu

        // 1. Đọc dữ liệu định dạng DataReader
        public SqlDataReader DocDuLieuSqlDataReader(ref String loi, String tenLenh, CommandType loaiLenh, params SqlParameter[] cacThamSo)
        {
            SqlDataReader sqlDataReader = null;

            try
            {
                if (ketNoiSQL.State == ConnectionState.Open)
                {
                    ketNoiSQL.Close();
                }
                ketNoiSQL.Open();

                lenhSQL = new SqlCommand()
                {
                    Connection = ketNoiSQL,
                    CommandText = tenLenh,
                    CommandType = loaiLenh,
                    CommandTimeout = 3600,
                };

                if (cacThamSo != null)
                {
                    foreach (SqlParameter thongSo in cacThamSo)
                    {
                        lenhSQL.Parameters.Add(thongSo);
                    }
                }

                sqlDataReader = lenhSQL.ExecuteReader();
            }
            catch (Exception ngoaiLe)
            {
                loi = ngoaiLe.Message;
            }

            return sqlDataReader;
        }

        /// <summary>
        /// 2. Đọc dữ liệu định dạng DataTable
        /// </summary>
        /// <param name="loi">Lưu thông tin lỗi</param>
        /// <param name="tenLenh">Tên Store Procedure cần dùng</param>
        /// <param name="loaiLenh">Loại lệnh, thường chọn StoreProcedure</param>
        /// <param name="cacThamSo">Các tham số truyền vào</param>
        /// <returns></returns>
        public DataTable DocDuLieuDataTable(ref String loi, String tenLenh, CommandType loaiLenh, params SqlParameter[] cacThamSo)
        {
            DataTable dataTable = new DataTable();

            try
            {
                if (ketNoiSQL.State == ConnectionState.Open)
                {
                    ketNoiSQL.Close();
                }
                ketNoiSQL.Open();

                lenhSQL = new SqlCommand()
                {
                    Connection = ketNoiSQL,
                    CommandText = tenLenh,
                    CommandType = loaiLenh,
                    CommandTimeout = 3600,
                };

                if (cacThamSo != null)
                {
                    foreach (SqlParameter thongSo in cacThamSo)
                    {
                        lenhSQL.Parameters.Add(thongSo);
                    }
                }

                dataAdapter = new SqlDataAdapter(lenhSQL);
                dataAdapter.Fill(dataTable);
                return dataTable;
            }
            catch (Exception ngoaiLe)
            {
                loi = ngoaiLe.Message;
                return dataTable;
            }
            finally
            {
                ketNoiSQL.Close();
            }
        }

        // 3. Đọc dữ liệu định dạng đối tượng
        public Object DocDuLieuDoiTuong(ref String loi, String tenLenh, CommandType loaiLenh, params SqlParameter[] cacThamSo)
        {
            try
            {
                if (ketNoiSQL.State == ConnectionState.Open)
                {
                    ketNoiSQL.Close();
                }
                ketNoiSQL.Open();

                lenhSQL = new SqlCommand()
                {
                    Connection = ketNoiSQL,
                    CommandText = tenLenh,
                    CommandType = loaiLenh,
                    CommandTimeout = 3600,
                };

                if (cacThamSo != null)
                {
                    foreach (SqlParameter thongSo in cacThamSo)
                    {
                        lenhSQL.Parameters.Add(thongSo);
                    }
                }
            }
            catch (Exception ngoaiLe)
            {
                loi = ngoaiLe.Message;
            }

            return lenhSQL.ExecuteScalar();
        }

        // 4. Đọc dữ liệu định dạng XML Document
        public XmlReader DocDuLieuXML(ref String loi, String tenLenh, CommandType loaiLenh, params SqlParameter[] cacThamSo)
        {
            try
            {
                if (ketNoiSQL.State == ConnectionState.Open)
                {
                    ketNoiSQL.Close();
                }
                ketNoiSQL.Open();

                lenhSQL = new SqlCommand()
                {
                    Connection = ketNoiSQL,
                    CommandText = tenLenh,
                    CommandType = loaiLenh,
                    CommandTimeout = 3600,
                };

                if (cacThamSo != null)
                {
                    foreach (SqlParameter thongSo in cacThamSo)
                    {
                        lenhSQL.Parameters.Add(thongSo);
                    }
                }
            }
            catch (Exception ngoaiLe)
            {
                loi = ngoaiLe.Message;
            }

            return lenhSQL.ExecuteXmlReader();
        }

        // 5. Thực thi các thủ tục
        public int ThucThiThuTuc(ref String loi, String tenLenh, CommandType loaiLenh, params SqlParameter[] cacThamSo)
        {
            int soHang = 0;

            try
            {
                if (ketNoiSQL.State == ConnectionState.Open)
                {
                    ketNoiSQL.Close();
                }
                ketNoiSQL.Open();

                lenhSQL = new SqlCommand()
                {
                    Connection = ketNoiSQL,
                    CommandText = tenLenh,
                    CommandType = loaiLenh,
                    CommandTimeout = 3600,
                };

                if (cacThamSo != null)
                {
                    foreach (SqlParameter thongSo in cacThamSo)
                    {
                        lenhSQL.Parameters.Add(thongSo);
                    }
                }

                soHang = lenhSQL.ExecuteNonQuery();
            }
            catch (Exception ngoaiLe)
            {
                loi = ngoaiLe.Message;
            }

            return soHang;
        }
        #endregion
    }
}
