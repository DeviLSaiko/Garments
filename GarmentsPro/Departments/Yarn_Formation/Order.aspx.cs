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
    public partial class Order : Page
    {
        string Con = @"Data Source=.;Initial Catalog=GarmentsPro;Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
             

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
            /* Label lblstatus = Label*/   /*FindControl("ChkRow") as CheckBox);*/
            foreach (GridViewRow row in GridView1.Rows)
            {
                string btnstart = (row.FindControl("lblStatus") as Label).Text;
                switch (e.CommandName)
                {

                    case "Start":

                        int index;
                        bool bIsConverted = int.TryParse(e.CommandArgument.ToString(), out index);
                        string btns  = (row.FindControl("lblStatus") as Label).Text;
                        //int rowIndex = Convert.ToInt32(e.CommandArgument);
                      

                        btns = (row.Cells[5].FindControl("lblStatus") as Label).Text = "In progress";
                        //btns = (row.Cells[5].FindControl("lblStatus") as Label).CssClass = ("Color" "Danger");







                        break;

                    case "Hold":

                        break;

                    case "Finish":

                        break;

                }

            }


            if (e.CommandName == "Start")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                

                //Reference the GridView Row.
               

                //Fetch value of Name.
                

                //Fetch value of Country
                
            }






        }
    }
}










