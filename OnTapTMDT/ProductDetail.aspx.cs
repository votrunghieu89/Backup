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
    public partial class ProductDetail : System.Web.UI.Page
    {
        private readonly Connection connection = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            getDetail();
        }

        private void getDetail()
        {
            string MaHoa = Request.QueryString["MaHoa"];
            string query = @"Select * from Hoa where MaHoa = @MaHoa";
            var parameters = new List<SqlParameter>()
                     {
                            new SqlParameter("@MaHoa", MaHoa)
                     };
            DataTable dt = connection.getDataParameter(query, parameters);
            dlProduct.DataSource = dt;
            dlProduct.DataBind();
        }

        protected void dlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnBuy_Click(object sender, EventArgs e)
        {

        }
        protected void btnCard_Click(object sender, EventArgs e)
        {
            string MaHoa = Request.QueryString["MaHoa"];
            string query = @"Insert into ";
        }
    }
}