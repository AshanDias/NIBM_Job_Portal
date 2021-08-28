using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class Company : CompanyLogo
    {
        [Key]
        public int Id { get; set; }
        public string Company_Name { get; set; }
        public string Logo_path { get; set; }
        public string Email { get; set; }
        public string Physical_Address { get; set; }
        public string Contact_1 { get; set; }
        public string Contact_2 { get; set; }
        public string State { get; set; }
        public int IndustryId { get; set; }
        public Industry Industry { get; set; }
    }
}
