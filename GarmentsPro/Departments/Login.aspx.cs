using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garments_Pro
{
    public partial class Login : System.Web.UI.Page
    {
        String MyCon = @"Data Source =.; Initial Catalog = GarmentsPro; Integrated Security =SSPI ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable MyTable = new DataTable();

                using (SqlConnection Sqlconnection = new SqlConnection(MyCon))
                {
                    SqlDataAdapter myada = new SqlDataAdapter("select * from Departments ", Sqlconnection);
                    myada.Fill(MyTable);
                }
                ddDepartments.DataTextField = "DepName";
                ddDepartments.DataValueField = "DepName";
                ddDepartments.DataSource = MyTable;
                ddDepartments.DataBind();
            }
            Session.RemoveAll();
            Session.Remove("UserName");
            Session.Remove("UserName");
        }

        private void LoginDetails(string Username, string Password)
        {

            //LoginDetails MyObj = new LoginDetails();

            //MyObj.IsAuthUser = false;

            using (SqlConnection Sqlconnection = new SqlConnection(MyCon))
            {
                SqlDataAdapter myada = new SqlDataAdapter("select * from Departments ", Sqlconnection);
                //myada.Fill(MyTable);
            }

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
            cmd.Parameters.AddWithValue("@Department", ddDepartments.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["Department"] = dr.GetValue(0).ToString();

                    if (ddDepartments.Text == "Fabric Formation")
                    {
                        Response.Redirect("~/Yarn_Formation/Dashboard.aspx");
                    }
                    else if (dr.GetValue(2).ToString() == "Fabric Formation")
                    {
                        Response.Redirect("~/Fabric_Formation/Dashboard.aspx");
                    }
                    else if (dr.GetValue(2).ToString() == "Wet Processing")
                    {
                        Response.Redirect("~/Wet_Processing/Dashboard.aspx");
                    }
                    else if (dr.GetValue(2).ToString() == "Fabrication")
                    {
                        Response.Redirect("~/Fabrication/Dashboard.aspx");
                    }
                    else if (dr.GetValue(2).ToString() == "Finished Goods")
                    {
                        Response.Redirect("~/Finished_Goods/Dashboard.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");

                txtUserName.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtUserName.Focus();
            }
        }
    }
}


