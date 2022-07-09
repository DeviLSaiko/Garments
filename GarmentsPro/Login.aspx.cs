using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarmentsPro
{
    public partial class Login : System.Web.UI.Page
    {
        String MyCon = @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security =SSPI ";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlConnection Sqlconnection = new SqlConnection(MyCon);

            Sqlconnection.Open();
            SqlCommand cmd = new SqlCommand("SELECT UserName , Password , Department from UserInfo  where UserName=@UserName and Password=@Password", Sqlconnection);
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    //Session["Department"] = dr["Department"].ToString();
                    //Session["Password"] = dr["Password"].ToString();
                    //Session["UserName"] = dr["UserName"].ToString();

                    string Dep = dr.GetValue(2).ToString();
                    string Pass = dr.GetValue(1).ToString();
                    string User = dr.GetValue(0).ToString();



                    if (Dep == "Yarn Formation" && User == "@UserName" && Pass == "@Password")
                    {
                        Response.Redirect("~/Departments/Yarn_Formation/Dashboard.aspx");
                    }
                    else if (Dep == "Fabric Formation" && User == "@UserName" && Pass == "@Password")
                    {
                        Response.Redirect("~/Departments/Fabric_Formation/Dashboard.aspx");
                    }
                    else if (Dep == "Wet Processing" && User == "@UserName" && Pass == "@Password")
                    {
                        Response.Redirect("~/Departments/Wet_Processing/Dashboard.aspx");
                    }
                    else if (Dep == "Fabrication" && User == "@UserName" && Pass == "@Password")
                    {
                        Response.Redirect("~/Departments/Fabrication/Dashboard.aspx");
                    }
                    else if (Dep == "Finished Goods" && User == "@UserName" && Pass == "@Password")
                    {
                        Response.Redirect("~/Departments/Finished_Goods/Dashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Login Error !! ";
                    }
                }
            }
            else
            {


                txtUserName.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtUserName.Focus();
            }
        }
    }
}


