using BusinessLayer.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Model;

namespace Payroll.Controllers
{
    public class UtilityApiController : ApiController
    {
        private IUtilityService _ius = new UtilityService();

        [HttpGet]
        [Route("api/UtilityApi/ListItemCategoryDetailSel")]
        public object ListItemCategoryDetailSel(string listItemCategoryName)
        {
            return _ius.ListItemCategoryDetailSel(listItemCategoryName);
        }


        [HttpGet]
        [Route("api/UtilityApi/PlanSel")]
        public object PlanSel()
        {
            return _ius.PlanSel();
        }

        [HttpGet]
        [Route("api/UtilityApi/CompanySel")]
        public object CompanySel(int UserId)
        {
            return _ius.CompanySel(UserId);
        }

        
        [HttpPost]
        [Route("api/UtilityApi/CompanyIns")]
        public object CompanyIns(CompanyModel model)
        {
            return _ius.CompanyIns(model);
        }

    }
}
