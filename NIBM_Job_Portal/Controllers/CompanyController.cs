using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NIBM_Job_Portal.Helpers;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers
{
    [Authorize]
    public class CompanyController : Controller
    {
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        public CompanyController(ApplicationDbContext applicationDbContext, UserManager<ApplicationUser> userManager)
        {
            _applicationDbContext = applicationDbContext;
            _userManager = userManager;
        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create()
        {
           AdminCompanyViewModel model = new AdminCompanyViewModel();
            model.Industry =await _applicationDbContext.Industry.ToListAsync();
            return View(model);
        }

        [HttpPost]
        [Route("onCreate")]
        public async Task<IActionResult> onCreate(AdminCompanyViewModel model)
        {
            model.Industry =await _applicationDbContext.Industry.ToListAsync();
            if (ModelState.IsValid)
            {
                //Create User

                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await _userManager.CreateAsync(user, model.DefaultPasssword);
                if (result.Succeeded)
                {
                    
                    Company company = new Company();
                    company.Company_Name = model.Company_Name;
                    company.IndustryId = model.IndustryId;
                    company.IsEnable = (int)CompanyStatus.Enable;
                    company.Email = model.Email;
                    company.ApplicationUserId = user.Id;
                    _applicationDbContext.Company.Add(company);
                    _applicationDbContext.SaveChanges();

                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "error");
                    return View("Create", model);
                }

            }
            else
            {
                ModelState.AddModelError("", "error");
            }
            

            return View("Create", model);
        }
    }
}
