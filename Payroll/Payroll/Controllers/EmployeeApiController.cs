using BusinessLayer.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Model;

namespace Payroll.Controllers
{
    public class EmployeeApiController : ApiController
    {
        private IEmployeeService _ies = new EmployeeService();


        [HttpGet]
        [Route("api/EmployeeApi/EmployeeSel")]
        public object EmployeeSel(int clientId)
        {
            return _ies.EmployeeSel(clientId);
        }

        [HttpPost]
        [Route("api/EmployeeApi/EmployeeIns")]
        public object EmployeeIns(EmployeeModel model)
        {
            return _ies.EmployeeIns(model);
        }


        [HttpGet]
        [Route("api/EmployeeApi/EmployeeLeaveSel")]
        public object EmployeeLeaveSel(int CompanyId)
        {
            return _ies.EmployeeLeaveSel(CompanyId);
        }
        [HttpPost]
        [Route("api/EmployeeApi/EmployeeleaveStatusTsk")]
        public object EmployeeleaveStatusTsk(EmployeeLeaveModel model)
        {
            return _ies.EmployeeleaveStatusTsk(model);
        }
        
    }
}
