using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class SalaryTransactionModel
    {
        public int SalaryTransactionId { get; set; }
        public int SalaryPaymentTypeListItemId { get; set; }
        public DateTime LastPaidDate { get; set; }
        public int PaymentMethodListItemId { get; set; }
        public decimal SalaryAmount { get; set; }
        public float EmployeeProvidentFundRate { get; set; }
        public decimal EmployeeProvidentFundAmount { get; set; }
        public float CompanyProvidentFundRate { get; set; }
        public decimal CompanyProvidentFundAmount { get; set; }
        public decimal TaxAmount { get; set; }
        public decimal MiscAmount { get; set; }
        public int SalaryStatusListItemId { get; set; }
    }
}
