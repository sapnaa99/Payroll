using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public interface IAuthService
    {
        SpVerifyUserSel_Result VerifyUserSel(string Email);
        List<SpUserRoleSel_Result> UserRoleSel(int userId);
        SpVerifyEmployeeSel_Result verfiyEmployeeSel(string Email);
    }
}
