using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Controllers
{
    public class UserController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult CreateUser()
        {
            return View();
        }

        public ActionResult UserSel()
        {
            return  View();
        }

        public ActionResult AddInternalUser()
        {
            return PartialView("~/Views/User/_AddInternalUser.cshtml");
        }
       
    }
}