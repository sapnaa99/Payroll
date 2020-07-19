using BusinessEntities;
using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Salary
{
    public class SalaryService : ISalaryService
    {
        public object SalaryRateSel(int clientId)
        {
            var jsonResult = "";
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpSalaryRateSel(clientId).ToList();
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


        public ReturnMessageModel SalaryRateSetupIns(SalaryRateSetupModel model)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpSalaryRateSetupIns(model.SalaryRateSetupId, model.CompanyId, model.RateName, model.From, model.Upto, model.Rate, model.InsertUserId, returnMessage);
                result.ReturnMessage = returnMessage.Value.ToString();
                return result;
            }
        }


        public object EmployeeSalartTransactionSel(int companyId)
        {
            var jsonResult = "";
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpEmployeeSalartTransactionSel(companyId).ToList();
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
    }
}
