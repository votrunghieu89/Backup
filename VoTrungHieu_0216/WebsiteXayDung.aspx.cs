using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoTrungHieu_0216.Connection;

namespace VoTrungHieu_0216
{
    public partial class WebsiteXayDung : System.Web.UI.Page
    {
        private readonly SQLFuntion sQLFuntion = new SQLFuntion();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetDataNAV();
          
        }
        private void GetDataNAV()
        {
            try
            {
                string query = "SELECT MaNCC, TenNCC FROM NhaCC";
                DataTable dataTable = sQLFuntion.getData(query);
                DataList1.DataSource = dataTable;
                DataList1.DataBind();
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi lấy dữ liệu: " + ex.Message);
            }
        }
        private void getTotal()
        {
            string query = "SELECT COUNT(*) FROM NhaCC";
            int total = sQLFuntion.getValue(query);
            lblTongSoVatTu.Text = total.ToString();
        }
        private void getTotalNumberOfSuppliers()
        {
            string query = "SELECT SUM(SoLuong) FROM VatTu";
            int totalSuppliers = sQLFuntion.getValue(query);
            lblTongSoLuong.Text = totalSuppliers.ToString();
        }
        protected void btnThongKe_Click(object sender, EventArgs e)
        {
            getTotal();
            getTotalNumberOfSuppliers();
        }
    }
}