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
    public partial class EditAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                LoadUsers();
                if (!IsPostBack)
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

            }

        }

        protected void BtnDel_Click1(object sender, EventArgs e)
        {

            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                Sqlconnection.Open();

                string MyQ = "Delete from UserInfo where UID=@ID";
                SqlCommand MyCmd = new SqlCommand(MyQ, Sqlconnection);
                MyCmd.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                MyCmd.ExecuteNonQuery();

                Sqlconnection.Close();

                Response.Redirect("~/Admin/UsersList.aspx");

            }



            LoadUsers();


        }
        private string MyConnection()
        {
            return @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security = SSPI ";
        }
        private void LoadUsers()
        {
            DataTable MyTable = new DataTable();


            string MYQ = "Select UID ,Name , UserName , Password ,  Department from UserInfo where UID=@ID";
            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter(MYQ, Sqlconnection);

                myada.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                myada.Fill(MyTable);
            }
            GridView1.DataSource = MyTable;
            GridView1.DataBind();


            txtName.Text = MyTable.Rows[0]["Name"].ToString();
            txtUserName.Text = MyTable.Rows[0]["UserName"].ToString();
            txtPassword.Text = MyTable.Rows[0]["Password"].ToString();

        }
        private void LoadUsersUpdate()
        {
            DataTable MyTable = new DataTable();


            string MYQ = "Select UID ,Name , UserName , Password ,   Department from UserInfo   where UID=@ID";
            using (SqlConnection Sqlconnection = new SqlConnection(MyConnection()))
            {
                SqlDataAdapter myada = new SqlDataAdapter(MYQ, Sqlconnection);
                myada.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);

                myada.Fill(MyTable);
            }
            GridView1.DataSource = MyTable;
            GridView1.DataBind();

            if (MyTable.Rows.Count > 0)
            {


            }
        }


        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlConnection MyCon = new SqlConnection(MyConnection());
            string MyInsQ = "Update UserInfo set Name=@NA ,Username=@UN,Password=@P, Department=@D where UID=@ID";
            SqlCommand MyCmd = new SqlCommand(MyInsQ, MyCon);

            MyCon.Open();
            MyCmd.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
            MyCmd.Parameters.AddWithValue("@NA", txtName.Text);
            MyCmd.Parameters.AddWithValue("@UN", txtUserName.Text);
            MyCmd.Parameters.AddWithValue("@P", txtPassword.Text);
            MyCmd.Parameters.AddWithValue("@D", ddDepartments.Text);

            MyCmd.ExecuteNonQuery();
            LoadUsers();
            MyCon.Close();
        }

    }
}