using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Controllers
{
    public class LeaveController : Controller
    {
        // GET: Leave
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CreateLeave()
        {           
           return PartialView("~/Views/Leave/_CreateLeave.cshtml");           
        }

        public ActionResult LeaveSel()
        {
            return View();
        }
        public ActionResult EmployeeLeaveCreate()
        {
            return View();
        }


    }
}