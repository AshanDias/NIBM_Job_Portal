using Firebase.Auth;
using Firebase.Storage;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NIBM_Job_Portal.Helpers;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers
{
    public class JobController : Controller
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public JobController(ApplicationDbContext applicationDbContext)
        {

            _applicationDbContext = applicationDbContext;
        }
        public ActionResult Index()
        {

            var jobs = _applicationDbContext.Job.Include(x=>x.JobCategory).Include(x=>x.Company).ToList();

            return View(jobs);

        }

        [HttpPost]
        public async Task<ActionResult> Create(JobViewModel model)
        {
            JobViewModel jobModel = new JobViewModel();
            var jobCategories = await _applicationDbContext.JobCategory.ToListAsync();
            var companyList = await _applicationDbContext.Company.ToListAsync();
            jobModel.jobCategories = jobCategories;
            jobModel.companyList = companyList;

            if (ModelState.IsValid)
            { 
                bool IsUpdate = false;
                Job job = null; 
                if (model.Id != 0)
                {

                    job = await _applicationDbContext.Job.FindAsync(model.Id);
                    IsUpdate = true;
                }
                else
                {
                    job = new Job();
                }

                var closingDate = Convert.ToDateTime(model.ClosingDate);
                var currentDate = DateTime.Now.Date.AddDays(7);

                if (currentDate > closingDate)
                {
                    ModelState.AddModelError("ClosingDate", "Closing date must be grater than 7 days after the current date.");
                    return View("Create", jobModel);
                }

                if (model.Image != null)
                {
                    string imageUrl = await UploadFileToFirebase(model);
                    job.jobFlyer = imageUrl;

                }
                else
                {
                    job.jobFlyer = model.jobFlyer;
                }

                var res = User.FindFirst(ClaimTypes.NameIdentifier).Value;
                var company = await _applicationDbContext.Company.Where(x => x.ApplicationUserId == res).FirstOrDefaultAsync();
                job.Description = model.Description;
                job.CompanyId = company.Id;
                job.JobCategoryId = (int)model.JobCategoryId;
                job.Position = model.Position;
                job.ClosingDate = model.ClosingDate;
                job.Status =(int) JobStatusEnum.Active;
                if (IsUpdate)
                {
                    _applicationDbContext.Job.Update(job);
                }
                else
                {
                    _applicationDbContext.Job.Add(job);
                }

                _applicationDbContext.SaveChanges();
                return RedirectToAction("Index"); 

            }
            else
            {

                ModelState.AddModelError(string.Empty, "Invalid Job Details.");
             
                return View("Create", jobModel);
            }  

        }


        public async Task<string> UploadFileToFirebase(JobViewModel model)
        {


            var data = getByteStream(model.Image);
            MemoryStream memoryStream = new MemoryStream(data);

            string ext = System.IO.Path.GetExtension(model.Image.FileName);
            var auth = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDx-J0q-QE4CVP_UpZxYMmJ04QKewtIVB8"));
            var a = await auth.SignInWithEmailAndPasswordAsync("ashandias.info@gmail.com", "Test@123");

            var canceltoken = new CancellationToken();
            var downloadUrl = await new FirebaseStorage("nibmjobportal.appspot.com")
                                .Child("company").Child("flyer_images").Child(model.Image.FileName).PutAsync(memoryStream, canceltoken);

            return downloadUrl.Trim();
        }

        public byte[] getByteStream(IFormFile iFormfile)
        {
            byte[] baseString = null;
            using (var ms = new MemoryStream())
            {
                iFormfile.CopyTo(ms);
                baseString = ms.ToArray();
            }

            return baseString;

        }

        [HttpGet]
        public async Task<ActionResult> CreateAsync(int Id=0)
        {
            JobViewModel model = new JobViewModel();
            var jobCategories = await _applicationDbContext.JobCategory.ToListAsync();
            var companyList = await _applicationDbContext.Company.ToListAsync();
            model.jobCategories = jobCategories;
            model.companyList = companyList;
            if (Id != 0)
            {
                Job job = await _applicationDbContext.Job.FindAsync(Id);
                model.Id = job.Id;
                model.Description = job.Description;
                model.CompanyId = job.CompanyId;
                model.JobCategoryId = job.JobCategoryId;
                model.ClosingDate = job.ClosingDate;
                model.jobFlyer = job.jobFlyer;
                model.Position = job.Position;
            }


            return View(model);
        }
         

        [HttpGet]
        public string Delete(int id)
        {
            var data = _applicationDbContext.Job.Where(x => x.Id == id).FirstOrDefault();
            data.Status =(int) JobStatusEnum.Expired;
            _applicationDbContext.Job.Update(data);
            _applicationDbContext.SaveChanges();
            return "success";
        }

        public ActionResult JobApplications(int id)
        { 
            return View();

        }

        public ActionResult ApplicationDetails(int id)
        {
            return View();

        }
    }
}
