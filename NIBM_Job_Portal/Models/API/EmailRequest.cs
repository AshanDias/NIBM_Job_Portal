using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models.API
{
    public class EmailRequest
    {
        public string reciever { get; set; }
        public string email_subject { get; set; }
        public string email_body { get; set; }
    }
}
