using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class AdminCompanyViewModel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Display(Name ="Company name")]
        public string Company_Name { get; set; }

        [Required(ErrorMessage ="Please choose industry")]
        public int IndustryId { get; set; }
 
        public List<Industry> Industry { get; set; }

        [Required(ErrorMessage ="Email is required")]
        [Display(Name = "Email")]
        public string Email { get; set; }
 
        public string DefaultPasssword { get; set; }

        public int Status { get; set; }
    }
}
