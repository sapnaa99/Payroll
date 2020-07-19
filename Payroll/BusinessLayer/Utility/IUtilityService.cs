using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Utility
{
    public interface IUtilityService
    {
        object ListItemCategoryDetailSel(string listItemCategoryName);
        object PlanSel();
        object CompanySel(int userId);
        ReturnMessageModel CompanyIns(CompanyModel model);
    }
}
