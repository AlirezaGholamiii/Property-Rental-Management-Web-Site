using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PrjPropertyRentalManagementWebSite.Models;

namespace PrjPropertyRentalManagementWebSite.Controllers
{
    public class LoginController : Controller
    {

       
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Autherize(PrjPropertyRentalManagementWebSite.Models.User userModel)
        {
            using ( PropertyRentalManagementWebSiteDBEntities db = new PropertyRentalManagementWebSiteDBEntities())
            {
                var userDetails = db.Users.Where(x => x.UseName == userModel.UseName && x.Password == userModel.Password).FirstOrDefault();
                if (userDetails == null)
                {
                    userModel.LoginErrorMessage = "Wrong username or password.";
                    return View("Index", userModel);
                }
                else
                {
                    Session["userID"] = userDetails.UserID;
                    Session["userName"] = userDetails.UseName;
                    Session["roleName"] = userDetails.Role;

                   if(Session["roleName"].ToString().Trim() == "Adminstrator")
                   {
                        return RedirectToAction("Index", "Adminstrator");
                   }
                   else if  (Session["roleName"].ToString().Trim() == "Manager")
                   {
                        return RedirectToAction("Index", "Manager");
                   }
                   else if (Session["roleName"].ToString().Trim() == "Owner")
                   {
                       return RedirectToAction("Index", "Owner");
                   }
                   else if (Session["roleName"].ToString().Trim() == "Tenent")
                   {
                       return RedirectToAction("Index", "Tenent");
                   }
                   else
                   {
                        return RedirectToAction("Index", "Home");
                   }
                    
                }
            }
        }

        public ActionResult LogOut()
        {
            string userId = (string)Session["userID"];
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }


        public ActionResult Signup()
        {
  
            return RedirectToAction("AddOrEdit", "User");
        }

    }
}