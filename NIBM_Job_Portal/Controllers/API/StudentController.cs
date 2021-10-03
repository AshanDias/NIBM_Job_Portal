using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NIBM_Job_Portal.Models.API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        [HttpPost]
        [Route("register")]
        public StudentRequest register(StudentRequest request)
        {
            return null;
        }

    }
}
