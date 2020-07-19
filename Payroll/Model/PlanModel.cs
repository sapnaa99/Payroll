using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    class PlanModel
    {
        public int PlanId { get; set; }
        public string Name { get; set; }
        public int PlanDurationListItemId { get; set; }
        public int Price { get; set; }
        public int CompanyLimit { get; set; }
        public Boolean IsActive { get; set; }  
    }
}
