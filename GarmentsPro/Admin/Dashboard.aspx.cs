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


        private void LoadGrid()
        {
            DataTable MT = new DataTable();
            string MYQ = "DECLARE   @cnt INT = 1; " +
                           "WHILE @cnt < 6 " +
                           "BEGIN" +
                           " DECLARE @cntd INT = 1; " +
                          "WHILE @cntd < 5" +
                            "BEGIN" +
                             " select  count(Status) AS Total from OrderStatus WHERE  Current_Department = @cnt AND Status = @cntd" +
                             " SET @cntd = @cntd + 1; " +
                             "  END; " +
                             " SET @cnt = @cnt + 1; " +
                             "END; ";
            SqlDataAdapter adp = new SqlDataAdapter(MYQ, MyConnection());
            DataSet ds = new DataSet();
            adp.Fill(ds);


            //int i = 1;

            //foreach (var item in Label.Controls)
            //{
            //    if (item is Label)
            //    {
            //        ((Label)item).Text = "YAN" + i;
            //        i++;
            //    }
            //}

        //for (int i=0;i<20;i++)
        //{
        //    Label.FindControl("YAN"+i).Text = ds.Tables[i].Rows[0]["Total"].ToString();
        //}

        //YAN0.Text = ds.Tables[0].Rows[0]["Total"].ToString();
        //YAN1.Text = ds.Tables[1].Rows[0]["Total"].ToString();
        //YAN2.Text = ds.Tables[2].Rows[0]["Total"].ToString();
        //YAN3.Text = ds.Tables[3].Rows[0]["Total"].ToString();
        //YAN4.Text = ds.Tables[4].Rows[0]["Total"].ToString();
        //YAN5.Text = ds.Tables[5].Rows[0]["Total"].ToString();
        //YAN6.Text = ds.Tables[6].Rows[0]["Total"].ToString();
        //YAN7.Text = ds.Tables[7].Rows[0]["Total"].ToString();
        //YAN8.Text = ds.Tables[8].Rows[0]["Total"].ToString();
        //YAN9.Text = ds.Tables[9].Rows[0]["Total"].ToString();








    }

    }
}