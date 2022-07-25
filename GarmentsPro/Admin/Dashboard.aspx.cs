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

                LoadGrid();
                LoadFinished();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }

        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }


        private void LoadGrid()
        {
            DataTable MT = new DataTable();
            string MYQ = "DECLARE   @cnt INT = 1; " +
                           "WHILE @cnt < 6 " +
                           "BEGIN" +
                           " DECLARE @cntd INT = 1; " +
                          "WHILE @cntd < 4" +
                            "BEGIN" +
                             " select  count(Status) AS Total from OrderStatus WHERE  Current_Department = @cnt AND Status = @cntd" +
                             " SET @cntd = @cntd + 1; " +
                             "  END; " +
                             " SET @cnt = @cnt + 1; " +
                             "END; ";
            SqlDataAdapter adp = new SqlDataAdapter(MYQ, MyConnection());
            DataSet ds = new DataSet();
            adp.Fill(ds);

            YAN1.Text = ds.Tables[0].Rows[0]["Total"].ToString();
            YAN2.Text = ds.Tables[1].Rows[0]["Total"].ToString();
            YAN3.Text = ds.Tables[2].Rows[0]["Total"].ToString();

            FAB1.Text = ds.Tables[3].Rows[0]["Total"].ToString();
            FAB2.Text = ds.Tables[4].Rows[0]["Total"].ToString();
            FAB3.Text = ds.Tables[5].Rows[0]["Total"].ToString();

            WET1.Text = ds.Tables[6].Rows[0]["Total"].ToString();
            WET2.Text = ds.Tables[7].Rows[0]["Total"].ToString();
            WET3.Text = ds.Tables[8].Rows[0]["Total"].ToString();

            FR1.Text = ds.Tables[9].Rows[0]["Total"].ToString();
            FR2.Text = ds.Tables[10].Rows[0]["Total"].ToString();
            FR3.Text = ds.Tables[11].Rows[0]["Total"].ToString();

            FG1.Text = ds.Tables[12].Rows[0]["Total"].ToString();
            FG2.Text = ds.Tables[13].Rows[0]["Total"].ToString();
            FG3.Text = ds.Tables[14].Rows[0]["Total"].ToString();

        }

        private void LoadFinished()
        {
            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(MyConnection());
            string MYQ = "	DECLARE   @tt INT = 1;" +
                               " WHILE @tt < 6 " +
                               " BEGIN" +
                               " SELECT count(*) as Total FROM OrderHistory WHERE Current_Department = @tt and Status = '4' and Created_Date >= DATEADD(day, -30, GETDATE())" +
                                 "  SET @tt = @tt + 1;" +
                                  "          END; ";
            SqlDataAdapter adp = new SqlDataAdapter(MYQ, MyConnection());
            DataSet ds = new DataSet();
            adp.Fill(ds);

            YAN4.Text = ds.Tables[0].Rows[0]["Total"].ToString();
            FAB4.Text = ds.Tables[1].Rows[0]["Total"].ToString();
            WET4.Text = ds.Tables[2].Rows[0]["Total"].ToString();
            FR4.Text = ds.Tables[3].Rows[0]["Total"].ToString();
            FG4.Text = ds.Tables[4].Rows[0]["Total"].ToString();

        }
    }
}