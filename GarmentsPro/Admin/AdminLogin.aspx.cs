using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        String MyCon = @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security =SSPI ";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Remove("UserName");
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
       
        }
    }
}
