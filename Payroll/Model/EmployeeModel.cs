using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EmployeeModel
    {
        public int EmployeeId { get; set; }
        [Required]
        public string FName { get; set; }
        public string MName { get; set; }
        [Required]
        public string LName { get; set; }
        [Required]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter valid email address")]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string PasswordConfirmation { get; set; }
        [Required]
        public bool IsActive { get; set; }
        [Required]
        public DateTime InsertDate { get; set; }
        [Required]
        public int CompanyId { get; set; }
        public EmployeeInformationModel EmployeeInformation { get; set; }
        public EmployeeSalaryModel EmployeeSalary { get; set; }
    }
}
