using System;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var dHandler = new DataHandler();
            if (dHandler.RegisterUser(new User
            {
                Age = Convert.ToInt32(newUserAge.Text),
                Email = newUserEmail.Text,
                FirstName = newUserFirstName.Text,
                LastName = newUserLastName.Text,
                Password = newUserPassword1.Text,
                WantsOffers = chbOffer.Checked,
            }))
            {
                Response.Redirect("~/LoginPage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registration could not be executed!');</script>");
                return;
            }


        }

        protected void ValidateEmail(object source, ServerValidateEventArgs args)
        {
            using (var context = new RappleContext())
            {
                args.IsValid = !context.Users.Any(x => x.Email == newUserEmail.Text);
            }
        }
    }
}