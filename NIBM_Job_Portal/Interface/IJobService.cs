using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Interface
{
   public interface IJobService
    {
        public Task<List<Job>> SearchJobByTitle(string title);
        public Task<List<Job>> SearchJobByCategory(int id);
    }
}
