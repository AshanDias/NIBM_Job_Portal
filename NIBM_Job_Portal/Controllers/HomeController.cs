using Firebase.Auth;
using Firebase.Storage;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers
{
    [Authorize]
    
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly ApplicationDbContext _applicationDbContext;
        public HomeController(ILogger<HomeController> logger, IWebHostEnvironment webHostEnvironment, ApplicationDbContext applicationDbContext)
        {
            _logger = logger;
            _webHostEnvironment = webHostEnvironment;
            _applicationDbContext = applicationDbContext;
        }

        public IActionResult Index()
        {
            string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "Uploads\\images");
             var res=  User.FindFirst(ClaimTypes.NameIdentifier).Value; 
            var result = _applicationDbContext.Company.Include(x=>x.ApplicationUser).Where(x=>x.ApplicationUser.Id==res).FirstOrDefault();
            if (result != null)
            {
                CompanyViewModel model = new CompanyViewModel();
                model.Id = model.Id;
                model.Company_Name = result.Company_Name;
                model.Contact_No = result.Contact_No;
                model.Description = result.Description;
                model.Email = result.Email;
                model.IndustryId = result.IndustryId;
                model.JobCategoryId = result.JobCategoryId;
                model.Website = result.Website;
                return View(model);
            }
            else
            {
                return View();
            }
                
           
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [HttpPost]
        [Route("SaveData")]
        public async Task<IActionResult> SaveData(CompanyViewModel model)
        {
            string imageUrl = await UploadFileToFirebase(model); 
            if (ModelState.IsValid)
            {
                var res = User.FindFirst(ClaimTypes.NameIdentifier).Value;
                Company company = new Company();
                company.Company_Name = model.Company_Name; 
                company.Email = model.Email;
                company.Image = imageUrl;
                company.ApplicationUserId = res;
                company.Description = model.Description;
                company.Website = model.Website;
                company.Contact_No = model.Contact_No;
                company.JobCategoryId = model.JobCategoryId;
                company.IndustryId = model.IndustryId;

                //_applicationDbContext.Company.Add(company);

                //var updateCompany = _applicationDbContext.Company.Where(x => x.ApplicationUserId == res).FirstOrDefault();
                 

                //_applicationDbContext.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Invalid details attempt.");
                return RedirectToAction("Index");

            }
            
        }


        [HttpPost]
        public async Task<IActionResult> UpdateData(CompanyViewModel model)
        {

            //if (ModelState.IsValid)
            //{

                var company = _applicationDbContext.Company.Where(x => x.Id == model.Id).FirstOrDefault();
                if (company != null)
                {
                string ImageUrl =await UploadFileToFirebase(model);
                    company.Company_Name = model.Company_Name;
                    company.Email = model.Email;
                    company.Image = ImageUrl;
                    company.Description = model.Description;
                    company.Website = model.Website;
                    company.Contact_No = model.Contact_No;
                    company.JobCategoryId = model.JobCategoryId;
                    company.IndustryId = model.IndustryId;

                    _applicationDbContext.Company.Update(company);
                    _applicationDbContext.SaveChanges();

                }

                return RedirectToAction("Index");
            //}
            //else
            //{
            //    ModelState.AddModelError(string.Empty, "Invalid details attempt.");
            //    return RedirectToAction("Index");

            //}

        }


        public async Task<string> UploadFileToFirebase(CompanyViewModel model)
        {
           
          
            var data = getByteStream(model.Image);
            MemoryStream memoryStream = new MemoryStream(data);

            string ext = System.IO.Path.GetExtension(model.Image.FileName);
            var auth = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDx-J0q-QE4CVP_UpZxYMmJ04QKewtIVB8"));
            var a = await auth.SignInWithEmailAndPasswordAsync("ashandias.info@gmail.com", "Test@123");

            var canceltoken = new CancellationToken();
            var downloadUrl =await new FirebaseStorage("nibmjobportal.appspot.com")
                                .Child("company").Child("company_logo").Child(model.Image.FileName).PutAsync(memoryStream, canceltoken);

            return downloadUrl.Trim();
        }

        public byte[] getByteStream(IFormFile iFormfile) {
            byte[] baseString = null;
            using (var ms = new MemoryStream())
            {
                iFormfile.CopyTo(ms);
                 baseString = ms.ToArray();
            }

            return baseString;

        }


        //TO upload old way
        //public string UploadedFile(CompanyViewModel model)
        //{
        //    string uniqueFileName = null;
        //    string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "Uploads\\images");
        //     uniqueFileName = Guid.NewGuid().ToString() + "_" + model.Image.FileName;
        //    string filePath = Path.Combine(uploadsFolder, uniqueFileName);
        //    using (var fileStream = new FileStream(filePath, FileMode.Create))
        //    {
        //        model.Image.CopyTo(fileStream);
        //    }

        //    return uniqueFileName;
        //}

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
