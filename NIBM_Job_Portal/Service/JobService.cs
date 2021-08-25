using Microsoft.EntityFrameworkCore;
using NIBM_Job_Portal.Interface;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Service
{
    public class JobService : IJobService
    {
        private readonly ApplicationDbContext _dbContext;
        public JobService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        
        public async Task<List<Job>> SearchJobByCategory(int id)
        {

            return await _dbContext.Job.Include(x => x.JobCategory).Where(x => x.JobCategoryId == id).ToListAsync();
        }

        public async Task<List<Job>> SearchJobByTitle(string title)
        {

            return await _dbContext.Job.Where(x => x.Position == title).ToListAsync();
        }
    }
}
