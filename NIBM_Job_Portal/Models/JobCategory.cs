using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class JobCategory
    {
     
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
