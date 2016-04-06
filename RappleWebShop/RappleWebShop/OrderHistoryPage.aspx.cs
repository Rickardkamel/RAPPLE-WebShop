using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class OrderHistoryPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dHandler = new DataHandler();
            var findUser = dHandler.GetUserOrders(User.Identity.Name);

            if (findUser == null) return;
            lviOrderHistory.DataSource = findUser.Orders.OrderBy(x => x.OrderDate);
            lviOrderHistory.DataBind();

            var totalOrderPrice = findUser.Orders.Sum(x => x.Price);
            lblOrderTotal.Text = $"Your Order History Sum: {totalOrderPrice} SEK";

        }
    }
}