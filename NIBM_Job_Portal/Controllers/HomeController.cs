using Firebase.Auth;
using Firebase.Storage;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using NIBM_Job_Portal.Helpers;
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
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var data = TempData["profile"];
            if (data != null)
            {
                ViewData["profile"] = "true";
            }
            var res = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            var users =await _applicationDbContext.Users.FindAsync(res);
             if (users.UserType == (int)UserTypeEnum.Admin)
            {
                return RedirectToActionPermanent("Dashboard", "Home");
            }
            ///string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "Uploads\\images");
            var jobCategories =await _applicationDbContext.JobCategory.ToListAsync();
            var industryList =await _applicationDbContext.Industry.ToListAsync();
            var result = await _applicationDbContext.Company.Include(x => x.ApplicationUser).Where(x => x.ApplicationUser.Id == res).FirstOrDefaultAsync();

            CompanyViewModel model = new CompanyViewModel();
            model.industryList = industryList;
            if (result != null)
            {
              
                model.Id = result.Id;
                model.Company_Name = result.Company_Name;
                model.Contact_No = result.Contact_No;
                model.Description = result.Description;
                model.Email = result.Email;
                model.IndustryId = result.IndustryId;
                model.Website = result.Website;
                model.Logo_path = result.Logo_path;
                model.Physical_Address = result.Physical_Address;
                return View(model);
            }
            else
            {
               
                return View(model);
            }
                
           
        }

        public IActionResult Privacy()
        {
            return View();
        }
 

        [HttpPost]
        public async Task<IActionResult> Index(CompanyViewModel model)
        {
            bool IsUpdate = false;
            if (ModelState.IsValid)
            {
                Company company = null;
                if (model.Id != 0)
                {
                    company = await _applicationDbContext.Company.FindAsync(model.Id);
                    IsUpdate = true;

                }
                else
                {
                    company = new Company();
                }
              
               
                var res = User.FindFirst(ClaimTypes.NameIdentifier).Value;
                if (model.Image != null)
                {
                    string imageUrl = await UploadFileToFirebase(model);
                    company.Logo_path = imageUrl;

                }
                else
                {
                    company.Logo_path = model.Logo_path;
                }
               
                company.Company_Name = model.Company_Name; 
                company.Email = model.Email;
                company.Physical_Address = model.Physical_Address;
                company.ApplicationUserId = res;
                company.Description = model.Description;
                company.Website = model.Website;
                company.IsEnable =(int) CompanyStatus.Enable;
                company.Contact_No = model.Contact_No;
                company.IndustryId = (int)model.IndustryId;

               

                if (IsUpdate)
                {
                    _applicationDbContext.Company.Update(company);
                }
                else
                {
                    _applicationDbContext.Company.Add(company);
                }

                _applicationDbContext.SaveChanges();
                TempData["profile"] = "success";
                return RedirectToAction("Index");
            }
            else
            {
                model.industryList =await _applicationDbContext.Industry.ToListAsync();
                return View(model);

            }
            
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



        public IActionResult Dashboard()
        {
            return View();
        }




    }
}
