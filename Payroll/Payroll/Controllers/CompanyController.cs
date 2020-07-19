using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Controllers
{
    public class CompanyController : Controller
    {
        public ActionResult Company()
        {
            return View();
        }


        public ActionResult CreateCompany()
        {
            return PartialView("~/Views/Company/_CreateCompany.cshtml");
        }
    }
}