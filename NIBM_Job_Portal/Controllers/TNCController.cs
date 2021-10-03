using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    public class TNCController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
