using System;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Web.Security;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            successDiv.Visible = false;

            if (IsPostBack) return;

            var dHandler = new DataHandler();
                
            var currentUser = dHandler.GetUser(User.Identity.Name);
            if (dHandler.GetUser(User.Identity.Name) != null)
            {
                updateUserFirstName.Text = currentUser.FirstName;
                updateUserLastName.Text = currentUser.LastName;
                updateUserAge.Text = currentUser.Age.ToString();
                updateUserEmail.Text = currentUser.Email;
                updateUserPassword.Text = currentUser.Password;
                updateChbOffer.Checked = currentUser.WantsOffers;
            }
            else
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/LoginPage.aspx");
            }
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                Response.Write("<script>alert('Wrong input in: Email');</script>");
                return;
            }
            var dHandler = new DataHandler();
            var currentUser = dHandler.GetUser(User.Identity.Name);

            currentUser.FirstName = updateUserFirstName.Text;
            currentUser.LastName = updateUserLastName.Text;
            currentUser.Age = Convert.ToInt32(updateUserAge.Text);
            currentUser.Email = updateUserEmail.Text;
            currentUser.WantsOffers = updateChbOffer.Checked;

            if (currentUser.Password != tboPasswordCheck.Text)
            {
                Response.Write("<script>alert('Wrong input in: Current Password');</script>");
               return;
            }

            if (!string.IsNullOrEmpty(updateUserPassword.Text))
            {
                currentUser.Password = updateUserPassword.Text;
            }

            if (dHandler.UpdateUser(currentUser))
            {
                successDiv.Visible = true;
            }

            
        }

        protected void ValidateEmail(object source, ServerValidateEventArgs args)
        {
            if (updateUserEmail.Text.ToLower() == User.Identity.Name.ToLower()) return;
            using (var context = new RappleContext())
            {
                args.IsValid = !context.Users.Any(x => x.Email == updateUserEmail.Text);
            }
        }
    }
}