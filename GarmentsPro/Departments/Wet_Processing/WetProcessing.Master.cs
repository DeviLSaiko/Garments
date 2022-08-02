using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Departments.Wet_Processing
{
    public partial class WetProcessing : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Txt = "";

            if (Convert.ToString(Session["Department"]) == "Admin" || Convert.ToString(Session["Department"]) == "Wet Processing")
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