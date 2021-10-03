using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        public async Task<IActionResult> Register(StudentRequest request)
        {
            try
            {
                Student model = new Student();
                model.nic = request.email;
                model.name = request.name;
                model.email = request.email;
                model.password = request.password;
               _applicationDbContext.Student.Add(model);
               await _applicationDbContext.SaveChangesAsync();
                return Ok(model);
            }
            catch
            {
                return StatusCode(500);
            }
            
        }


        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> Login(StudentRequest request)
        {
            bool IsUser =await _applicationDbContext.Student.Where(x => x.nic == request.nic && x.password == request.password).AnyAsync();
            if (IsUser)
            {
                var result =await _applicationDbContext.Student.Where(x => x.nic == request.nic && x.password == request.password).FirstOrDefaultAsync();
                return Ok(result);
            }
            else
            {
                return NotFound();
            }

        }


        [HttpPost]
        [Route("update")]
        public async Task<IActionResult> Update(StudentUpdateRequest request)
        {
            try
            {
                var result = await _applicationDbContext.StudentDetails.Where(x => x.StudentId == request.id).FirstOrDefaultAsync();
                result.GetType().GetProperty(request.key).SetValue(result, request.value);
                _applicationDbContext.StudentDetails.Update(result);
                await _applicationDbContext.SaveChangesAsync();
                return Ok("success");
            }
            catch
            {
                return NotFound();
            }
        }

        [HttpPost]
        [Route("profile")]
        public async Task<IActionResult> profile(int id,StudentRequest request)
        {
            try
            {
                var result = await _applicationDbContext.Student.FindAsync(id);
                result.name = request.name;
                result.email = request.email;
                _applicationDbContext.Student.Update(result);
                await _applicationDbContext.SaveChangesAsync();
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }
            
        }



    }
}
