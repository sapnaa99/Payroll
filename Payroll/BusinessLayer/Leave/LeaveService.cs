using BusinessEntities;
using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Leave
{
    public class LeaveService : ILeaveService
    {
        public ReturnMessageModel LeaveDel(int LeaveId)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpLeaveDel(LeaveId,returnMessage);
                result.ReturnMessage = returnMessage.Value.ToString();
                return result;
            }
        }

        public ReturnMessageModel LeaveIns(int CompanyId,string LeaveName,int Days)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpLeaveIns(CompanyId, LeaveName, Days, returnMessage);
                result.ReturnMessage = returnMessage.Value.ToString();
                return result;
            }
        }    

        public object LeaveSel(int CompanyId)
        {
            var jsonResult = "";          
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpLeaveSel(CompanyId).ToList();
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

        public ReturnMessageModel LeaveUpdate(int LeaveId,int CompanyId, string LeaveName, int Days)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpLeaveUpdate(LeaveId,CompanyId,LeaveName,Days, returnMessage);
                result.ReturnMessage = returnMessage.Value.ToString();
                return result;
            }
        }

        public ReturnMessageModel EmployeeLeaveAppliedIns(EmployeeLeaveModel model)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));           
            var userModel = JsonConvert.SerializeObject(model);
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpEmployeeLeaveAppliedIns(userModel, returnMessage);
                result.ReturnMessage = returnMessage.Value.ToString();
                return result;
            }
        }

        public object EmployeeLeaveAppliedSel(int EmployeeId)
        {
            var jsonResult = "";
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpEmployeeLeaveAppliedSel(EmployeeId).ToList();
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

        public ReturnMessageModel EmployeeLeaveAppliedIns(List<EmployeeLeaveModel> model)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            var userModel = JsonConvert.SerializeObject(model);
            using (PayrollEntities db = new PayrollEntities())
            {
                db.SpEmployeeLeaveAppliedIns(userModel, returnMessage);
                result.ReturnMessage = returnMessage.Value.ToString();
                return result;
            }
        }
    }
}
