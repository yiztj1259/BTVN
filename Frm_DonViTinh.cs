using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BTVN_T3.TangVanHanh;

namespace BTVN_T3
{
    public partial class Frm_DonViTinh : Form
    {
        public Frm_DonViTinh()
        {
            InitializeComponent();
        }

        BLL_DonViTinh bllDVT;
        String loi = String.Empty;

        private void Frm_DonViTinh_Load(object sender, EventArgs e)
        {
            bllDVT = new BLL_DonViTinh();
        }

        private void btnLayDuLieuDVT_Click(object sender, EventArgs e)
        {
            int maDVT;
            if (String.IsNullOrEmpty(txtNhapMaDVT.Text))
            {
                maDVT = 0;
            }
            else
            {
                maDVT = Convert.ToInt32(txtNhapMaDVT.Text);
            }

            SqlDataReader sqlDataReader = bllDVT.LayDanhSachDonViTinh(ref loi, maDVT);

            if (sqlDataReader != null)
            {
                lsDanhSachDonViTinh.Items.Clear();
                while (sqlDataReader.Read())
                {
                    String dong = String.Format("{0} - {1}", sqlDataReader["MaDVT"], sqlDataReader["TenDVT"]);
                    lsDanhSachDonViTinh.Items.Add(dong);
                }
            }
        }

        
    }
}
