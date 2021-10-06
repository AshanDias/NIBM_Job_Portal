using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NIBM_Job_Portal.Helpers;
using NIBM_Job_Portal.Interface;
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
        private readonly IEmailService _emailService;
        string[] saAllowedCharacters = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
        public StudentController(ApplicationDbContext applicationDbContext, IEmailService emailService)
        {
            _applicationDbContext = applicationDbContext;
            _emailService = emailService;
        }

        [HttpPost]
        [Route("register")]
        public async Task<IActionResult> Register(StudentRequest request)
        {
            try
            {
                var result = await _applicationDbContext.Student.AnyAsync(x => x.nic == request.nic || x.email==request.email);
                if (!result)
                {
                    Student model = new Student();
                    model.nic = request.nic;
                    model.name = request.name;
                    model.email = request.email;
                    model.password = request.password;
                    _applicationDbContext.Student.Add(model);
                    await _applicationDbContext.SaveChangesAsync();
                    return Ok(model);
                }
                else
                {
                    return NotFound("User Already Exist!");
                }
               
               
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
            bool IsUser = await _applicationDbContext.Student.Where(x => x.nic == request.nic && x.password == request.password).AnyAsync();
            if (IsUser)
            {
                var result = await _applicationDbContext.Student.Where(x => x.nic == request.nic && x.password == request.password).FirstOrDefaultAsync();
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
        public async Task<IActionResult> profile(int id, StudentRequest request)
        {
            try
            {
                var result = await _applicationDbContext.Student.FindAsync(id);
                result.name = request.name != null ? request.name : result.name;
                result.email = request.email != null ? request.email : result.email;
                result.password = request.password != null ? request.password : result.password;
                _applicationDbContext.Student.Update(result);
                await _applicationDbContext.SaveChangesAsync();
                return Ok(result);
            }
            catch
            {
                return NotFound();
            }

        }

        [HttpGet]
        [Route("password")]
        public async Task<IActionResult> password(int id)
        {

            var result = await _applicationDbContext.Student.FindAsync(id);
            if (result != null)
            {
                string sRandomOTP = Helper.GenerateRandomOTP(4, saAllowedCharacters);
                await _emailService.SendOtp(result.email, sRandomOTP);
                
                return Ok(sRandomOTP);
            }
            else
            {
                return NotFound();
            }


        }


        [HttpGet]
        [Route("categories")]
        public async Task<IActionResult> categories(int id)
        {

            var result = await _applicationDbContext.StudentDetails.Where(x => x.StudentId == id).FirstOrDefaultAsync();
            if (result != null)
            {
                return Ok(result.categories.Split(',').ToArray());
            }
            else
            {
                return NotFound();
            }


        }


         [HttpGet]
        [Route("skills")]
        public async Task<IActionResult> skills(int id)
        {

            var result = await _applicationDbContext.StudentDetails.Where(x => x.StudentId == id).FirstOrDefaultAsync();
            if (result != null)
            {
                return Ok(result.skills.Split(',').ToArray());
            }
            else
            {
                return NotFound();
            }


        }




    }
}
