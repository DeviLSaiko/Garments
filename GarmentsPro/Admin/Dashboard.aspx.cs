using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin
{

    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {

                LoadTotalAcc();
                LoadOrders();
                LoadCO();
                LoadPO();
                LoadFO();
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }

        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }

        private void LoadTotalAcc()
        {
            DataTable MyTable = new DataTable();
            string MYQ = "select count(*) as Total from UserInfo ";
            SqlConnection Sqlconnection = new SqlConnection(MyConnection());

            Sqlconnection.Open();

            SqlCommand mYcMD = new SqlCommand(MYQ, Sqlconnection);

            lblTotAccounts.Text = Convert.ToString(mYcMD.ExecuteScalar());
            Sqlconnection.Close();
        }
        private void LoadOrders()
        {
            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(MyConnection());
            string MYQ = "select count(*) as Total from Orders ";
            SqlCommand mYcMD = new SqlCommand(MYQ, Sqlconnection);

            Sqlconnection.Open();
            lblTOrders.Text = Convert.ToString(mYcMD.ExecuteScalar());
            Sqlconnection.Close();
        }
        private void LoadCO()
        {
            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(MyConnection());
            string MYQ = "select count(*) as Total from Orders where Status='Current' ";
            SqlCommand mYcMD = new SqlCommand(MYQ, Sqlconnection);

            Sqlconnection.Open();
            lblCurrentOrders.Text = Convert.ToString(mYcMD.ExecuteScalar());
            Sqlconnection.Close();
        }
        private void LoadPO()
        {
            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(MyConnection());
            string MYQ = "select count(*) as Total from Orders where Status='Pending' ";
            SqlCommand mYcMD = new SqlCommand(MYQ, Sqlconnection);

            Sqlconnection.Open();
            lblpending.Text = Convert.ToString(mYcMD.ExecuteScalar());
            Sqlconnection.Close();
        }
        private void LoadFO()
        {
            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(MyConnection());
            string MYQ = "select count(*) as Total from Orders where Status='Finished' ";
            SqlCommand mYcMD = new SqlCommand(MYQ, Sqlconnection);

            Sqlconnection.Open();
            lblFinshedOrds.Text = Convert.ToString(mYcMD.ExecuteScalar());
            Sqlconnection.Close();
        }
    }
}