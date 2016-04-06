using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class Rapple : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogOut(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/LoginPage.aspx");
        }

        public void AddToSession(object sender, CommandEventArgs e)
        {
            var cartControl = (Control)sender;
            var cartLvi = (ListViewItem)cartControl.NamingContainer;
            var tboQuantity = (TextBox)cartLvi.FindControl("tboQuantity");

            var quantityValue = Convert.ToInt32(tboQuantity.Text);

            int productId;
            var parsedId = Int32.TryParse(e.CommandArgument.ToString(), out productId);
            if (!parsedId) return;

            var dHandler = new DataHandler();

            var product = dHandler.GetProduct(productId);

            var shoppingCart = (ShoppingCart)Session["cart"];

            if (shoppingCart == null)
            {
                shoppingCart = new ShoppingCart()
                {
                    Products = new List<ShoppingCartItem>()
                };
                shoppingCart.Products.Add(new ShoppingCartItem() { Product = product, Quantity = quantityValue });

                Session["cart"] = shoppingCart;
                return;
            }

            var list = shoppingCart.Products.Where(x => x.Product.ID == productId).ToList();

            if (!list.Any())
            {
                if (product != null)
                {
                    shoppingCart.Products.Add(new ShoppingCartItem() { Product = product, Quantity = quantityValue });
                }
            }
            else
            {
                list.First().Quantity += quantityValue;
            }
            Session["cart"] = shoppingCart;

        }
    }
}