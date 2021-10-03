using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NIBM_Job_Portal.Models;
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
        private readonly ApplicationDbContext _applicationDbContext;
        public StudentController(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        [HttpPost]
        [Route("register")]
        public IActionResult register(StudentRequest request)
        {
            try
            {
                Student model = new Student();
                model.nic = request.email;
                model.name = request.name;
                model.email = request.email;
                model.password = request.password;
                _applicationDbContext.Student.Add(model);
                _applicationDbContext.SaveChanges();
                return Ok(model);
            }
            catch
            {
                return StatusCode(500);
            }
            
        }

    }
}
