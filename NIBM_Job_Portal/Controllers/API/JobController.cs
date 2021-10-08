using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        private readonly ApplicationDbContext _applicationDbContext;

        public JobController(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        [HttpGet]
        [Route("category")]
        public async Task<IActionResult> Category(int id)
        {
            try
            {
                return Ok(await _applicationDbContext.Job.Where(x => x.JobCategoryId == id).ToListAsync());
            }
            catch
            {
                return StatusCode(500);
            }

        }


        [HttpPost]
        [Route("apply")]
        public async Task<IActionResult> Apply(JobRequest request)
        {
            try
            {
                AppliedJob model = new AppliedJob();
                model.cv_url = request.cv_url;
                model.jobId = request.job_post;
                model.studentId = request.id;

                _applicationDbContext.AppliedJob.Add(model);
                await _applicationDbContext.SaveChangesAsync();

                return Ok(request);
            }
            catch
            {
                return StatusCode(500);
            }

        }



        [HttpGet]
        [Route("getbycategory")]
        public async Task<IActionResult> GetByategory(int id)
        {
            try
            {
              var student=  await _applicationDbContext.StudentDetails.Where(x => x.StudentId == id).FirstOrDefaultAsync();

                List<string> categories = new List<string>();
                categories = student.categories.Split(',').ToList();
                var jobs = await _applicationDbContext.Job.Include(x=>x.Company).Include(x => x.JobCategory).ToListAsync();
                List<Job> result = new List<Job>();
                foreach (var item in jobs)
                {
                    if (categories.Any(x => x.Contains(item.JobCategory.Name)))
                    {
                        result.Add(item);
                    }
                }
                return Ok(result);
            }
            catch
            {
                return StatusCode(500);
            }

        }



        [HttpPost]
        [Route("checkstatus")]
        public async Task<IActionResult> CheckStatus(JobRequest request)
        {
            try
            {
                return Ok(await _applicationDbContext.AppliedJob.AnyAsync(x => x.studentId == request.id && x.jobId == request.job_post));
            }
            catch
            {
                return StatusCode(500);
            }

        }




    }
}
