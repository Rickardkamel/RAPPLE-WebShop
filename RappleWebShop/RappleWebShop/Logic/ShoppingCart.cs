using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI.WebControls;
using RappleWebShop.Models;

namespace RappleWebShop.Logic
{
    public class ShoppingCartItem
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }

    public class ShoppingCart
    {
        public List<ShoppingCartItem> Products { get; set; }

        public void RemoveProduct(ShoppingCart cart, CommandEventArgs e)
        {
            var findProduct = cart.Products.FirstOrDefault(x => x.Product.ID.ToString() == e.CommandArgument.ToString());

            cart.Products.Remove(findProduct);
            
        }

        public void UpdateCart(ShoppingCart cart, int quantity, CommandEventArgs e)
        {
            var findProduct = cart?.Products
               .FirstOrDefault(x => x.Product.ID.ToString() == e.CommandArgument.ToString());
            
            if (findProduct != null) findProduct.Quantity = quantity;

            if (quantity <= 0)
            {
                RemoveProduct(cart, e);
            }
        }
    }


   
}
