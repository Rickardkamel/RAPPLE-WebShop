using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class ProductPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dHandler = new DataHandler();

                var category = dHandler.LoadCategory(Request.QueryString["page"]);

                if (category != null) lviProductPage.DataSource = category.Products;

                lviProductPage.DataBind();
            }
        }

        protected void SendToSession(object sender, CommandEventArgs e)
        {
            (Master as Rapple)?.AddToSession(sender, e);
        }
    }
}