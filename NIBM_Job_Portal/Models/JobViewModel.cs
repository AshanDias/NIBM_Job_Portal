using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class JobViewModel
    { 
        public int Id { get; set; }

        [Required(ErrorMessage = "Position cannot be empty")]
        public string Position { get; set; }

        [Required(ErrorMessage = "Please choose JobCategory")]
        public Nullable<int> JobCategoryId { get; set; }

        public string Description { get; set; }
        public string jobFlyer { get; set; } 
        public int CompanyId { get; set; }

        [Required(ErrorMessage = "Closing Date cannot be empty")]
        public DateTime ClosingDate { get; set; }
        public IFormFile Image { get; set; }

        public List<JobCategory> jobCategories { get; set; }
        public List<Company> companyList { get; set; }
    }
}
