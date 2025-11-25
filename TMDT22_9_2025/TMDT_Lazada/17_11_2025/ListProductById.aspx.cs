using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMDT22_9_2025.TMDT_Lazada._17_11_2025
{
    public partial class WebForm2 : System.Web.UI.Page
    {
      //  private readonly string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\TMDT22_9_2025\TMDT22_9_2025\App_Data\Database1.mdf;Integrated Security=True";
        private readonly Connection connection1 = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack) return;
            if (!IsPostBack) {
                try
                {
                    string maLoaiHang = Request.QueryString["maLoaiHang"];
                    if (maLoaiHang == null) return;
                    string query = @"SELECT maHangHoa, TenHangHoa, Gia, maLoaiHang, SoLuongTon, HinhAnh 
                     FROM HangHoa 
                     WHERE maLoaiHang = @maLoaiHang";
                     var parameters = new List<SqlParameter>()
                     {
                            new SqlParameter("@maLoaiHang", maLoaiHang)
                     };
                    DataTable dt = connection1.getDataParameter(query, parameters);
                    dlProduct.DataSource = dt;
                    dlProduct.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                }

            }
        }
    }
}