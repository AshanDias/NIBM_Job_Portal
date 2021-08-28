using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class UploadCompanyLogo
    {
        [Required]
        [Display(Name = "Image")]
        public IFormFile CompanyLogo { get; set; }
    }
}
