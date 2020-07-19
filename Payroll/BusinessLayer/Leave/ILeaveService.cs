using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Leave
{
    public interface ILeaveService
    {
        object LeaveSel(int CompanyId);
        ReturnMessageModel LeaveIns(int CompanyId,string LeaveName,int Days);
        ReturnMessageModel LeaveDel(int LeaveId);
        ReturnMessageModel LeaveUpdate(int LeaveId, int CompanyId, string LeaveName, int Days);
        ReturnMessageModel EmployeeLeaveAppliedIns(EmployeeLeaveModel model);
        object EmployeeLeaveAppliedSel(int EmployeeId);
        ReturnMessageModel EmployeeLeaveAppliedIns(List<EmployeeLeaveModel> model);

    }
}
