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

            if (!IsPostBack)
            {
                string l_Query = "Select * From Orders Orders";

                LoadOrder(l_Query);
            }
            
        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }


        private void LoadOrder(string a_Query)
        {
            DataTable MT = new DataTable();

            SqlConnection MyCon = new SqlConnection(MyConnection());
            SqlDataAdapter MA = new SqlDataAdapter(a_Query, MyCon);
            MA.Fill(MT);

            GridView1.DataSource = MT;
            GridView1.DataBind();


            if (MT.Rows.Count < 0)
            {
                txtError.Text = "No Record Found";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                string l_Query = string.Empty;

                if (ddSearch.SelectedValue == "1")
                {
                    // Name search
                    l_Query = "Select   * from Orders  where ClientName like '%" + txtSearch.Text + "%'";
                }
                else if (ddSearch.SelectedValue == "2")
                {
                    // Batch wise search
                    l_Query = "Select * from Orders  where OrderType like '%" + txtSearch.Text + "%'";
                }
                else
                {
                // Department wise search
                l_Query = "Select * from Orders   where  Status like '%" + txtSearch.Text + "%'";
                }

            LoadOrder(l_Query);
            }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string l_Query = "Select * From Orders Orders";

            LoadOrder(l_Query);
        }
    }
}