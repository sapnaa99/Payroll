//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusinessEntities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Attendance
    {
        public int AttendanceId { get; set; }
        public int CompanyId { get; set; }
        public int EmployeeId { get; set; }
        public Nullable<System.TimeSpan> InTime { get; set; }
        public Nullable<System.TimeSpan> OutTime { get; set; }
        public bool IsPresent { get; set; }
        public int InsertUserId { get; set; }
        public System.DateTime InsertDate { get; set; }
    
        public virtual User User { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual User User1 { get; set; }
    }
}
