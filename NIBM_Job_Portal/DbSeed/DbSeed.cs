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

            if (!context.Category.Any())
            {
                context.Category.Add(new Category { Id = 1, name = "Quality Assurance" });
                context.Category.Add(new Category { Id = 2, name = "Data Scientist" });
                context.Category.Add(new Category { Id = 3, name = "Software Development" });
                context.Category.Add(new Category { Id = 4, name = "Dev Ops" });
                context.Category.Add(new Category { Id = 5, name = "Business Analyst" });
                context.Category.Add(new Category { Id = 6, name = "Project Manager" });
                context.Category.Add(new Category { Id = 7, name = "Graphics Designer" });
                context.Category.Add(new Category { Id = 8, name = "Data Entry" });
                context.Category.Add(new Category { Id = 9, name = "Implementation" });
                context.Category.Add(new Category { Id = 10, name = "Tech Lead" });
                context.Category.Add(new Category { Id = 11, name = "Software Architect" });
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
