using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class CompanyModel
    {
        public int CompanyId { get; set; }
        [Required]
        public string CompanyName { get; set; }
        public int ClientId { get; set; }
        public int UserId { get; set; }
        public DateTime InsertDate { get; set; }
    }
}
