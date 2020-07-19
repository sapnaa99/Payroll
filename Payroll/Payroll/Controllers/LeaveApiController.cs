using BusinessLayer.Leave;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Payroll.Controllers
{
    public class LeaveApiController : ApiController
    {
        private ILeaveService _Le = new LeaveService();
        [HttpGet]
        [Route("api/LeaveApi/LeaveSel")]
        public object LeaveSel(int CompanyId)
        {
            return _Le.LeaveSel(CompanyId);
        }
        [HttpPost]
        [Route("api/LeaveApi/LeaveIns")]
        public void LeaveIns(LeaveModel model)  
        {
            _Le.LeaveIns(model.CompanyId,model.LeaveName,model.Days);
        }

        [HttpPost]
        [Route("api/LeaveApi/LeaveDel")]
        public void LeaveDel(LeaveModel model)
        {
            _Le.LeaveDel(model.LeaveId);
        }
        [HttpPost]
        [Route("api/LeaveApi/LeaveUpdate")]
        public void LeaveUpdate(LeaveModel model)
        {
            _Le.LeaveUpdate(model.LeaveId,model.CompanyId,model.LeaveName,model.Days);
        }
        [HttpPost]
        [Route("api/LeaveApi/EmployeeLeaveAppliedIns")]
        public void EmployeeLeaveAppliedIns(EmployeeLeaveModel model)
        {
            _Le.EmployeeLeaveAppliedIns(model);
        }

        [HttpPost]
        [Route("api/LeaveApi/EmployeeLeaveAppliedUpdate")]
        public void EmployeeLeaveAppliedUpdate(List<EmployeeLeaveModel> model)
        {
            _Le.EmployeeLeaveAppliedIns(model);
        }
        [HttpPost]
        [Route("api/LeaveApi/EmployeeLeaveAppliedUpdateNew")]
        public void EmployeeLeaveAppliedUpdateNew(EmployeeLeaveModel model)
        {
            _Le.EmployeeLeaveAppliedIns(model);
        }

        [HttpGet]
        [Route("api/LeaveApi/EmployeeLeaveAppliedSel")]
        public object EmployeeLeaveAppliedSel(int EmployeeId)
        {
            return _Le.EmployeeLeaveAppliedSel(EmployeeId);
        }
    }
}
