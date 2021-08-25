using Microsoft.AspNetCore.Mvc;
using NIBM_Job_Portal.Interface;
using NIBM_Job_Portal.Models;
using NIBM_Job_Portal.Models.API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace NIBM_Job_Portal.Controllers.API
{
  
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : ControllerBase
    {
        private readonly IJobService _jobService;
        public JobController(IJobService jobService)
        {
            _jobService = jobService;
        }
        
        /// <summary>
        /// Search the job by job title
        /// </summary>
        /// <param name="request">Required the job titile</param>
        /// <returns></returns>
        [HttpGet]
        [Route("SearchJobByTitle")]
        public async Task<List<Job>> SearchJobByTitle(JobRequestModel request)
        {
            return await _jobService.SearchJobByTitle(request.title);
        }

        /// <summary>
        /// Search the job by job category
        /// </summary>
        /// <param name="request">Required the category id</param>
        /// <returns></returns>
        [HttpGet]
        [Route("SearchJobByCategory")]
        public async Task<List<Job>> SearchJobByCategory(JobRequestModel request)
        {
            return await _jobService.SearchJobByCategory(request.categoryId);
        }


    }
}
