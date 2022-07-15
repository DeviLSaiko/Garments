using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garments_Pro.Yarn_Formation
{
    public partial class YarnFormation : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Txt = "Hello! ";

            if (Session["UserName"] != null)
            {
                lblWelcome.Text = Txt + (Session["UserName"].ToString());
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}