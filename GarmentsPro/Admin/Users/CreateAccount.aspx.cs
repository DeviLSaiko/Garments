using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin.Users
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                LoadDep();
            }
            LoadGrid();
        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlConnection MyCon = new SqlConnection(MyConnection());
            string MyInsQ = "Insert into UserInfo (Name,Username,Password,Department) Values(@NA,@UN,@P,@D)";
            SqlCommand MyCmd = new SqlCommand(MyInsQ, MyCon);

            MyCon.Open();
            MyCmd.Parameters.AddWithValue("@NA", txtName.Text);
            MyCmd.Parameters.AddWithValue("@UN", txtUserName.Text);
            MyCmd.Parameters.AddWithValue("@P", txtPassword.Text);
            MyCmd.Parameters.AddWithValue("@D", ddDepartments.Text);
            MyCmd.ExecuteNonQuery();
            LoadGrid();
            MyCon.Close();

            txtName.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            ddDepartments.Text = "";

        }
        private void LoadDep()
        {
            DataTable MyTable = new DataTable();
            SqlConnection MyCon = new SqlConnection(MyConnection());

            SqlDataAdapter MyAda = new SqlDataAdapter("select * from Departments", MyCon);
            MyAda.Fill(MyTable);

            ddDepartments.DataTextField = "DepName";
            ddDepartments.DataValueField = "DepName";
            ddDepartments.DataSource = MyTable;
            ddDepartments.DataBind();
        }
        private void LoadGrid()
        {
            DataTable MyTable = new DataTable();

            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter("select UID, Name , UserName , Password ,  Department from UserInfo  ", Sqlconnection);
                myada.Fill(MyTable);
            }
            GridView1.DataSource = MyTable;
            GridView1.DataBind();

        }
    }
}


