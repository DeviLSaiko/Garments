using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            LoadGrid();
        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = STMT; Integrated Security =SSPI ";
        }


        protected void lnkAddNew_Click1(object sender, EventArgs e)
        {
            
            txtLName.Text = "";
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "MyScript", "$('#addModalDates').modal('show');", true);

        }



        private void LoadGrid()

        {
            DataTable MyTable = new DataTable();
            string MYQ = "SELECT  StuID , Name ,Email ,Mobile from Students ";

            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter(MYQ, Sqlconnection);

                myada.Fill(MyTable);
            }
            GridView1.DataSource = MyTable;
            GridView1.DataBind();



        }
    }
}