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
    
    public partial class PlanDuration
    {
        public int PlanDurationId { get; set; }
        public int PlanDurationListItemId { get; set; }
        public int DurationInMonth { get; set; }
        public System.DateTime InsertDate { get; set; }
    
        public virtual ListItem ListItem { get; set; }
    }
}