using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        String MyCon = @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security =SSPI ";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Remove("UserName");
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlConnection Sqlconnection = new SqlConnection(MyCon);

            SqlCommand cmd = new SqlCommand("SELECT UserName , Password from Admin  where UserName=@UserName and Password=@Password", Sqlconnection);
            Sqlconnection.Open();
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["UserName"] = dr.GetValue(0).ToString();

                    Response.Write("<Script>alert('Login Success');</script>");
                    Response.Redirect("~/Admin/Dashboard.aspx");
                }
            }
            else
            {
                Response.Write("<Script>alert('Login Failed');</script>");
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}
