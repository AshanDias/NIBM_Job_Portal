using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class StudentFormRequest
    {
        public int id { get; set; }
        public string about { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string highest_qualification { get; set; }
        public string qualified_year { get; set; }
    }
}
