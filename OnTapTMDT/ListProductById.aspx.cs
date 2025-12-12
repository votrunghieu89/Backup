using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTapTMDT
{
    public partial class ListProductById : System.Web.UI.Page
    {
        private readonly Connection connection = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            getFlowerById();
        }
        private void getFlowerById()
        {
            string MaDM = Request.QueryString["MaDM"];
            if (MaDM == null) { return; }
            string query = @"Select MaHoa, TenHoa, DonGia, HinhAnh from Hoa where MaDM = @MaDM";
            var parameters = new List<SqlParameter>()
                     {
                            new SqlParameter("@MaDM", MaDM)
                     };
            DataTable dt = connection.getDataParameter(query, parameters);
            dlProduct.DataSource = dt;
            dlProduct.DataBind();
        }
    }
}