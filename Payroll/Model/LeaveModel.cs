using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class LeaveModel
    {
        public int LeaveId { get; set; }
        public string LeaveName { get; set; }
        public int CompanyId { get; set; }
        public int Days { get; set; }
        public System.DateTime InsertDate { get; set; }
      
    }
}
