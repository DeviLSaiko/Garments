using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garments_Pro.Yarn_Formation
{
    public partial class Order : BasePage
    {
        string Con = @"Data Source=.;Initial Catalog=GarmentsPro;Integrated Security=SSPI";
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!IsPostBack)
            {
                loadgrid();
            }

        }

        private void loadgrid()
        {


            DataTable MyTable = new DataTable();

            using (SqlConnection Sqlconnection = new SqlConnection(Con))
            {
                SqlDataAdapter myada = new SqlDataAdapter("select OID, OrderID ,ClientName , OrderType , Qty ,  CONVERT(VARCHAR(20), ETA_Time, 110) as DeadLine , Created_Date, Status from Orders", Sqlconnection);
                myada.Fill(MyTable);
            }

            GridView1.DataSource = MyTable;
            GridView1.DataBind();
        }

        protected void btnHold_Click(object sender, EventArgs e)
        {


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }


        protected void btnStart_Click(object sender, EventArgs e)
        {
            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    if (row.RowType == DataControlRowType.DataRow)
            //    {
            //        Button btnStart = (row.Cells[4].FindControl("btnStart") as Button);
            //        if (Convert.ToBoolean(btnStart.OnClientClick) == true)
            //        {
            //            using (SqlConnection Sqlconnection = new SqlConnection(Con))
            //            {
            //                Sqlconnection.Open();

            //                string MyQ = "Update Status set Yarn_Formation=@YP where StaID=@ID";
            //                SqlCommand MyCmd = new SqlCommand(MyQ, Sqlconnection);
            //                MyCmd.Parameters.AddWithValue("@YP", "In Progress") ;
            //                MyCmd.Parameters.AddWithValue("@ID", row.Cells[0].Text);
            //                //MyCmd.ExecuteNonQuery();

            //                Sqlconnection.Close();


            //            }
            //        }
            //    }
            //}
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Label lblstatus = 
            switch (e.CommandName)
            {

                case "Start":

                   



                    break;

                case "Hold":

                    break;

                case "Finish":

                    break;

            }












            if (e.CommandName == "Start")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = GridView1.Rows[rowIndex];

                //Fetch value of Name.
                string name = (row.FindControl("txtName") as TextBox).Text;

                //Fetch value of Country
                string country = row.Cells[1].Text;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + name + "\\nCountry: " + country + "');", true);
            }






        }
    }
}










