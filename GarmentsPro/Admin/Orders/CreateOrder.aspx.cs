using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace GarmentsPro.Admin.Orders
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
            SqlDataAdapter MA = new SqlDataAdapter("Select top (10) * from Orders ORDER BY OId DESC", MyCon);
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
            //trim date   (select replace(convert(varchar, OrderID, 101), '/', '') + replace(convert(varchar,OrderID, 108), ':', '') )

            bool CheakExist1 = CheckExist();

            if (CheakExist1 == false)
            {
                SqlConnection MyCon = new SqlConnection(MyConnection());
                MyCon.Open();


                //DateTime back = DateTime.ParseExact("yyyy-MM-dd", row.Cells[9].Value, );

                // "Select replace(convert(varchar, txtOrderID.Text, 101), '/', '') +replace(convert(varchar, txtOrderID.Text, 108), ':', '') )";


                SqlCommand MyCmd = new SqlCommand("Insert into Orders (OrderID,ClientName,OrderType,Qty,ETA_Time,Status)"+
                    "values (  'ORD' + (select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108),':','')),@CN,@OType,@Qty,@ETA,@Stat)", MyCon);


                MyCmd.Parameters.AddWithValue("@CN", txtClinet.Text);
                MyCmd.Parameters.AddWithValue("@OType", ddType.SelectedValue);
                MyCmd.Parameters.AddWithValue("@Qty", txtQty.Text);
                MyCmd.Parameters.AddWithValue("@ETA", txtETA.Text);
                MyCmd.Parameters.AddWithValue("@Stat", DdStatus.SelectedValue);

                MyCmd.ExecuteNonQuery();

                string mYq = "Insert into Status ( OID ,Yarn_Formation , Fabric_Formation , Wet_Processing ,  Fabrication  , Finished_Goods  )"+
                   " values (  'ORD' + (select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  )  , @YF ,@FF ,@WP,@F,@FG)";
                SqlCommand MyCmd1 = new SqlCommand(mYq, MyCon);

                
                MyCmd1.Parameters.AddWithValue("@YF", "Yet To Start");
                MyCmd1.Parameters.AddWithValue("@FF", "Yet To Start");
                MyCmd1.Parameters.AddWithValue("@WP", "Yet To Start");
                MyCmd1.Parameters.AddWithValue("@F", "Yet To Start");
                MyCmd1.Parameters.AddWithValue("@FG", "Yet To Start");
                MyCmd1.ExecuteNonQuery();



                string mYqa = "Insert into OrderStatus ( OID ,Yarn_Formation , Fabric_Formation , Wet_Processing ,  Fabrication  , Finished_Goods  )" +
                  " values (  'ORD' + (select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  )  , @YF ,@FF ,@WP,@F,@FG)";
                SqlCommand MyCmd1a = new SqlCommand(mYqa, MyCon);


                MyCmd1a.Parameters.AddWithValue("@YF", "Yet To Start");
                MyCmd1a.Parameters.AddWithValue("@FF", "Yet To Start");
                MyCmd1a.Parameters.AddWithValue("@WP", "Yet To Start");
                MyCmd1a.Parameters.AddWithValue("@F", "Yet To Start");
                MyCmd1a.Parameters.AddWithValue("@FG", "Yet To Start");
                MyCmd1a.ExecuteNonQuery();


                //For Histry Table
                SqlCommand MyCmdHis = new SqlCommand("Insert into History (OrderID,ClientName,OrderType,Qty,ETA_Time,Status)"+
                    "values (  'ORD' + (select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  )   ,@CN,@OType,@Qty,@ETA,@Stat)", MyCon);


                MyCmdHis.Parameters.AddWithValue("@CN", txtClinet.Text);
                MyCmdHis.Parameters.AddWithValue("@OType", ddType.SelectedValue);
                MyCmdHis.Parameters.AddWithValue("@Qty", txtQty.Text);
                MyCmdHis.Parameters.AddWithValue("@ETA", txtETA.Text);
                MyCmdHis.Parameters.AddWithValue("@Stat", DdStatus.SelectedValue);

                MyCmdHis.ExecuteNonQuery();

                MyCon.Close();

                Response.Redirect("/admin/Orders/Orders.aspx");

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

    }
}