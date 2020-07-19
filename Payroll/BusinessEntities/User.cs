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
    
    public partial class User
    {
        public User()
        {
            this.Attendances = new HashSet<Attendance>();
            this.Attendances1 = new HashSet<Attendance>();
            this.Clients = new HashSet<Client>();
            this.Employees = new HashSet<Employee>();
            this.EmployeeLeaves = new HashSet<EmployeeLeave>();
            this.EmployeeSalaries = new HashSet<EmployeeSalary>();
            this.SalaryRateSetups = new HashSet<SalaryRateSetup>();
            this.SalaryTransactions = new HashSet<SalaryTransaction>();
            this.SubDomains = new HashSet<SubDomain>();
            this.UserInformations = new HashSet<UserInformation>();
            this.UserInformations1 = new HashSet<UserInformation>();
            this.UserRoles = new HashSet<UserRole>();
        }
    
        public int UserId { get; set; }
        public string Email { get; set; }
        public string FName { get; set; }
        public string MName { get; set; }
        public string LName { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
        public int ParentId { get; set; }
        public System.DateTime InsertDate { get; set; }
    
        public virtual ICollection<Attendance> Attendances { get; set; }
        public virtual ICollection<Attendance> Attendances1 { get; set; }
        public virtual ICollection<Client> Clients { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<EmployeeLeave> EmployeeLeaves { get; set; }
        public virtual ICollection<EmployeeSalary> EmployeeSalaries { get; set; }
        public virtual ICollection<SalaryRateSetup> SalaryRateSetups { get; set; }
        public virtual ICollection<SalaryTransaction> SalaryTransactions { get; set; }
        public virtual ICollection<SubDomain> SubDomains { get; set; }
        public virtual ICollection<UserInformation> UserInformations { get; set; }
        public virtual ICollection<UserInformation> UserInformations1 { get; set; }
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
