using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMDT22_9_2025.TMDT_Lazada
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private readonly string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\TMDT22_9_2025\TMDT22_9_2025\App_Data\Database1.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (!IsPostBack)
            {
                try
                {
                    using (var connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = @"SELECT maLoaiHang, TenLoaiHang from LoaiHang";
                        SqlCommand command = new SqlCommand(query, connection);
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        DataList1.DataSource = dt;
                        DataList1.DataBind();
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