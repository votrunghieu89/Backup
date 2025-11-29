using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMDT22_9_2025.TMDT_Lazada._17_11_2025
{
    public partial class CreateProduct1 : System.Web.UI.UserControl
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
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "TenLoaiHang";   // Hiển thị tên loại hàng
                    ddlCategory.DataValueField = "maLoaiHang";   // Lấy mã loại hàng khi submit
                    ddlCategory.DataBind();
                }
                catch (Exception ex)
                {
                    // Ghi log hoặc hiển thị lỗi
                    Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                }
            }
        

        }
       
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('btnSubmit_Click chạy!');</script>");
            try
            {
                string tenHang = txtProductName.Text;
                decimal gia = Convert.ToDecimal(txtPrice.Text);
                string maLoaiHang = ddlCategory.SelectedValue;
                int maLoai = int.Parse(maLoaiHang);
                int SoLuongTon = int.Parse(txtDescription.Text);
                string fileName = null;
                if (fuProductImage.HasFile)  // Kiểm tra người dùng đã chọn file chưa
                {
                    fileName = fuProductImage.FileName;
                    string folder = "~/TMDT_Lazada/Image";
                    string savePath = Server.MapPath(folder + "/" + fileName);
                    fuProductImage.SaveAs(savePath);
                }
                string query = @"INSERT INTO HangHoa(TenHangHoa, Gia, maLoaiHang, SoLuongTon, HinhAnh) VALUES(@TenHangHoa, @Gia, @maLoaiHang, @SoLuongTon, @HinhAnh)";
                var parameters = new Dictionary<string, object>
            {
                {"@TenHangHoa", tenHang },
                {"@Gia", gia },
                {"@maLoaiHang", maLoai },
                {"@SoLuongTon", SoLuongTon },
                {"@HinhAnh", (object)fileName ?? DBNull.Value }
            };
                int excuteNonQuey = connection.CUD(query, parameters);
                if (excuteNonQuey > 0)
                {
                    Response.Write("<script>alert('Tạo sản phẩm thành công!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Tạo sản phẩm thất bại!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
            }
        }
    }
}