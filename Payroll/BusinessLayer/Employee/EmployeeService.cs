using BusinessEntities;
using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Employee
{
    public class EmployeeService : IEmployeeService
    {
        public ReturnMessageModel EmployeeIns(EmployeeModel model)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            model.Password = HashPassword(model.Password);
            var EmployeeInformation = JsonConvert.SerializeObject(model.EmployeeInformation);
            var EmployeeSalary = JsonConvert.SerializeObject(model.EmployeeSalary);
            model.EmployeeInformation = null;
            model.EmployeeSalary = null;
            var EmployeeModel = JsonConvert.SerializeObject(model);
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpEmployeeIns(EmployeeModel, EmployeeInformation, EmployeeSalary, returnMessage);
                return result;
            }
        }

        private static string GetRandomSalt()
        {
            return BCrypt.Net.BCrypt.GenerateSalt(12);
        }

        public static string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password, GetRandomSalt());
        }


        public object EmployeeSel(int clientId)
        {
            var jsonResult = "";
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpEmployeeSel(clientId).ToList();
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
        public object EmployeeLeaveSel(int CompanyId)
        {
            var jsonResult = "";
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpEmployeeLeaveSel(CompanyId).ToList();
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

        public ReturnMessageModel EmployeeleaveStatusTsk(EmployeeLeaveModel model)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpEmployeeleaveStatusTsk(model.Status, model.EmployeeLeaveId, model.InsertUserId, returnMessage);
                return result;
            }
        }


    }
}
