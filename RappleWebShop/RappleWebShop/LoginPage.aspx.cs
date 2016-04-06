using System;
using System.Collections.Generic;
using System.Web.Security;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Request.Cookies.Clear();
            Session.Abandon();
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            LoginHandler loginHandler = new LoginHandler();
            if (loginHandler.Login(userEmail.Text, userPassword.Text))
            {
                FormsAuthentication.SetAuthCookie(userEmail.Text, false);
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblWrongInput.Visible = true;
            }
        }
    }
}