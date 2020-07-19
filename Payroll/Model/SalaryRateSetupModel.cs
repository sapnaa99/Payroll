using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class SalaryRateSetupModel
    {
        public int SalaryRateSetupId { get; set; }
        public int CompanyId { get; set; }
        [Required]
        public string RateName { get; set; }
        [Required]
        public int From { get; set; }
        [Required]
        public int Upto { get; set; }
        [Required]
        public double Rate { get; set; }
        public string CompanyName { get; set; }
        public int InsertUserId { get; set; }

    }
}
