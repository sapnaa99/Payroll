using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
   public class EmployeeSalaryModel
    {
        public int EmployeeSalaryId { get; set; }
        public int EmployeeId { get; set; }
        [Required]
        public decimal BasicSalary { get; set; }
        [Required]
        public decimal Allowance { get; set; }

    }
}
