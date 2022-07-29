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
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string l_Query = "Select OrderID , ClientName , OrderType , b.Status ,Created_Date from Orders a join Status b on a.Status = b.ID";

                LoadOrder(l_Query);
            }

        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }


        private void LoadOrder(string a_Query)
        {
            DataTable MT = new DataTable();

            SqlConnection MyCon = new SqlConnection(MyConnection());
            SqlDataAdapter MA = new SqlDataAdapter(a_Query, MyCon);
            MA.Fill(MT);

            GridView1.DataSource = MT;
            GridView1.DataBind();



            if (MT.Rows.Count < 0)
            {
                txtError.Text = "No Record Found";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string SearchQ = string.Empty;

            if (ddSearch.SelectedValue == "1")
            {
                SearchQ = "Select OrderID , ClientName , OrderType , b.Status ,Created_Date from Orders a join Status b on a.Status = b.ID where ClientName like '%" + txtSearch.Text + "%'";
            }
            else if (ddSearch.SelectedValue == "2")
            {
                SearchQ = "Select OrderID , ClientName , OrderType , b.Status ,Created_Date from Orders a join Status b on a.Status = b.ID where B.Status like '%" + txtSearch.Text + "%'";
            }
            else
            {
                SearchQ = "Select OrderID , ClientName , OrderType , b.Status ,Created_Date from Orders a join Status b on a.Status = b.ID  where  OrderType like '%" + txtSearch.Text + "%'";
            }

            LoadOrder(SearchQ);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            string l_Query = "Select OrderID , ClientName , OrderType , b.Status ,Created_Date from Orders a join Status b on a.Status = b.ID";

            LoadOrder(l_Query);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvRow = GridView1.Rows[index];
            SqlConnection Sqlconnection = new SqlConnection(MyConnection());

            Button btnCancel = (gvRow.Cells[7].FindControl("btnCancel") as Button);

            switch (e.CommandName)
            {
                case "OrderCancel":

                    btnCancel.Text = "Cancelled";
                    btnCancel.CssClass = "text-danger btn-sm btn";
                    

                    string MyQa = "Update Orders SET Status=@Status where OrderID=@ID ";
                    SqlCommand MyCmd = new SqlCommand(MyQa, Sqlconnection);
                    Sqlconnection.Open();
                    MyCmd.Parameters.AddWithValue("@ID", gvRow.Cells[1].Text);
                    MyCmd.Parameters.AddWithValue("@Status", "5");
                    MyCmd.ExecuteNonQuery();


                    string MyQaa = "Update OrderStatus SET Status=@Status where OrderID=@ID ";
                    SqlCommand MyCmda = new SqlCommand(MyQaa, Sqlconnection);

                    MyCmda.Parameters.AddWithValue("@ID", gvRow.Cells[1].Text);
                    MyCmda.Parameters.AddWithValue("@Status", "5");
                    MyCmda.ExecuteNonQuery();

                    string MyQIn = "insert into OrderHistory (OrderID,Current_Department,Status,Remarks) Values (@ID,@CD,@St,@Re)";
                    SqlCommand MyCmdda = new SqlCommand(MyQIn, Sqlconnection);

                    MyCmdda.Parameters.AddWithValue("@ID", gvRow.Cells[1].Text);
                    MyCmdda.Parameters.AddWithValue("@CD", "1");
                    MyCmdda.Parameters.AddWithValue("@St", "5");
                    MyCmdda.Parameters.AddWithValue("@Re", "-");
                    MyCmdda.ExecuteNonQuery();
                    Sqlconnection.Close();

                    break;
            }
            string l_Query = "Select OrderID , ClientName , OrderType , b.Status ,Created_Date from Orders a join Status b on a.Status = b.ID";

            LoadOrder(l_Query);
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             

            DataTable MyTable = new DataTable();

            SqlConnection Sqlconnection = new SqlConnection(MyConnection());

            string MyQ = "Select OrderID , ClientName , OrderType , b.Status ,Created_Date from Orders a join Status b on a.Status = b.ID";

            SqlDataAdapter myada = new SqlDataAdapter(MyQ, Sqlconnection);
            myada.Fill(MyTable);

            // e.Row.Cells[4].Visible = false;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnCancel = e.Row.Cells[5].FindControl("btnCancel") as Button;
                

                string Col_Status = e.Row.Cells[4].Text;

                if (Col_Status == "Cancelled")
                {
                    btnCancel.Text = "Cancelled";
                    btnCancel.CssClass = "text-danger btn btn-sm disabled";

                }
                 
                else if (Col_Status == "Finished")
                {
                    btnCancel.Visible = false;
                }

            }
        }
    }
}