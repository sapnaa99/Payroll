using BusinessEntities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Auth
{
    public class AuthService : IAuthService
    {
        public SpVerifyUserSel_Result VerifyUserSel(string Email)
        {
            var model = new SpVerifyUserSel_Result();
            using (PayrollEntities db = new PayrollEntities())
            {
                model = db.SpVerifyUserSel(Email).FirstOrDefault();
            }
            return model;
        }


        public List<SpUserRoleSel_Result> UserRoleSel(int userId)
        {
            var model = new List<SpUserRoleSel_Result>();
            using (PayrollEntities db = new PayrollEntities())
            {
                model = db.SpUserRoleSel(userId).ToList();
            }
            return model;
        }

        public SpVerifyEmployeeSel_Result verfiyEmployeeSel(string Email)
        {
            var model = new SpVerifyEmployeeSel_Result();
            using (PayrollEntities db = new PayrollEntities())
            {
                model = db.SpVerifyEmployeeSel(Email).FirstOrDefault();
            }
            return model;
        }
    }
}
