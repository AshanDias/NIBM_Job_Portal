using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models.API
{
    public class JobRequest
    {
        public int id { get; set; }
        public string cv_url { get; set; }
        public int job_post { get; set; }
    }
}
