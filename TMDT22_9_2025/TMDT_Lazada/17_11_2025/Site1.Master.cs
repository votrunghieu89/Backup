using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TMDT22_9_2025.TMDT_Lazada._17_11_2025;

namespace TMDT22_9_2025.TMDT_Lazada
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private readonly Connection connection = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (!IsPostBack)
            {
                try
                {         
                        string query = @"SELECT maLoaiHang, TenLoaiHang from LoaiHang";
                        DataTable dt = connection.getData(query);
                        DataList1.DataSource = dt;
                        DataList1.DataBind();
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