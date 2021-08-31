using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
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
            CompanyViewModel model = new CompanyViewModel();            
            model.Company_Name = result.Company_Name;
            model.Contact_No = result.Contact_No;
            model.Description = result.Description;
            model.Email = result.Email;
            model.IndustryId = result.IndustryId;
            model.JobCategoryId = result.JobCategoryId;
            model.Website = result.Website;        
            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [HttpPost]

        public IActionResult SaveData(CompanyViewModel model)
        {

            if (ModelState.IsValid)
            {
                var res = User.FindFirst(ClaimTypes.NameIdentifier).Value;
                string uniqueFileName = UploadedFile(model);
                Company company = new Company();
                company.Company_Name = model.Company_Name; 
                company.Email = model.Email;
                company.Image = uniqueFileName;
                company.ApplicationUserId = res;
                company.Description = model.Description;
                company.Website = model.Website;
                company.Contact_No = model.Contact_No;
                company.JobCategoryId = model.JobCategoryId;
                company.IndustryId = model.IndustryId;

                _applicationDbContext.Company.Add(company);

                var updateCompany = _applicationDbContext.Company.Where(x => x.ApplicationUserId == res).FirstOrDefault();
                 

                _applicationDbContext.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Invalid details attempt.");
                return RedirectToAction("Index");

            }
            
        }

        public string UploadedFile(CompanyViewModel model)
        {
            string uniqueFileName = null;
            string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "Uploads\\images");
             uniqueFileName = Guid.NewGuid().ToString() + "_" + model.Image.FileName;
            string filePath = Path.Combine(uploadsFolder, uniqueFileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                model.Image.CopyTo(fileStream);
            }

            return uniqueFileName;
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
