using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models.API
{
    public class StudentRequest
    {
        public string nic { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string password { get; set; }
    }
}
