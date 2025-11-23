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
        private readonly string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\TMDT22_9_2025\TMDT22_9_2025\App_Data\Database1.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack) return;
            if (!IsPostBack) {
                try
                {
                    string maLoaiHang = Request.QueryString["maLoaiHang"];
                    if (maLoaiHang == null) return;
                    using (var connection = new System.Data.SqlClient.SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = @"SELECT maHangHoa, TenHangHoa, Gia, maLoaiHang,SoLuongTon, HinhAnh from HangHoa WHERE maLoaiHang = @maLoaiHang";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@maLoaiHang", maLoaiHang);

                            SqlDataAdapter adapter = new SqlDataAdapter(command);
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);

                            dlProduct.DataSource = dt;
                            dlProduct.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Ghi log hoặc hiển thị lỗi
                    Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                }
            }
        }
    }
}