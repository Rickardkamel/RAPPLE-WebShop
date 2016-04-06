using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dHandler = new DataHandler();
                var productList = dHandler.LoadProduct();

                var popularProduct1 = productList.FirstOrDefault(x => x.Name == "iPhone 6");
                var popularProduct2 = productList.FirstOrDefault(x => x.Name == "iPad Pro 128GB");

                lviPopularProducts.DataSource = new List<Product> { popularProduct1, popularProduct2 };
                lviPopularProducts.DataBind();
            }
        }

        protected void SendToSession(object sender, CommandEventArgs e)
        {
            (Master as Rapple)?.AddToSession(sender, e);
        }
    }
}
