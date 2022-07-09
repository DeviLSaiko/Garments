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
                LoadGrid();
            }
        }

        private void LoadGrid()
        {
            DataTable MyTable = new DataTable();

            using (SqlConnection Sqlconnection = new SqlConnection(Con))
            {
                string MyQ = "select a.OID, OrderID ,ClientName , OrderType , Qty ,ETA_Time  as Deadline, Created_Date, Status, Yarn_Formation from Orders a join Status b on a.OrderID = b.OID";

                SqlDataAdapter myada = new SqlDataAdapter(MyQ, Sqlconnection);
                myada.Fill(MyTable);
            }

            GridView1.DataSource = MyTable;
            GridView1.DataBind();

            if (MyTable.Rows.Count == 0)
            {
                txtError.Text = "No Orders Found Please Wait....";
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(Con);

            string MyQ = "select a.OID, OrderID ,ClientName , OrderType , Qty ,ETA_Time  as Deadline, Created_Date, Status, Yarn_Formation from Orders a join Status b on a.OrderID = b.OID";

            SqlDataAdapter myada = new SqlDataAdapter(MyQ, Sqlconnection);
            myada.Fill(MyTable);




            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnst = e.Row.Cells[6].FindControl("btnstart") as Button;
                Button btnupdate = e.Row.Cells[7].FindControl("btnhold") as Button;
                Button btnDel = e.Row.Cells[8].FindControl("btnfinish") as Button;

                string Col_Status = e.Row.Cells[5].Text;

                if (Col_Status == "In Progress")
                {
                    btnst.Text = "In Progress";
                }
              else if(Col_Status== "on Hold")
                {
                    btnupdate.Text = "on Hold";
                }
            }
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvRow = GridView1.Rows[index];
            SqlConnection Sqlconnection = new SqlConnection(Con);

            Button btnstart = (gvRow.Cells[5].FindControl("btnstart") as Button);
            Button btnhold = (gvRow.Cells[6].FindControl("btnhold") as Button);
            Button btnFinish = (gvRow.Cells[7].FindControl("btnfinish") as Button);

            switch (e.CommandName)
            {
                case "Start":

                    btnstart.Text = "In progress";
                    btnstart.CssClass = "text-success";
                    btnhold.Text = "Hold";
                    btnhold.CssClass = "btn btn-warning btn-sm";
                    btnFinish.Visible = true;

                    string MyQa = "update Status  set Yarn_Formation=@YP where OID=@OID";
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
                    btnhold.CssClass = "text-danger";
                    btnstart.Text = "Start";
                    btnstart.CssClass = "none";
                    btnstart.CssClass = "btn btn-success btn-sm";

                    btnFinish.Visible = false;

                    string MysQ = "update Status  set Yarn_Formation=@YP where OID=@OID";
                    SqlCommand MyCmds = new SqlCommand(MysQ, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmds.Parameters.AddWithValue("@OID", gvRow.Cells[1].Text);
                    MyCmds.Parameters.AddWithValue("@YP", "on Hold");
                    MyCmds.ExecuteNonQuery();
                    Sqlconnection.Close();
                    break;

                case "Finish":
                    gvRow.Visible = false;

                    string MysQ1 = "Update Orders set Status=@YP where OrderID=@OID";
                    SqlCommand MyCmdss = new SqlCommand(MysQ1, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmdss.Parameters.AddWithValue("@OID", gvRow.Cells[1].Text);
                    MyCmdss.Parameters.AddWithValue("@YP", "Completed");

                    MyCmdss.ExecuteNonQuery();

                    string MyQ = "Delete from Status where OID=@ID";
                    SqlCommand MyCmdDSS = new SqlCommand(MyQ, Sqlconnection);
                    MyCmdDSS.Parameters.AddWithValue("@ID", gvRow.Cells[1].Text);
                    MyCmdDSS.ExecuteNonQuery();

                    Sqlconnection.Close();

                    break;

            }
            LoadGrid();
        }


    }
}










