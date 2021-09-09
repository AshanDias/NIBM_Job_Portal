using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class ApplicationUser : IdentityUser
    {
        public int UserType { get; set; }
    }
}
