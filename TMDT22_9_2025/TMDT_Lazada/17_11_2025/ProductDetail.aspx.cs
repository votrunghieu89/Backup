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
    public partial class ProductDetail : System.Web.UI.Page
    {

      //  private readonly string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\TMDT22_9_2025\TMDT22_9_2025\App_Data\Database1.mdf;Integrated Security=True";
        private readonly Connection connection = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (!IsPostBack)
            {
                try
                {
                        string maHangHoa = Request.QueryString["maHangHoa"];
                        string query = @"SELECT maHangHoa, TenHangHoa, Gia, maLoaiHang,SoLuongTon, HinhAnh from HangHoa WHERE maHangHoa = @maHangHoa";
                        var parameters = new List<SqlParameter>()
                        {
                                new SqlParameter("@maHangHoa", maHangHoa)
                        };
                        DataTable dt = connection.getDataParameter(query, parameters);
                        dlProduct.DataSource = dt;
                        dlProduct.DataBind();
                        
                    
                }
                catch (Exception ex)
                {
                    // Ghi log hoặc hiển thị lỗi
                    Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                }
            }
        }

        protected void dlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Xử lý sửa sản phẩm
            Response.Write("Bạn vừa click Sửa!");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            
        }
    }
}