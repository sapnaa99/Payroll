using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UserModel
    {
        public int UserId { get; set; }
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
        [EmailAddress]
        [DataType(DataType.EmailAddress, ErrorMessage = "Enter valid email address")]
        public string EmailConfirmation { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required]
        //[DataType(DataType.Password)]
        public string PasswordConfirmation { get; set; }
        [Required]
        public string SubDomain { get; set; }
        public UserInformationModel UserInformation { get; set; }
        public virtual  int PlanId { get; set; }

    }
}
