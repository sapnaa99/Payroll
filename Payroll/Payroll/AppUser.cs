using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;

namespace Payroll
{
    public class AppUser : ClaimsPrincipal
    {
        public AppUser(ClaimsPrincipal principal) : base(principal)
        {

        }

        public int UserId
        {
            get
            {
                return Convert.ToInt32(this.FindFirst("UserId").Value);
            }
        }

        public string Email
        {
            get
            {
                return this.FindFirst(ClaimTypes.Email).Value;
            }
        }

        public string Name
        {
            get
            {
                return this.FindFirst(ClaimTypes.Name).Value;
            }
        }
        public string DisplayName
        {
            get
            {
                return this.FindFirst("DisplayName").Value;
            }
        }
        public int ClientId
        {
            get
            {
                return Convert.ToInt32(this.FindFirst("ClientId").Value);
            }
        }

        public int CompanyId
        {
            get
            {
                return Convert.ToInt32(this.FindFirst("CompanyId").Value);
            }
        }
        public int EmployeeId
        {
            get
            {
                return Convert.ToInt32(this.FindFirst("EmployeeId").Value);
            }
        }

    }
}