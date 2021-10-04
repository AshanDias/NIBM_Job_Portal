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
using NIBM_Job_Portal.Interface;
using System.Security.Claims;
using NIBM_Job_Portal.Helpers;

namespace NIBM_Job_Portal.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    public class AccountController : Controller
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<Register> _logger;
        private readonly IEmailSender _emailSender;
        private readonly ApplicationDbContext _applicationDbContext;
        private readonly IEmailService _emailService;
        public string ReturnUrl { get; set; }
        public IList<AuthenticationScheme> ExternalLogins { get; set; }
        public AccountController(
             UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            ILogger<Register> logger,
            IEmailSender emailSender,
            ApplicationDbContext applicationDbContext,
            IEmailService emailService
            )
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            _applicationDbContext = applicationDbContext;
            _emailService = emailService;

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
                var user = new ApplicationUser { UserName = register.Email, Email = register.Email,UserType=(int)UserTypeEnum.Admin };
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
            Login login = new Login();
            return View(login);
        }

        [HttpPost]
        [Route("OnLogin")]
        public async Task<IActionResult> OnLogin(Login login)
        {

            if (ModelState.IsValid)
            {


                Company company = await _applicationDbContext.Company.Include(x => x.ApplicationUser).Where(x => x.Email == login.Email).FirstOrDefaultAsync();
                ApplicationUser applicationUser = null;
                if (company == null)
                {
                    applicationUser = await _userManager.FindByEmailAsync(login.Email);


                }

                if (applicationUser != null || (company != null && company.IsEnable != 0))
                {
                    var result = await _signInManager.PasswordSignInAsync(login.Email, login.Password, login.RememberMe, lockoutOnFailure: false);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                        return View("Login", login);
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


        public IActionResult ForgotPassword()
        {            
            return View();
        }


        [HttpPost]
        [Route("ForgotPasswordPost")]
        public async Task<IActionResult> ForgotPasswordPost(ForgotPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await _userManager.FindByEmailAsync(model.Email);
                if (user != null)
                {
                    var code = await _userManager.GeneratePasswordResetTokenAsync(user);
                    var callbackUrl = Url.Page(
                        "/Account/ResetPassword",
                        pageHandler: null,
                        values: new { area = "", code },
                        protocol: Request.Scheme);

                    callbackUrl = callbackUrl.Replace("ForgotPasswordPost", "ResetPassword");
                    callbackUrl += "&&email=" + model.Email;
                    await _emailService.Send(model.Email, callbackUrl);
                    ViewData["status"] = "Password Reset link sent to your email address. Please check your email!.";
                    return View("ForgotPassword");
                }
                else
                {
                    ModelState.AddModelError("","Invalid email address");
                    ViewData["error"] = "User not found! Please enter the correct email address.";
                    return View("ForgotPassword");
                }
                
            }
            else
            {
                ModelState.AddModelError("", "Invalid email address");

                return View("ForgotPassword");
            }
           
        }

        [HttpGet]

        public IActionResult ResetPassword(string code,string email)
        {
           
            ResetPasswordModel mode = new ResetPasswordModel();
            mode.Code = code;
            mode.Email = email;
            return View(mode);
        }

        [HttpPost]
        [Route("ResetPasswordPost")]
        public async Task<IActionResult> ResetPasswordPost(ResetPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await _userManager.FindByEmailAsync(model.Email);
                if (user == null)
                {
                    ModelState.AddModelError("", "User not found");
                    return RedirectToAction("ResetPassword", model);
                }

                var result = await _userManager.ResetPasswordAsync(user, model.Code, model.Password);
                if (result.Succeeded)
                {
                    return RedirectToAction("Login");
                }
                else
                {
                    ModelState.AddModelError("", "Unable reset password!");
                    return RedirectToAction("ResetPassword", model);
                }
              
            }
            else
            {
                ModelState.AddModelError("","Error");
                return RedirectToAction("ResetPassword", model);
            }
        }

        [HttpGet]
        [Route("MnageUser")]
        public bool  MnageUser()
        {
            var user = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            if (user != null)
            {


                var result = _applicationDbContext.Company.Where(x => x.ApplicationUserId == user && x.IsEnable == (int)CompanyStatus.Disable).Any();
                if (result)
                {
                    _signInManager.SignOutAsync();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }



    }
}
