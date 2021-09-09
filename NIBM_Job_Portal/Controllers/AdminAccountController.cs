using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers
{
    public class AdminAccountController : Controller
    {
        public IActionResult Login()
        {
            return View();
        }
    }
}
