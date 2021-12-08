using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrjPropertyRentalManagementWebSite.Models
{
    public class UserModel
    {
        private int id;
        private string userName; 
        private string password;
        private string role;
        public string UserName { get => userName; set => userName = value; }
        public string Password { get => password; set => password = value; }
        public int Id { get => id; set => id = value; }
        public string Role { get => role; set => role = value; }

    }
}