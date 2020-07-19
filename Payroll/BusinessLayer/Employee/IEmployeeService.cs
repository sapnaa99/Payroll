using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Employee
{
    public interface IEmployeeService
    {
        ReturnMessageModel EmployeeIns(EmployeeModel model);
        object EmployeeSel(int clientId);
        object EmployeeLeaveSel(int CompanyId);
        ReturnMessageModel EmployeeleaveStatusTsk(EmployeeLeaveModel model);
    }
}
