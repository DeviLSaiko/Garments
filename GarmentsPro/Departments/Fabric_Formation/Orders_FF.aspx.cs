using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garments_Pro.Departments.Fabric_Formation
{
    public partial class Orders_FF : System.Web.UI.Page
    {
        string Con = @"Data Source=.;Initial Catalog=GarmentsPro;Integrated Security=SSPI";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }
        }
        private void LoadGrid()
        {
            DataTable MyTable = new DataTable();

            using (SqlConnection Sqlconnection = new SqlConnection(Con))
            {
                string MyQ = "select a.OID, OrderID ,ClientName , OrderType , Qty , CONVERT(VARCHAR(20)," +
                                     "ETA_Time, 110) as Deadline, Created_Date, Status, Fabric_Formation from Orders a join Status b on a.OrderID = b.OID";

                SqlDataAdapter myada = new SqlDataAdapter(MyQ, Sqlconnection);
                myada.Fill(MyTable);
            }

            GridView2.DataSource = MyTable;
            GridView2.DataBind();
        }

        private void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvRow = GridView2.Rows[index];
            SqlConnection Sqlconnection = new SqlConnection(Con);

            Button btnstart = (gvRow.Cells[5].FindControl("btnstart") as Button);
            Button btnhold = (gvRow.Cells[6].FindControl("btnhold") as Button);
            Button btnFinish = (gvRow.Cells[7].FindControl("btnfinish") as Button);


            //DataTable MyTable = new DataTable();


            //    string MyQ = "select a.OID, OrderID ,ClientName , OrderType , Qty , CONVERT(VARCHAR(20)," +
            //                         "ETA_Time, 110) as Deadline, Created_Date, Status, Yarn_Formation from Orders a join Status b on a.OrderID = b.OID";

            //    SqlDataAdapter myada = new SqlDataAdapter(MyQ, Sqlconnection);
            //    myada.Fill(MyTable);


            //GridView1.DataSource = MyTable;
            //GridView1.DataBind();



            //Label lblParentID = (Label)GridView1.Rows[].FindControl("lblParentID");


            switch (e.CommandName)
            {

                case "Start":
                    btnstart.Text = "In progress";
                    btnhold.Text = "Hold";
                    btnFinish.Visible = true;

                    string MyQa = "update Status  set Fabric_Formation=@YP where OID=@OID";
                    SqlCommand MyCmd = new SqlCommand(MyQa, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmd.Parameters.AddWithValue("@OID", gvRow.Cells[1].Text);
                    MyCmd.Parameters.AddWithValue("@YP", "In Progress");
                    MyCmd.ExecuteNonQuery();
                    Sqlconnection.Close();
                    //btns = (row.Cells[5].FindControl("lblStatus") as Label).Text = "In progress";
                    //btns = (row.Cells[5].FindControl("lblStatus") as Label).CssClass = ("Color" "Danger");
                    break;

                case "Hold":

                    btnhold.Text = "on Hold";

                    btnstart.Text = "Start";
                    btnFinish.Visible = false;

                    string MysQ = "update Status  set Fabric_Formation=@YP where OID=@OID";
                    SqlCommand MyCmds = new SqlCommand(MysQ, Sqlconnection);

                    Sqlconnection.Open();


                    MyCmds.Parameters.AddWithValue("@OID", gvRow.Cells[1].Text);
                    MyCmds.Parameters.AddWithValue("@YP", "on Hold");

                    MyCmds.ExecuteNonQuery();

                    Sqlconnection.Close();

                    break;

                case "Finish":

                    string MysQ1 = "update Status  set Fabric_Formation=@YP where OID=@OID";
                    SqlCommand MyCmdss = new SqlCommand(MysQ1, Sqlconnection);

                    Sqlconnection.Open();


                    MyCmdss.Parameters.AddWithValue("@OID", gvRow.Cells[1].Text);
                    MyCmdss.Parameters.AddWithValue("@YP", "Finish");

                    MyCmdss.ExecuteNonQuery();

                    Sqlconnection.Close();

                    break;

            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}