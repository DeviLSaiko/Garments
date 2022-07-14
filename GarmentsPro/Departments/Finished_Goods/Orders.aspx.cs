using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Garments_Pro.Departments.Finished_Goods
{
    public partial class Orders : System.Web.UI.Page
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
                string MyQ = " Select a.OrderID , ClientName , OrderType , Qty ,Eta_Time as Deadline , b.Status as Status  , b.Current_Department from Orders a join " +
              "OrderStatus b on a.OrderID = b.OrderID where b.Status != '4' and b.Status != '5' and b.Current_Department = '5'";

                SqlDataAdapter myada = new SqlDataAdapter(MyQ, Sqlconnection);
                myada.Fill(MyTable);
            }

            GridView1.DataSource = MyTable;
            GridView1.DataBind();

            if (MyTable.Rows.Count == 0)
            {
                txtError.Text = "No Orders Found ....";
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(Con);
            string MyQ = " Select a.OrderID , ClientName , OrderType , Qty ,Eta_Time as Deadline , b.Status as Status  , b.Current_Department from Orders a join " +
              "OrderStatus b on a.OrderID = b.OrderID where b.Status != '4' and b.Status != '5' and b.Current_Department = '5'";

            // string MyQ = "  Select a.OrderID , ClientName , OrderType , Qty ,Eta_Time as Deadline , b.Status as Status  , b.Current_Department from Orders a join OrderStatus b on a.OrderID = b.OrderID join OrderHistory c on a.OrderID = c.OrderID  where b.Status = '4' and b.Current_Department = '2' ";

            SqlDataAdapter myada = new SqlDataAdapter(MyQ, Sqlconnection);
            myada.Fill(MyTable);

            // e.Row.Cells[4].Visible = false;


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnst = e.Row.Cells[5].FindControl("btnstart") as Button;
                Button btnupdate = e.Row.Cells[6].FindControl("btnhold") as Button;
                Button btnDel = e.Row.Cells[7].FindControl("btnfinish") as Button;

                string Col_Status = e.Row.Cells[4].Text;

                if (Col_Status == "2")
                {
                    btnst.Text = "In Progress";
                    btnst.CssClass = "text-success btn";
                }
                else if (Col_Status == "3")
                {
                    btnupdate.Text = "on Hold";
                    btnupdate.CssClass = "text-danger btn";
                }
                else
                {
                    e.Row.Cells[7].FindControl("btnfinish").Visible = false;
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
                    btnstart.CssClass = "text-success btn ";
                    btnhold.Text = "Hold";
                    btnhold.CssClass = "disabled ";
                    btnFinish.Visible = true;


                    string MyQa = "Update OrderStatus SET Status=@Status where OrderID=@ID ";
                    SqlCommand MyCmd = new SqlCommand(MyQa, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmd.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmd.Parameters.AddWithValue("@Status", "2");
                    MyCmd.ExecuteNonQuery();
                    Sqlconnection.Close();


                    string MyQIn = "insert into OrderHistory (OrderID,Current_Department,Status,Remarks) Values (@ID,@CurntDep,@Status,@Remarks)";
                    SqlCommand MyCmdda = new SqlCommand(MyQIn, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmdda.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmdda.Parameters.AddWithValue("@CurntDep", "2");
                    MyCmdda.Parameters.AddWithValue("@Status", "2");
                    MyCmdda.Parameters.AddWithValue("@Remarks", "-");
                    MyCmdda.ExecuteNonQuery();
                    Sqlconnection.Close();



                    break;

                case "Hold":
                    btnhold.Text = "on Hold";
                    btnhold.CssClass = "text-danger btn";
                    btnstart.Text = "Start";
                    btnstart.CssClass = "none";
                    btnstart.CssClass = "btn btn-success btn-sm";

                    btnFinish.Visible = false;

                    string MysQ = "Update OrderStatus SET Status=@Status where OrderID=@ID";
                    SqlCommand MyCmds = new SqlCommand(MysQ, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmds.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmds.Parameters.AddWithValue("@Status", "3");
                    MyCmds.ExecuteNonQuery();

                    string MyQInz = "insert into OrderHistory ( OrderID, Current_Department , Status , Remarks) values (@ID,@CD,@St,@Re)  ";
                    SqlCommand MyCmddxa = new SqlCommand(MyQInz, Sqlconnection);

                    MyCmddxa.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmddxa.Parameters.AddWithValue("@CD", "2");
                    MyCmddxa.Parameters.AddWithValue("@St", "3");
                    MyCmddxa.Parameters.AddWithValue("@Re", "Not Enogh Stocks");
                    MyCmddxa.ExecuteNonQuery();
                    Sqlconnection.Close();


                    break;

                case "Finish":

                    gvRow.Visible = false;

                    string MYQF = "Update OrderStatus SET Status=@Status ,Current_Department=@CD  where OrderID=@ID";

                    SqlCommand Cmd11 = new SqlCommand(MYQF, Sqlconnection);
                    Sqlconnection.Open();
                    Cmd11.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    Cmd11.Parameters.AddWithValue("@Status", "4");
                    Cmd11.Parameters.AddWithValue("@CD", "2");
                    Cmd11.ExecuteNonQuery();


                    string MYQFc = "Update Orders  SET Status=@Status where OrderID=@ID";

                    SqlCommand Cmd11c = new SqlCommand(MYQFc, Sqlconnection);
                    
                    Cmd11c.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    Cmd11c.Parameters.AddWithValue("@Status", "4");
                    Cmd11c.ExecuteNonQuery();

                    string MyQIndz = "insert into OrderHistory ( OrderID, Current_Department , Status , Remarks) values (@ID,@CD,@St,@Re)";
                    SqlCommand MyCcmddxa = new SqlCommand(MyQIndz, Sqlconnection);

                    MyCcmddxa.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCcmddxa.Parameters.AddWithValue("@CD", "4");
                    MyCcmddxa.Parameters.AddWithValue("@St", "1");
                    MyCcmddxa.Parameters.AddWithValue("@Re", "-");
                    MyCcmddxa.ExecuteNonQuery();

                    Sqlconnection.Close();

                    break;

            }
            LoadGrid();
        }
    }
}
