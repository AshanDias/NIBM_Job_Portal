using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class CompanyViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage ="Company name is required")]
        public string Company_Name { get; set; }
        public string Logo_path { get; set; }
        [Required]
        public string Email { get; set; }
        public string Physical_Address { get; set; }
        public string Contact_1 { get; set; }
        public string Contact_2 { get; set; }
        public string State { get; set; }
        
        public IFormFile Image { get; set; }
        [Required]
        public string Contact_No { get; set; }

        [Required]
        [RegularExpression(@"[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)", ErrorMessage = "Invali URL!")]
        public string Website { get; set; }

        public string Description { get; set; }

        [Required(ErrorMessage ="Please Select the industry")]
        public int IndustryId { get; set; }
      
        public List<Industry> industryList { get; set; }
    }
}
