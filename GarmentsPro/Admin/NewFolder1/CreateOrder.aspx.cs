using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garments_Pro.Orders
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

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            bool CheakExist1 = CheckExist();

            if (CheakExist1 == false)
            {
                SqlConnection MyCon = new SqlConnection(MyConnection());
                SqlCommand MyCmd = new SqlCommand("Insert into Orders (OrderID,ClientName,OrderType,Qty,ETA_Time,Status) values (@OID, @CN,@OType,@Qty,@ETA,@Stat)", MyCon);
                 

                MyCon.Open();


                string stdate = DateTime.Parse(txtOrderID.Text).ToString();
                


                MyCmd.Parameters.AddWithValue("@OID", stdate);
                MyCmd.Parameters.AddWithValue("@CN", txtClinet.Text);
                MyCmd.Parameters.AddWithValue("@OType", ddType.SelectedValue);
                MyCmd.Parameters.AddWithValue("@Qty", txtQty.Text);
                MyCmd.Parameters.AddWithValue("@ETA", txtETA.Text);
                MyCmd.Parameters.AddWithValue("@Stat", DdStatus.SelectedValue);

                MyCmd.ExecuteNonQuery();
                

                SqlCommand MyCmdd = new SqlCommand("Insert into Status (OID)values(@OID)", MyCon);
                
                MyCmdd.Parameters.AddWithValue("@OID", txtOrderID.Text);

                MyCon.Close();


                txtOrderID.Text = "";
                txtClinet.Text = "";
                ddType.SelectedIndex = 0;
                DdStatus.SelectedIndex = 0;
                txtQty.Text = "";
                txtETA.Text = "";
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "swal('Error' , 'Order ID  Must be Unique ' , 'info')", true);
            }
            LoadOrder();
        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
        private bool CheckExist()
        {
            DataTable MyTableee = new DataTable();
            SqlConnection Sqlconnection = new SqlConnection(MyConnection());
            SqlDataAdapter myada = new SqlDataAdapter("select * from Orders where OrderID=@OID", Sqlconnection);
            myada.SelectCommand.Parameters.AddWithValue("@OID", txtOrderID.Text);
            myada.Fill(MyTableee);


            if (MyTableee != null && MyTableee.Rows.Count > 0)
                return true;
            else
                return false;
        }
        private void LoadOrder()
        {
            DataTable MT = new DataTable();

            SqlConnection MyCon = new SqlConnection(MyConnection());
            SqlDataAdapter MA = new SqlDataAdapter("Select * from Orders", MyCon);
            MA.Fill(MT);

            GridView1.DataSource = MT;
            GridView1.DataBind();

            if(MT.Rows.Count==0)
            {
                txtError.Text = "No Record Found";
            }

        }
    }
}