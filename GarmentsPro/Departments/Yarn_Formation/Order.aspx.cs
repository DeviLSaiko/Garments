using System;
using System.Data;
using System.Data.SqlClient;
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
                string MyQ = " Select a.OrderID,ClientName,OrderType,Qty,Eta_Time as Deadline,b.Status as Status,b.Current_Department from Orders a join " +
                    " OrderStatus b on a.OrderID = b.OrderID   where b.Status != '4' and b.Status != '5' and b.Current_Department = '1'";

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

            string MyQ = " Select a.OrderID , ClientName , OrderType , Qty ,Eta_Time as Deadline , b.Status as Status  , b.Current_Department from Orders a join "+
                "OrderStatus b on a.OrderID = b.OrderID   where b.Status != '4' and b.Status != '5' and b.Current_Department = '1'";

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
                    btnst.CssClass = "text-success btn disabled fw-bold  ";
                    btnupdate.CssClass = "btn btn-warning btn-sm";
                }
                else if (Col_Status == "3")
                {
                    btnupdate.Text = "on Hold";
                    btnupdate.CssClass = "text-danger btn disabled fw-bold  ";
                    btnDel.CssClass = "text-dark  btn disabled fw-bold  ";
                }
                else if (Col_Status == "1")
                {
                    
                    btnDel.CssClass = "text-dark   btn disabled fw-bold  ";

                    btnupdate.Text = "on Hold";
                    btnupdate.CssClass = "text-dark  btn disabled fw-bold  ";
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
                    btnhold.Text = "Hold";
                    btnhold.CssClass = "btn btn-warning";
                    btnFinish.Visible = true;

                    string MyQa = "Update OrderStatus SET Status=@Status where OrderID=@ID ";
                    SqlCommand MyCmd = new SqlCommand(MyQa, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmd.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmd.Parameters.AddWithValue("@Status", "2");
                    MyCmd.ExecuteNonQuery();


                    string MyQas = "Update Orders  SET Status=@Status where OrderID=@ID ";
                    SqlCommand MyCmdcv = new SqlCommand(MyQas, Sqlconnection);

                    MyCmdcv.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmdcv.Parameters.AddWithValue("@Status", "2");
                    MyCmdcv.ExecuteNonQuery();

                    SqlCommand MyCmdda = new SqlCommand("InsertOrderHistory", Sqlconnection);
                    MyCmdda.CommandType = CommandType.StoredProcedure;

                    MyCmdda.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmdda.Parameters.AddWithValue("@CD", "1");
                    MyCmdda.Parameters.AddWithValue("@St", "2");
                    MyCmdda.Parameters.AddWithValue("@Re", "-");
                    MyCmdda.ExecuteNonQuery();


                    string MyQaz = "Update OrderStatus SET Status=@Status where OrderID=@ID ";
                    SqlCommand MyCmdz = new SqlCommand(MyQaz, Sqlconnection);

                    MyCmdz.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmdz.Parameters.AddWithValue("@Status", "2");
                    MyCmdz.ExecuteNonQuery();
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

                    SqlCommand MyCmddxa = new SqlCommand("InsertOrderHistory", Sqlconnection);
                    MyCmddxa.CommandType = CommandType.StoredProcedure;

                    MyCmddxa.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCmddxa.Parameters.AddWithValue("@CD", "1");
                    MyCmddxa.Parameters.AddWithValue("@St", "3");
                    MyCmddxa.Parameters.AddWithValue("@Re", "Not Enogh Stocks");
                    MyCmddxa.ExecuteNonQuery();
                    Sqlconnection.Close();

                    break;

                case "Finish":

                    gvRow.Visible = false;

                    SqlCommand Cmd11 = new SqlCommand("UpdateOrderStatus", Sqlconnection);
                    Cmd11.CommandType = CommandType.StoredProcedure;

                    Sqlconnection.Open();
                    Cmd11.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    Cmd11.Parameters.AddWithValue("@St", "1");
                    Cmd11.Parameters.AddWithValue("@CD", "2");
                    Cmd11.ExecuteNonQuery();

                    SqlCommand MyCcmddxa = new SqlCommand("InsertOrderHistory", Sqlconnection);
                    MyCcmddxa.CommandType = CommandType.StoredProcedure;
                    MyCcmddxa.Parameters.AddWithValue("@ID", gvRow.Cells[0].Text);
                    MyCcmddxa.Parameters.AddWithValue("@CD", "1");
                    MyCcmddxa.Parameters.AddWithValue("@St", "4");
                    MyCcmddxa.Parameters.AddWithValue("@Re", "-");
                    MyCcmddxa.ExecuteNonQuery();
                    Sqlconnection.Close();
                    break;
            }
            LoadGrid();
        }
    }
}