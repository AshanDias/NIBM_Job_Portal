using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NIBM_Job_Portal.Helpers;
using NIBM_Job_Portal.Models;
using NIBM_Job_Portal.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers
{
    public class AdminAccountController : Controller
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly UserManager<ApplicationUser> _userManager;
        public AdminAccountController(SignInManager<ApplicationUser> signInManager,
            ApplicationDbContext applicationDbContext, UserManager<ApplicationUser> userManager)
        {
            _signInManager = signInManager;
            _applicationDbContext = applicationDbContext;
            _userManager = userManager;
        }
        public IActionResult Login()
        {
            return View();
        }


        [HttpPost]
        [Route("AdminOnLogin")]
        public async Task<IActionResult> AdminOnLogin(Login login)
        {

            if (ModelState.IsValid)
            {
                
                Company company = await _applicationDbContext.Company.Include(x=>x.ApplicationUser).Where(x => x.Email == login.Email).FirstOrDefaultAsync();
                ApplicationUser applicationUser = null;
                if (company == null)
                {
                    applicationUser = await _userManager.FindByEmailAsync(login.Email);


                }

                if (applicationUser!=null || (company != null && company.IsEnable != 0))
                {
                    var result = await _signInManager.PasswordSignInAsync(login.Email, login.Password, login.RememberMe, lockoutOnFailure: false);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                        return View("Login");
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Unable to login. Please contact your admin");
                    return View("Login");
                }
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                return View("Login");
            }

        }

    }
}
