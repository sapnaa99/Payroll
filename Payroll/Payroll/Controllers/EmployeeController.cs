using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Controllers
{
    public class EmployeeController : Controller
    {

        public ActionResult Employee()
        {
            return View();
        }
        // GET: Employee
        public ActionResult CreateEmployee()
        {
            return PartialView("~/Views/Employee/_CreateEmployee.cshtml");
        }


        public ActionResult EmployeeLeave()
        {
            return View();
        }


        public ActionResult ApplyLeave()
        {
            return View();
        }

    }
}