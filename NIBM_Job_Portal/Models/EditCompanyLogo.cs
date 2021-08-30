using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class EditCompanyLogo : UploadCompanyLogo
    {
        public int ExistingCompanyLogoId { get; set; }
        public string ExistingCompanyLogo { get; set; }
    }
}
