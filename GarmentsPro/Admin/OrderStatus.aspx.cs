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
    public partial class OrderStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadOrder();
            LoadYarnHistory();
        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
        private void LoadOrder()
        {
            DataTable MyTable = new DataTable();
            string MYQ = "select OrderID, DepName as Current_Department, c.Status  from OrderStatus a join Departments b on a.Current_Department=b.DepID " +
                            "join Status C ON a.Status = c.ID where OrderID = @ID";

            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter(MYQ, Sqlconnection);

                myada.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                myada.Fill(MyTable);
            }
            //GvCutDep.DataSource = MyTable;
            //GvCutDep.DataBind();


            if (MyTable.Rows.Count < 0)
            {
                //txtError.Text = "No Record Found";
            }

        }
        private void LoadYarnHistory()
        {
            DataTable MyTable = new DataTable();
            string MYQ =" select a.ID ,OrderID, c.DepName as Current_Department, b.Status ,Remarks , Created_Date from OrderHistory a join"+
                          " Status b on a.Status = b.ID  join Departments c on c.DepID = a.Current_Department  where OrderID =@ID order by a.ID DESC";
             
            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter(MYQ, Sqlconnection);

                myada.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                myada.Fill(MyTable);
            }
            GridView1.DataSource = MyTable;
            GridView1.DataBind();


            if (MyTable.Rows.Count < 0)
            {
                //txtError.Text = "No Record Found";
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadYarnHistory();
        }
    }
}