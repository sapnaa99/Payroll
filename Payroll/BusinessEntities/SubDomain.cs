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
    
    public partial class SubDomain
    {
        public int SubDomainId { get; set; }
        public int ClientId { get; set; }
        public string SubDomain1 { get; set; }
        public int InsertUserId { get; set; }
        public System.DateTime InsertDate { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual User User { get; set; }
    }
}