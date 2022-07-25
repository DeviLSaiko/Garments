using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Txt = "";

            if ( Convert.ToString(Session["Department"]) == "Admin")
            {
                lblWelcome.Text = Txt + (Session["Name"].ToString());
            }
            else
            {
                Response.Redirect("/Login.aspx");
            }



        }
    }
}