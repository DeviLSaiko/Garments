using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin.Orders
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadOrder();
        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
        private void LoadOrder()
        {
            DataTable MT = new DataTable();

            SqlConnection MyCon = new SqlConnection(MyConnection());
            SqlDataAdapter MA = new SqlDataAdapter("Select  * from Orders ", MyCon);
            MA.Fill(MT);

            GridView1.DataSource = MT;
            GridView1.DataBind();


            if (MT.Rows.Count == 0)
            {
                txtError.Text = "No Record Found";
            }

        }
    }
}