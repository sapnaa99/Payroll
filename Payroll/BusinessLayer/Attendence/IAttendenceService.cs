using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Attendence
{
    public interface IAttendenceService
    {
        object EmployeeAttendence(int CompanyId);
        void EmployeeAttendenceIns(int CompanyId, int EmployeeId, bool IsPresent, int UserId);
        void EmployeeAttendenceLogoutIns(int CompanyId, int AttendanceId);
    }
}
