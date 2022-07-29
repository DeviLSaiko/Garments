using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace GarmentsPro.Admin
{
    public partial class CreateOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadOrder();
            }
        }

        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }

        private void LoadOrder()
        {
            DataTable MT = new DataTable();

            SqlConnection MyCon = new SqlConnection(MyConnection());
            SqlDataAdapter MA = new SqlDataAdapter("Select top (5) * from Orders ORDER BY OId DESC", MyCon);
            MA.Fill(MT);

            GridView1.DataSource = MT;
            GridView1.DataBind();


            if (MT.Rows.Count == 0)
            {
                txtError.Text = "No Record Found";
            }

        }

        protected void BtnCreate_Click1(object sender, EventArgs e)
        {
            SqlConnection MyCon = new SqlConnection(MyConnection());
            MyCon.Open();

            SqlCommand MyCmd = new SqlCommand("InsertOrder", MyCon);
            MyCmd.CommandType = CommandType.StoredProcedure;
            MyCmd.Parameters.AddWithValue("@ClientName", txtClinet.Text);
            MyCmd.Parameters.AddWithValue("@OrderType", ddType.SelectedValue);
            MyCmd.Parameters.AddWithValue("@Qty", txtQty.Text);
            MyCmd.Parameters.AddWithValue("@ETA_Time", txtETA.Text);
            MyCmd.Parameters.AddWithValue("@Status", DdStatus.SelectedValue);
            MyCmd.ExecuteNonQuery();

            string MyQOS = "Insert into OrderStatus (OrderID,Current_Department, Status) values ( 'ORD' + (select replace(convert(varchar, getdate(), 103), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  ),@FF,@WP)";
            SqlCommand MyCmdOS = new SqlCommand(MyQOS, MyCon);
            MyCmdOS.Parameters.AddWithValue("@FF", "1");
            MyCmdOS.Parameters.AddWithValue("@WP", DdStatus.SelectedValue);
            MyCmdOS.ExecuteNonQuery();

            string MyQH = "Insert into OrderHistory (OrderID,Current_Department, Status ,Remarks) values ( 'ORD' + (select replace(convert(varchar, getdate(), 103), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  ),@FF,@WP ,@Remarks)";
            SqlCommand MyCmd1 = new SqlCommand(MyQH, MyCon);
            MyCmd1.Parameters.AddWithValue("@FF", "1");
            MyCmd1.Parameters.AddWithValue("@WP", DdStatus.SelectedValue);
            MyCmd1.Parameters.AddWithValue("@Remarks", '-');

            MyCmd1.ExecuteNonQuery();

            MyCon.Close();

            Response.Redirect("/admin/Orders.aspx");


            txtClinet.Text = "";
            ddType.SelectedIndex = 0;
            DdStatus.SelectedIndex = 0;
            txtQty.Text = "";
            txtETA.Text = "";



            LoadOrder();
        }

    }
}
 