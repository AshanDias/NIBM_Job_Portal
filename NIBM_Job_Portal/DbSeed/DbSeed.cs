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
                context.Category.Add(new Category { Id = 1, name = "Cat-1" });
                context.Category.Add(new Category { Id = 2, name = "Cat-2" });
                context.SaveChanges();
            }
            
            if (!context.Skills.Any())
            {
                context.Skills.Add(new Skills { Id = 1, name = "Skills-1" });
                context.Skills.Add(new Skills { Id = 2, name = "Skills-2" });
                context.SaveChanges();
            }
            
            if (!context.Industry.Any())
            {
                context.Industry.Add(new Industry { Id = 1, Name = "Industry-1" });
                context.Industry.Add(new Industry { Id = 2, Name = "Industry-2" });
                context.SaveChanges();
            }
        }
    }
}
