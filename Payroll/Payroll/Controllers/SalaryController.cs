using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Controllers
{
  
    public class SalaryController : Controller
    {
        // GET: Salary
        public ActionResult SalaryRateSetup()
        {
            return View();
        }

        public ActionResult AddSalaryRate()
        {
            return PartialView("~/Views/Salary/_AddSalaryRate.cshtml");
        }

        public ActionResult EmployeeSalary()
        {
            return View();
        }

        public ActionResult DispatchSalary()
        {
            return PartialView("~/Views/Salary/_DispatchSalary.cshtml");
        }
    }
}