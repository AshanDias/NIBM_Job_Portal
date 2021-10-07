using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class StudentResponse
    {
        public Student Student { get; set; }
        public string about { get; set; }
        public string git_url { get; set; }
        public string likedin_url { get; set; }
        public string image_url { get; set; }
        public string higst_ql{ get; set; }
        public string qulified_year { get; set; }

        public List<Category> Category { get; set; }
        public List<Skills> Skills { get; set; }
    }
}
