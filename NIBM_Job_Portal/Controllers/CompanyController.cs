using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using NIBM_Job_Portal.Interface;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers
{
    public class CompanyController : Controller
    {
        private readonly ICompanyService _comapnyService;
        private readonly IWebHostEnvironment webHostEnvironment;
        public CompanyController(ICompanyService comapnyService, IWebHostEnvironment hostEnvironment)
        {
            _comapnyService = comapnyService;
            webHostEnvironment = hostEnvironment;
        }

        [HttpGet]
        public IActionResult Index()
        {
           

            return View();
        }

        [HttpPost]
        public IActionResult UpdateCompany(Company company)
        {
            if (company.Logo_path != null)
            {
                //if (company.ExistingCompanyLogo != null)
                //{
                //    string filePath = Path.Combine(webHostEnvironment.WebRootPath, "Uploads", company.ExistingCompanyLogo);
                //    System.IO.File.Delete(filePath);
                //}

                company.Logo_path = ProcessUploadedFile(company);
            }
            _comapnyService.UpdateCompany(company);
            return View();
        }


        private string ProcessUploadedFile(Company company)
        {
            string uniqueFileName = null;

            //if (company.Logo_path != null)
            //{
            //    string uploadsFolder = Path.Combine(webHostEnvironment.WebRootPath, "Uploads");
            //    uniqueFileName = Guid.NewGuid().ToString() + "_" + company.CompanyLogo.FileName;
            //    string filePath = Path.Combine(uploadsFolder, uniqueFileName);
            //    using (var fileStream = new FileStream(filePath, FileMode.Create))
            //    {
            //        company.CopyTo(fileStream);
            //    }
            //}

            return uniqueFileName;
        }

    }
}
