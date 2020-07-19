using BusinessLayer.Salary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Model;

namespace Payroll.Controllers
{
    public class SalaryApiController : ApiController
    {
        private ISalaryService _iss = new SalaryService();
   

        [HttpGet]
        [Route("api/SalaryApi/SalaryRateSel")]
        public object SalaryRateSel(int clientId)
        {
            return _iss.SalaryRateSel(clientId);
        }

        [HttpPost]
        [Route("api/SalaryApi/SalaryRateSetupIns")]
        public object SalaryRateSetupIns(SalaryRateSetupModel model)
        {
            return _iss.SalaryRateSetupIns(model);
        }

        [HttpGet]
        [Route("api/SalaryApi/EmployeeSalartTransactionSel")]
        public object EmployeeSalartTransactionSel(int companyId)
        {
            return _iss.EmployeeSalartTransactionSel(companyId);
        }
    }
}
