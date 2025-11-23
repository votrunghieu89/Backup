using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMDT22_9_2025.TestDb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string stringConnection = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\TMDT22_9_2025\TMDT22_9_2025\App_Data\Sql.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    using (var connection = new SqlConnection(stringConnection))
                    {
                        // Mở kết nối đồng bộ
                        connection.Open();

                        string query = @"SELECT tenHangHoa FROM HangHoa";
                        using (var command = new SqlCommand(query, connection))
                        using (var reader = command.ExecuteReader())
                        {
                            // Đọc dữ liệu từng dòng
                            while (reader.Read())
                            {
                                string name = reader.GetString(reader.GetOrdinal("tenHangHoa"));
                                DDL.Items.Add(name);
                            }
                        }
                    }

                    // Thêm item mặc định (tùy chọn)
                    DDL.Items.Insert(0, new ListItem("-- Chọn hàng hóa --", ""));
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