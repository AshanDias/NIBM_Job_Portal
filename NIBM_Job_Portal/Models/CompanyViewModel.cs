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
        [Required]
        public string Company_Name { get; set; }
        public string Logo_path { get; set; }
        [Required]
        public string Email { get; set; }
        public string Physical_Address { get; set; }
        public string Contact_1 { get; set; }
        public string Contact_2 { get; set; }
        public string State { get; set; }
        [Required]
        public IFormFile Image { get; set; }
        [Required]
        public string Contact_No { get; set; }
        [Required]
        public string Website { get; set; }

        public string Description { get; set; }
        [Required]
        public int IndustryId { get; set; }
        [Required]
        public int JobCategoryId { get; set; }
    }
}
