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
    
    public partial class Company
    {
        public Company()
        {
            this.Employees = new HashSet<Employee>();
            this.Leaves = new HashSet<Leave>();
            this.SalaryRateSetups = new HashSet<SalaryRateSetup>();
        }
    
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int ClientId { get; set; }
        public int InsertUserID { get; set; }
        public System.DateTime InsertDate { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<Leave> Leaves { get; set; }
        public virtual ICollection<SalaryRateSetup> SalaryRateSetups { get; set; }
    }
}