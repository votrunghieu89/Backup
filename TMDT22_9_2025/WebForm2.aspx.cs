using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMDT22_9_2025
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            lbl1.Text = "Trang chu";
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            lbl1.Text = "Truoc";
        }
        protected void btn3_Click1(object sender, EventArgs e)
        {
            lbl1.Text = "Sau";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int text = Convert.ToInt32(TextBox1.Text);
            
           
            if (text % 2 == 0)
            {
                Label1.Text = $"{text.ToString()} la so chan";
                Label1.ForeColor = System.Drawing.Color.LightGreen; // số chẵn
            }
            else
            {
                Label1.Text = $"{text.ToString()} la so le";
                Label1.ForeColor = System.Drawing.Color.LightCoral; // số lẻ
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            rectangula.Style["background-color"] = "green";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            rectangula.Style["background-color"] = "red";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            rectangula.Style["background-color"] = "purple";
        }
    }
}