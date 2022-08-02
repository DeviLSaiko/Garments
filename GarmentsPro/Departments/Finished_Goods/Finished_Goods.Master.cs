using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garments_Pro.Departments.Finished_Goods
{
    public partial class Finished_Goods : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Txt = "";

            if (Convert.ToString(Session["Department"]) == "Admin" || Convert.ToString(Session["Department"]) == "Finished Goods")
            {
                lblWelcome.Text = Txt + (Session["Name"].ToString());
                Label1.Text = Txt + (Session["Department"].ToString());
            }
            else
            {
                Response.Redirect("/Login.aspx");
            }
        }
    }
}