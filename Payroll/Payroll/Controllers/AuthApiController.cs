using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Payroll.Controllers
{
    public class AuthApiController : ApiController
    {
        [HttpGet]
        [Route("api/AuthApi/UserIns")]
        public string UserIns()
        {
            return "Test123";
        }



    }
}