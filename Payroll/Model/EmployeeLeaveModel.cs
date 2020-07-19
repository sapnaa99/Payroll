using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EmployeeLeaveModel
    {
        public int EmployeeLeaveId { get; set; }
        public int EmployeeId { get; set; }
        public int? LeaveId { get; set; }
        public DateTime? AppliedDate { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int LeaveStatusListItemId { get; set; }
        public string Description { get; set; }
        public string Remarks { get; set; }
        public int? ApprovedUserId { get; set; }
        public DateTime? InsertDate { get; set; }
        public string ListItemName { get; set; }
        public string EmployeeName { get; set; }
        public string Status { get; set; }
        public int InsertUserId { get; set; }
    }
}
