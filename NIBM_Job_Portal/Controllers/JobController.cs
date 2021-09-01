using Firebase.Auth;
using Firebase.Storage;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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
           
            bool IsUpdate = false;
            Job job = null;
            if (model.Id != 0)
            {

                job =await _applicationDbContext.Job.FindAsync(model.Id);
                IsUpdate = true;
            }
            else
            {
                job = new Job();
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



            job.Description = model.Description;
            job.CompanyId = model.CompanyId;
            job.JobCategoryId = model.JobCategoryId;
            job.Position = model.Position;
            job.ClosingDate = model.ClosingDate; 

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
        public ActionResult Edit(int id)
        {
           // var data = _applicationDbContext.Job.Where(x => x.Id == id).FirstOrDefault();
            return View();
        }

        //[HttpGet]
        //public ActionResult Edit()
        //{
        //    return View();
        //}


        [HttpPost]
        public ActionResult Update(Job model)
        {
            var data = _applicationDbContext.Job.Where(x => x.Id == model.Id).FirstOrDefault();
            if (data != null)
            {
                data.Position = model.Position;
                data.JobCategoryId = model.JobCategoryId;
                data.Description = model.Description;
                data.CompanyId = model.CompanyId;
                _applicationDbContext.SaveChanges();
            }

            return RedirectToAction("index");
        }

        [HttpGet]
        public string Delete(int id)
        {
            var data = _applicationDbContext.Job.Where(x => x.Id == id).FirstOrDefault();
            _applicationDbContext.Job.Remove(data);
            _applicationDbContext.SaveChanges();
            return "success";
        }
        public ActionResult View(int id)
        {
            var data = _applicationDbContext.Job.Where(x => x.Id == id).FirstOrDefault();

            if (data != null)
            {
                JobViewModel model = new JobViewModel();
                model.Id = data.Id;
                model.Position = data.Position;
                model.JobCategoryId = data.JobCategoryId;
                model.Description = data.Description;
                model.CompanyId = data.CompanyId;
                return View(model);
            }
            else
            {
                return View();
            }
        }
 
    }
}
