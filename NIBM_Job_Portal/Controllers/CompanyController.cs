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

        [HttpPost]
        public IActionResult UpdateCompany(Company company)
        {
            _comapnyService.UpdateCompany(company);
            return View();
        }

    }
}
