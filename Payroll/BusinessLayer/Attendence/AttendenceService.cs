using BusinessEntities;
using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Attendence
{
    public class AttendenceService : IAttendenceService
    {
        public object EmployeeAttendence(int CompanyId)
        {
            var jsonResult = "";
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpEmployeeAttendenceSel(CompanyId).ToList();
                jsonResult = String.Join("", jsonlist.ToArray());
            }
            if (jsonResult == "")
            {
                return jsonResult;
            }
            else
            {
                return JsonConvert.DeserializeObject(jsonResult);
            }
        }
        public void EmployeeAttendenceIns(int CompanyId, int EmployeeId, bool IsPresent, int UserId)
        {
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));        
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpEmployeeAttendenceIns(CompanyId, EmployeeId, IsPresent, UserId, returnMessage);
            }
          
        }
        public void EmployeeAttendenceLogoutIns(int CompanyId, int AttendanceId)
        {
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpEmployeeAttendenceLogoutIns(CompanyId, AttendanceId, returnMessage);
            }
        }
    }
}
