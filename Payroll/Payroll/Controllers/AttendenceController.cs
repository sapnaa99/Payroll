using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Controllers
{
    public class AttendenceController : Controller
    {
        // GET: Attendence
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult EmployeeAttendence()
        {
            return View();
        }
    }
}
