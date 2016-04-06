using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RappleWebShop.Logic;
using RappleWebShop.Models;

namespace RappleWebShop
{
    public partial class ProductDescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dHandler = new DataHandler();

                var product = dHandler.LoadProduct(Request.QueryString["productname"]);

                var list = new List<Product> {product};

                if (product != null) lviProductDescription.DataSource = list;

                lviProductDescription.DataBind();
            }
        }

        protected void SendToSession(object sender, CommandEventArgs e)
        {
            (Master as Rapple)?.AddToSession(sender, e);
        }
    }
    }
