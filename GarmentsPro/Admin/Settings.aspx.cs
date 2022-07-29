using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin
{
    public partial class Settings : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection mYcON = new SqlConnection(Db());
            mYcON.Open();

            string query = "TRUNCATE TABLE Orders ";
            SqlCommand cmd = new SqlCommand(query, mYcON);
            cmd.ExecuteNonQuery();
            
            string queryf = "TRUNCATE TABLE OrderHistory ";
            SqlCommand cmds = new SqlCommand(queryf, mYcON);
            cmd.ExecuteNonQuery();

            string queryc = "TRUNCATE TABLE OrderStatus ";
            SqlCommand cmdd = new SqlCommand(queryc, mYcON);
            cmdd.ExecuteNonQuery();

        }
        protected string Db()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
    }
}