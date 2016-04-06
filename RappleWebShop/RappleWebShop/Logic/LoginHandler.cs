using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RappleWebShop.Models;

namespace RappleWebShop.Logic
{
    class LoginHandler
    {
        public bool Login(string email, string password)
        {
            using (var context = new RappleContext())
            {
                return context.Users.Any(x => x.Email == email && x.Password == password);
            }
        }
    }
}
