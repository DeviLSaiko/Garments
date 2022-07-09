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

       

        //public static class Authentication
        //{
        //    static void SignIn( HttpContextBase context,string emailAddress,bool rememberMe, LoggedInUser user != null)
        //    {
        //        var cookie = FormsAuthentication.GetAuthCookie(
        //            emailAddress.ToLower(),
        //            rememberMe);


        //        var oldTicket = FormsAuthentication.Decrypt(cookie.Value);
        //        var newTicket = new FormsAuthenticationTicket(
        //            oldTicket.Version,
        //            oldTicket.Name,
        //            oldTicket.IssueDate,
        //            oldTicket.Expiration,
        //            oldTicket.IsPersistent,
        //            JsonConvert.SerializeObject(user ?? new LoggedInUser()));

        //        cookie.Value = FormsAuthentication.Encrypt(newTicket);

        //        context.Response.Cookies.Add(cookie);
        //    }

        //    static void SignOut(HttpContextBase context)
        //    {
        //        FormsAuthentication.SignOut();
        //    }

        //    static LoggedInUser GetLoggedInUser()
        //    {
        //        if (HttpContext.Current.User?.Identity?.Name != null) ;

        //        return new LoggedInUser();
        //    }
        //}



        //if (HttpContext.Current.User?.Identity?.Name != null && HttpContext.Current.User?.Identity is FormsIdentity identity)
        //           return JsonConvert.DeserializeObject<LoggedInUser>(identity.Ticket.UserData);




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

                    Session["Department"] = dr["Department"].ToString();
                    Session["Password"] = dr["Password"].ToString();
                    Session["UserName"] = dr["UserName"].ToString();

                    string Dep = dr["Department"].ToString();
                    string Pass = dr["Password"].ToString();
                    string User = dr["UserName"].ToString();



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
                }
            }
            else
            {

                lblError.Text = "Login Error !! ";

                txtUserName.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtUserName.Focus();
            }
        }
    }
}


