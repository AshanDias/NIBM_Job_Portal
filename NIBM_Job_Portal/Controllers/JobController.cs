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
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;
using Ionic.Zip;
using Microsoft.AspNetCore.Authorization;

namespace NIBM_Job_Portal.Controllers
{
    [Authorize]
    public class JobController : Controller
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public JobController(ApplicationDbContext applicationDbContext)
        {

            _applicationDbContext = applicationDbContext;
        }
        public ActionResult Index()
        {
            List<Job> jobs = null;
            try
            {
                var result = TempData["JobCeated"];
                if (result != null)
                {
                    ViewData["JobCeated"] = "true";
                }
                var id = User.FindFirst(ClaimTypes.NameIdentifier).Value;
                var user = _applicationDbContext.Users.FirstOrDefault(x => x.Id == id);
                if (user.UserType == (int)UserTypeEnum.Admin)
                {
                     jobs = _applicationDbContext.Job.Include(x => x.JobCategory).Include(x => x.Company).Where(x=>x.Company.IsEnable==(int)CompanyStatus.Enable).OrderBy(x=>x.Status).ToList();

                   // return View(jobs);
                }
                else
                {
                     jobs = _applicationDbContext.Job.Include(x => x.JobCategory).Include(x => x.Company).Where(x => x.Status != (int)JobStatusEnum.AdminDisabled && x.Company.ApplicationUserId == user.Id).OrderBy(x=>x.Status).ToList();
                           
                    
                   // return View(jobs);

                }

                foreach (var item in jobs)
                {
                    item.count = _applicationDbContext.StudentJobPost.Where(x => x.JobId == item.Id).Count();
                }
                
                return View(jobs);
            }
            catch
            {
                return View(jobs);
            }
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
                    ModelState.ClearValidationState("ClosingDate");
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
                job.Status = (int)JobStatusEnum.Active;
                if (IsUpdate)
                {
                    _applicationDbContext.Job.Update(job);
                }
                else
                {
                    _applicationDbContext.Job.Add(job);
                }

                _applicationDbContext.SaveChanges();

                TempData["JobCeated"] = "success";
                return RedirectToAction("Index");

            }
            else
            {
              
                if(model.ClosingDate==Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    ModelState.ClearValidationState("ClosingDate");
                    ModelState.AddModelError("ClosingDate", "Closing date cannot be empty!");
                }
               

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
        public async Task<ActionResult> CreateAsync(int Id = 0)
        {
            var id = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            var user = _applicationDbContext.Users.FirstOrDefault(x => x.Id == id);
            if (user.UserType != (int)UserTypeEnum.Admin)
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
            else
            {
                return RedirectToAction("Index");
            }
        }


        [HttpGet]
        public string Delete(int id)
        {
            var data = _applicationDbContext.Job.Where(x => x.Id == id).FirstOrDefault();
            data.Status = (int)JobStatusEnum.Expired;
            _applicationDbContext.Job.Update(data);
            _applicationDbContext.SaveChanges();
            return "success";
        }

        public async Task<IActionResult> JobApplications(int id)
        {
            try
            {
                Job job = await _applicationDbContext.Job.FirstOrDefaultAsync(x => x.Id == id);
                JobApplicationViewModel model = new JobApplicationViewModel();
                model.StudentJobPost = await _applicationDbContext.StudentJobPost.Include(x => x.Job).Where(x => x.JobId == id).ToListAsync();
                model.files = new List<FileModel>();
                ViewBag.Title = job.Position;
                return View(model);

            }
            catch
            {
                return null;
            }
          

        }

        public async Task<IActionResult> ApplicationDetails(int id)
        {
            StudentJobPost model = await _applicationDbContext.StudentJobPost.FirstOrDefaultAsync(x => x.Id == id);
            return View(model);

        }


        [HttpGet]
        public async Task<IActionResult> DownloadAll()
        {
            try
            {


                int i = 0;
                var studentPost = await _applicationDbContext.StudentJobPost.ToListAsync();
                if (studentPost.Count > 0)
                {


                    foreach (var item in studentPost)
                    {
                        i++;
                        var client = new HttpClient();
                        var result = await client.GetAsync(item.CV);
                        byte[] filecontent = await result.Content.ReadAsByteArrayAsync();
                        string filepath = "TempCV/CV" + i + ".pdf";
                        System.IO.File.WriteAllBytes(filepath, filecontent);

                    }
                    string startupPath = System.IO.Directory.GetCurrentDirectory();
                    string[] fileEntries = Directory.GetFiles(startupPath + "\\TempCV");
                    using (ZipFile zip = new ZipFile())
                    {
                        zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                        zip.AddDirectoryByName("Student CV List");
                        foreach (var file in fileEntries)
                        {

                            zip.AddFile(file, "Student CV List");

                        }
                        string zipName = String.Format("Students_CV_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));

                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            zip.Save(memoryStream);

                            foreach (var item in fileEntries)
                            {
                                System.IO.File.Delete(item);
                            }
                            return File(memoryStream.ToArray(), "application/zip", zipName);
                        }

                    }
                }
                else
                {
                    return null;
                }
            }catch
            {
                return null;
            }
        }

        [HttpPost]
        [Route("DownloadSelected")]
        public async Task<string> DownloadSelected(string[] data)
        {

            int i = 0;
            //var studentPost = await _applicationDbContext.StudentJobPost.ToListAsync();
            List<string> studentPost = new List<string>();
            foreach (var item in data)
            {
             var res= await _applicationDbContext.StudentJobPost.Where(x => x.Id == Convert.ToInt32(item)).FirstOrDefaultAsync();
                studentPost.Add(res.CV);
            }


            foreach (var item in studentPost)
            {
                i++;
                var client = new HttpClient();
                var result = await client.GetAsync(item);
                byte[] filecontent = await result.Content.ReadAsByteArrayAsync();
                string filepath = "TempCV/CV" + i + ".pdf";
                System.IO.File.WriteAllBytes(filepath, filecontent);

            }
            string startupPath = System.IO.Directory.GetCurrentDirectory();
            string[] fileEntries = Directory.GetFiles(startupPath + "\\TempCV");
            using (ZipFile zip = new ZipFile())
            {
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Student CV List");
                foreach (var file in fileEntries)
                {

                    zip.AddFile(file, "Student CV List");

                }
                string zipName = String.Format("Students_CV_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    zip.Save(memoryStream);
                    foreach (var item in fileEntries)
                    {
                        System.IO.File.Delete(item);
                    }
                    return Convert.ToBase64String(memoryStream.ToArray(), 0, memoryStream.ToArray().Length);
                   
                }
            }

           
        }

        public string ChangeState(int id,int status)
        {
            var data = _applicationDbContext.Job.Where(x => x.Id == id).FirstOrDefault();
            if(data.Status != (int)JobStatusEnum.Expired)
            {
                data.Status = status;
            }
            _applicationDbContext.Job.Update(data);
            _applicationDbContext.SaveChanges();
            return "success";
        }


    }
}
