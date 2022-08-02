using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin.Users
{
    public partial class Accounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGrid();
        }

        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
        private void LoadGrid()
        {
            DataTable MyTable = new DataTable();

            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter("select UID,Name,UserName,Password,Department from UserInfo", Sqlconnection);
                myada.Fill(MyTable);
            }
            GridView1.DataSource = MyTable;
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}