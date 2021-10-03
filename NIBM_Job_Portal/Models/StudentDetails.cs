using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class StudentDetails
    {
        [Key]
        public int Id { get; set; }

        public string about { get; set; }
        public string github_url { get; set; }
        public string linkedin_url { get; set; }
        public string image_url { get; set; }
        public string highest_qualification { get; set; }
        public string qualified_year { get; set; }
        public string skills { get; set; }
        public string categories { get; set; }
        public int StudentId { get; set; }
        public Student Student { get; set; }
    }
}
