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
            LoadHistory();
        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
        private void LoadOrder()
        {
            DataTable MyTable = new DataTable();
            string MYQ = "select OrderID,  Current_Department, Status  from OrderStatus where OrderID=@ID";
      
            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter(MYQ, Sqlconnection);

                myada.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                myada.Fill(MyTable);
            }
            GvCutDep.DataSource = MyTable;
            GvCutDep.DataBind();


            if (MyTable.Rows.Count < 0)
            {
                //txtError.Text = "No Record Found";
            }

        }

        private void LoadHistory()
        {
            DataTable MyTable = new DataTable();
            string MYQ = "select OrderID, Current_Department, Status ,Remarks , Created_Date from OrderHistory where OrderID=@ID";

            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter(MYQ, Sqlconnection);

                myada.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                myada.Fill(MyTable);
            }
            gvHistry.DataSource = MyTable;
            gvHistry.DataBind();


            if (MyTable.Rows.Count < 0)
            {
                //txtError.Text = "No Record Found";
            }

        }
    }
}