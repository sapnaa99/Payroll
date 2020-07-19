using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Salary
{
    public interface ISalaryService
    {
        object SalaryRateSel(int clientId);
        ReturnMessageModel SalaryRateSetupIns(SalaryRateSetupModel model);
        object EmployeeSalartTransactionSel(int companyId);
    }
}
