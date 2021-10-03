using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models.API
{
    public class StudentUpdateRequest
    {
        public int id { get; set; }
        public string key { get; set; }
        public string value { get; set; }

    }
}
