using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using RappleWebShop.Models;

namespace RappleWebShop.Logic
{
    public class DataHandler
    {

        public List<Category> LoadCategory()
        {
            try
            {
                using (var context = new RappleContext())
                {
                    return context.Categories.Include(c => c.Products).ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }

        public Category LoadCategory(string name)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    return context.Categories.Include(c => c.Products).FirstOrDefault(x => x.Name == name);
                }
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }

        public List<Product> LoadProduct()
        {
            try
            {
                using (var context = new RappleContext())
                {
                    var productList = context.Products.ToList();

                    return productList;
                }
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }

        public Product LoadProduct(string name)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    return context.Products.FirstOrDefault(x => x.Name == name);
                }
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }

        public bool RegisterUser(User user)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    context.Users.Add(user);
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }

        public User GetUser(string userEmail)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    var loggedInUser = context.Users.FirstOrDefault(x => x.Email == userEmail);
                    return loggedInUser;
                }
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }

        public bool UpdateUser(User user)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    context.Users.AddOrUpdate(user);
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }

        public bool CreateOrder(ShoppingCart cart, string userEmail)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    var newOrder = new Order();

                    var totalPrice = cart?.Products.Sum(x => x.Product.Price*x.Quantity);
                    if (totalPrice != null) newOrder.Price = (int) totalPrice;
                    newOrder.OrderDate = DateTime.Today.Date;
                    newOrder.UserId = context.Users.First(x => x.Email == userEmail).ID;

                    context.Orders.Add(newOrder);
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }

        public Product GetProduct(int productId)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    var product = context.Products.FirstOrDefault(x => x.ID == productId);
                    return product;
                }
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }

        public User GetUserOrders(string userEmail)
        {
            try
            {
                using (var context = new RappleContext())
                {
                    var findUser = context.Users.Include(x => x.Orders).FirstOrDefault(x => x.Email == userEmail);

                    return findUser;
                }
            }
            catch (Exception ex)
            {
                return null;
                throw ex;
            }
        }
    }
}
