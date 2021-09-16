using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Job> Job { get; set; }
        public DbSet<JobCategory> JobCategory { get; set; }
        public DbSet<Industry> Industry { get; set; }
        public DbSet<Company> Company { get; set; }

        public DbSet<Company> UploadCompanyLogo { get; set; }
        public DbSet<StudentJobPost> StudentJobPost { get; set; }

    }
}
