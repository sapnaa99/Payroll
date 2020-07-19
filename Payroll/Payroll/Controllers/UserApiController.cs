using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusinessLayer.User;
using Model;

namespace Payroll.Controllers
{
    public class UserApiController : ApiController
    {
        private IUserService _ius = new UserService();
        [HttpPost]
        [Route("api/UserApi/UserIns")]
        public object UserIns(UserModel model)
        {
            return _ius.UserIns(model);
        }

        [HttpGet]
        [Route("api/UserApi/UserSel")]
        public object UserSel(int userId)
        {
            return _ius.UserSel(userId);
        }
    }
}
