using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;
using NIBM_Job_Portal.Models;
using NIBM_Job_Portal.Models.User;
using System.Text;
using System.Text.Encodings.Web;
using Microsoft.EntityFrameworkCore;

namespace NIBM_Job_Portal.Controllers
{

    public class AccountController : Controller
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<Register> _logger;
        private readonly IEmailSender _emailSender;
        private readonly ApplicationDbContext _applicationDbContext;
        public string ReturnUrl { get; set; }
        public IList<AuthenticationScheme> ExternalLogins { get; set; }
        public AccountController(
             UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            ILogger<Register> logger,
            IEmailSender emailSender,
            ApplicationDbContext applicationDbContext
            )
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            _applicationDbContext = applicationDbContext;

        }


        [HttpGet]
        [Route("Identity/[controller]/Register")]

        public async Task<IActionResult> Register(string returnUrl = null)
        {
            ReturnUrl = returnUrl;

            return View();
        }

        [HttpPost]
        [Route("OnPost")]
        public async Task<IActionResult> OnPostAsync(Register register, string returnUrl = null)
        {

            returnUrl ??= Url.Content("~/");
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = register.Email, Email = register.Email };
                var result = await _userManager.CreateAsync(user, register.Password);
                if (result.Succeeded)
                {
                    _logger.LogInformation("User created a new account with password.");
                    await _signInManager.SignInAsync(user, isPersistent: false);
                    return RedirectToAction("Index", "Home");
                }
                else
                { 
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                    return View("Register");
                } 
            }

            ModelState.AddModelError(string.Empty, "Invalid user details.");
            return View("Register");
        }

        [HttpGet]
        [Route("Identity/[controller]/Login")]
        public async Task<IActionResult> Login()
        {
            
            return View();
        }

        [HttpPost]
        [Route("OnLogin")]
        public async Task<IActionResult> OnLogin(Login login)
        {

            if (ModelState.IsValid)
            {
                Company company = await _applicationDbContext.Company.Where(x => x.Email == login.Email).FirstOrDefaultAsync();
                if (company!=null && company.IsEnable != 0)
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

        [HttpPost]
        [Route("Logout")]
        public async Task<IActionResult> Logout()
        {
           await _signInManager.SignOutAsync();
            return RedirectToAction("Login","Account");
        }


        public ActionResult ForgotPassword()
        {            
            return View();
        }

        public ActionResult ResetPassword()
        {
            return View();
        }


    }
}
