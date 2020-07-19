using BusinessLayer.Attendence;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Payroll.Controllers
{
    public class AttendenceApiController : ApiController
    {
        private IAttendenceService _IAS = new AttendenceService();
        [HttpGet]
        [Route("api/AttendenceApi/EmployeeAttendence")]
        public object EmployeeAttendence(int CompanyId)
        {
            return _IAS.EmployeeAttendence(CompanyId);
        }
        [HttpPost]
        [Route("api/AttendenceApi/EmployeeAttendenceIns")]
        public void EmployeeAttendenceIns(EmployeeAttendenceModel model)
        {       
            var status = model.IsPresent == false ? true : false;
            _IAS.EmployeeAttendenceIns(model.CompanyId,model.EmployeeId,status,model.InsertUserId);
        }
        [HttpPost]
        [Route("api/AttendenceApi/EmployeeAttendenceLogoutIns")]
        public void EmployeeAttendenceLogoutIns(EmployeeAttendenceModel model)
        {
            _IAS.EmployeeAttendenceLogoutIns(model.CompanyId, model.AttendanceId);
        }
    }
}
