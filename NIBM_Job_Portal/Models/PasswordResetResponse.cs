using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class PasswordResetResponse
    {
        public string otp { get; set; }
        public string email { get; set; }
        public int id { get; set; }
    }
}
