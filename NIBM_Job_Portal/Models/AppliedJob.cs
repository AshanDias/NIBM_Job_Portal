using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class AppliedJob
    {
        [Key]
        public int Id { get; set; }
        public string cv_url { get; set; }
        public int jobId { get; set; }
        public int studentId { get; set; }
        public Student Student { get; set; }
        public Job Job { get; set; }
    }
}
