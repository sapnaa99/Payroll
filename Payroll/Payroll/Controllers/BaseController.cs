using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Controllers
{
    public class BaseController : Controller
    {
        public AppUser CurrentUser
        {
            get { return new AppUser(this.User as ClaimsPrincipal); }
        }
    }
}