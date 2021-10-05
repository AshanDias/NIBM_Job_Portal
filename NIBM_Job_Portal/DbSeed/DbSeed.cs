using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.DbSeed
{
    public class DbSeed
    {
        public static void Seed(IServiceScope serviceScope)
        {
            var context = serviceScope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
            context.Database.Migrate();

            if (!context.JobCategory.Any())
            {
                context.JobCategory.Add(new JobCategory { Id = 1, Name = "Quality Assurance" });
                context.JobCategory.Add(new JobCategory { Id = 2, Name = "Data Scientist" });
                context.JobCategory.Add(new JobCategory { Id = 3, Name = "Software Development" });
                context.JobCategory.Add(new JobCategory { Id = 4, Name = "Dev Ops" });
                context.JobCategory.Add(new JobCategory { Id = 5, Name = "Business Analyst" });
                context.JobCategory.Add(new JobCategory { Id = 6, Name = "Project Manager" });
                context.JobCategory.Add(new JobCategory { Id = 7, Name = "Graphics Designer" });
                context.JobCategory.Add(new JobCategory { Id = 8, Name = "Data Entry" });
                context.JobCategory.Add(new JobCategory { Id = 9, Name = "Implementation" });
                context.JobCategory.Add(new JobCategory { Id = 10, Name = "Tech Lead" });
                context.JobCategory.Add(new JobCategory { Id = 11, Name = "Software Architect" });
                context.SaveChanges();
            }
            
            if (!context.Skills.Any())
            {
                context.Skills.Add(new Skills { Id = 1, name = "Quality Assurance" });
                context.Skills.Add(new Skills { Id = 2, name = "Skills-2" });
                context.Skills.Add(new Skills { Id = 3, name = ".Net Development" });
                context.Skills.Add(new Skills { Id = 4, name = "Android (Java)" });
                context.Skills.Add(new Skills { Id = 5, name = "iOS (Swift)" });
                context.Skills.Add(new Skills { Id = 6, name = "Business Analysis" });
                context.Skills.Add(new Skills { Id = 7, name = "NodeJS" });
                context.Skills.Add(new Skills { Id = 8, name = "React Native" });
                context.Skills.Add(new Skills { Id = 9, name = "Test Automation" });
                context.SaveChanges();
            }
            
            if (!context.Industry.Any())
            {
                context.Industry.Add(new Industry { Id = 1, Name = "Software" });
                context.Industry.Add(new Industry { Id = 2, Name = "HR" });
                context.SaveChanges();
            }

        }
    }
}
