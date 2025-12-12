using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTapTMDT
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private readonly Connection connection = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            UploadSideBar();
        }

        public void UploadSideBar()
        {
            try
            {
                string query = @"Select MaDM, TenDM from DanhMucHoa";
                DataTable dt = connection.getData(query);
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            catch (Exception ex) 
            {
                Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
            }
        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {

        }
    }
}