using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class CartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PreRender += OnPreRender;
        }

        private void OnPreRender(object sender, EventArgs e)
        {
            var cartItems = Session["cart"] as ShoppingCart;
            lviCartPage.DataSource = cartItems?.Products;
            lviCartPage.DataBind();

            var totalPrice = cartItems?.Products.Sum(x => x.Product.Price * x.Quantity);
            if (totalPrice > 0)
            {
                lblSumTotal.Text = $"Total Price: {totalPrice} SEK";
                lblSumTotal.Visible = true;
                btnCheckout.Visible = true;
                lblEmptyCart.Visible = false;
            }
            else
            {
                lblSumTotal.Visible = false;
                btnCheckout.Visible = false;
                lblEmptyCart.Visible = true;
            }


        }

        protected void UpdateCart(object sender, CommandEventArgs e)
        {
            var cartControl = (Control)sender;
            var cartLvi = (ListViewItem)cartControl.NamingContainer;
            var tboQuantity = (TextBox)cartLvi.FindControl("tboQuantity");
            var quantityValue = Convert.ToInt32(tboQuantity.Text);

            var cartItems = Session["cart"] as ShoppingCart;

            var shoppingCart = new ShoppingCart();

            shoppingCart.UpdateCart(cartItems, quantityValue, e);
        }

        protected void RemoveItem(object sender, CommandEventArgs e)
        {
            var cartItems = Session["cart"] as ShoppingCart;

            var shoppingCart = new ShoppingCart();

            shoppingCart.RemoveProduct(cartItems, e);
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            var cartItems = Session["cart"] as ShoppingCart;

            var dHandler = new DataHandler();
            if (dHandler.CreateOrder(cartItems, User.Identity.Name))
            {
                Session.Clear();
                Response.Redirect("~/SuccessPage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Could not execute Shopping Cart!');</script>");
                Response.Redirect("~/LoginPage.aspx");
                return;
            }

            
        }
    }
}