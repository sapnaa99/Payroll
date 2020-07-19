using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EmployeeAttendenceModel
    {
        public int AttendanceId { get; set; }
        public int CompanyId { get; set; }
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }

        [DataType(DataType.Time, ErrorMessage = "Enter valid In-Time")]
        public TimeSpan? InTime { get; set; }

        [DataType(DataType.Time, ErrorMessage = "Enter valid Out-Time")]
        public TimeSpan? OutTime { get; set; }
        public bool IsPresent { get; set; }
        public int InsertUserId { get; set; }
        public DateTime InsertDate { get; set; }

    }
}
