using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class Job
    {
        [Key]
        public int Id { get; set; }
        public string Position { get; set; }
        public int JobCategoryId { get; set; }
        public string Description { get; set; }
        public string jobFlyer { get; set; }
        public int CompanyId { get; set; }
        public int Status { get; set; }
        public DateTime ClosingDate { get; set; }
        public JobCategory JobCategory { get; set; }
        public Company Company { get; set; }

        [NotMapped]
        public int count { get; set; }

    }
}
