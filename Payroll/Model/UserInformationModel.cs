using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UserInformationModel
    {
        public int UserInformationId { get; set; }
        public int UserId { get; set; }
        [Range(0, 9999999999, ErrorMessage = "Please enter valid integer Number")]
        public int? ContactNumber { get; set; }
        [Required]
        [Range(0, 999999999, ErrorMessage = "Please enter valid integer Number")]
        public int MobileNumber { get; set; }
        [Required]
        public string PersonalEmail { get; set; }
        [Required]
        public int GenderListItemId { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        public string Country { get; set; }
    }
}
