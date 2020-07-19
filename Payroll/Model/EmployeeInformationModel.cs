using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EmployeeInformationModel
    {
        public int EmployeeInformationId { get; set; }
        [Required]
        public int EmployeeId { get; set; }
        [Required]
        public int CompanyId { get; set; }
        [Required]
        public int ContactNumber { get; set; }
        public int MobileNumber { get; set; }
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter valid email address")]
        [EmailAddress]
        public string PersonalEmail { get; set; }
        [Required]
        public int GenderListItemId { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public System.DateTime InsertDate { get; set; }
        [Required]
        public int InsertUserId { get; set; }

    }
}
