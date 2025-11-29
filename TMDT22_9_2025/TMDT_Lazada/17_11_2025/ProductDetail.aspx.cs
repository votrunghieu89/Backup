using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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
            LoadDropDownList();
        }

        protected void dlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void LoadDropDownList()
        {
            string query = @"SELECT maLoaiHang, TenLoaiHang from LoaiHang";
            DataTable dt = connection.getData(query);
            ddlEditCategory.DataSource = dt;
            ddlEditCategory.DataTextField = "TenLoaiHang";  
            ddlEditCategory.DataValueField = "maLoaiHang";   
            ddlEditCategory.DataBind();
        }
        protected void dlProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            if (e.CommandName == "Edit")
            {
                editProductPanel.Visible = true;
                hfProductId.Value = id;
                string query = "SELECT * FROM HangHoa WHERE maHangHoa = @maHangHoa";
                var parameters = new List<SqlParameter>
                {
                    new SqlParameter("@maHangHoa", id)
                };
                DataTable dt = connection.getDataParameter(query, parameters);
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    txtEditName.Text = row["TenHangHoa"].ToString();
                    txtEditPrice.Text = row["Gia"].ToString();
                    txtEditStock.Text = row["SoLuongTon"].ToString();
                    ddlEditCategory.SelectedValue = row["maLoaiHang"].ToString();
                    imgEditPreview.ImageUrl = "~/TMDT_Lazada/Image/" + row["HinhAnh"].ToString();
                }

            }

            if (e.CommandName == "Delete")
            {
                string query = "DELETE FROM HangHoa WHERE maHangHoa = @maHangHoa";
                var parameters = new Dictionary<string, object>
                {
                    { "@maHangHoa", id }
                };
                int rowsAffected = connection.CUD(query, parameters);
                if (rowsAffected > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        $"alert('Xóa thành công sản phẩm với ID = {id}'); window.location='{Request.RawUrl}';",
                        true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        $"alert('Xóa thất bại sản phẩm với ID = {id}');",
                        true);
                }
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
      
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string id = hfProductId.Value;
                string tenHang = txtEditName.Text.Trim();
                decimal gia = decimal.Parse(txtEditPrice.Text.Trim());
                int soLuongTon = int.Parse(txtEditStock.Text.Trim());
                int maLoai = int.Parse(ddlEditCategory.SelectedValue);

                string query;
                var parameters = new Dictionary<string, object>
        {
            { "@maHangHoa", id },
            { "@TenHangHoa", tenHang },
            { "@Gia", gia },
            { "@SoLuongTon", soLuongTon },
            { "@maLoaiHang", maLoai }
        };

                // Nếu người dùng chọn ảnh mới
                if (fuEditImage.HasFile)
                {
                    string folder = Server.MapPath("~/TMDT_Lazada/Image/");
                    if (!System.IO.Directory.Exists(folder))
                        System.IO.Directory.CreateDirectory(folder);

                    string fileName = Path.GetFileName(fuEditImage.FileName);
                    string savePath = System.IO.Path.Combine(folder, fileName);
                    fuEditImage.SaveAs(savePath);

                    query = @"UPDATE HangHoa 
                      SET TenHangHoa=@TenHangHoa, Gia=@Gia, SoLuongTon=@SoLuongTon, 
                          maLoaiHang=@maLoaiHang, HinhAnh=@HinhAnh 
                      WHERE maHangHoa=@maHangHoa";

                    parameters.Add("@HinhAnh", fileName);
                }
                else
                {
                    // Không đổi ảnh
                    query = @"UPDATE HangHoa 
                      SET TenHangHoa=@TenHangHoa, Gia=@Gia, SoLuongTon=@SoLuongTon, 
                          maLoaiHang=@maLoaiHang 
                      WHERE maHangHoa=@maHangHoa";
                }

                int rowsAffected = connection.CUD(query, parameters);
                if (rowsAffected > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Cập nhật sản phẩm thành công!'); window.location='" + Request.RawUrl + "';",
                        true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Cập nhật sản phẩm thất bại!');",
                        true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    $"alert('Lỗi: {ex.Message}');",
                    true);
            }
        }
        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            // Ẩn panel edit
            editProductPanel.Visible = false;

            // Nếu muốn, xóa giá trị cũ trong form
            hfProductId.Value = string.Empty;
            txtEditName.Text = string.Empty;
            txtEditPrice.Text = string.Empty;
            txtEditStock.Text = string.Empty;
            ddlEditCategory.SelectedIndex = 0;
            imgEditPreview.ImageUrl = string.Empty;
        }

    }
}