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

                    StudentDetails obj = new StudentDetails();
                    obj.StudentId = model.Id;
                    _applicationDbContext.StudentDetails.Add(obj);
                    await _applicationDbContext.SaveChangesAsync();
                    return Ok(model);
                }
                else
                {
                    return StatusCode(401,"User Already Exist!");
                }
               
               
            }
            catch
            {
                return NotFound();
            }

        }


        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> Login(StudentRequest request)
        {
            StudentResponse response = new StudentResponse();
            response.Student = new Student();
            response.Category = new List<Category>();
            response.Skills = new List<Skills>();

            bool IsUser = await _applicationDbContext.Student.Where(x => x.nic == request.nic && x.password == request.password).AnyAsync();
            if (IsUser)
            {
                response.Student = await _applicationDbContext.Student.Where(x => x.nic == request.nic && x.password == request.password).FirstOrDefaultAsync();
                var res = await _applicationDbContext.StudentDetails.Where(x => x.StudentId == response.Student.Id).FirstOrDefaultAsync();

                if (res!=null && response.Student != null)
                {
                    response.git_url = res.github_url;
                    response.higst_ql = res.highest_qualification;
                    response.image_url = res.image_url;
                    response.likedin_url = res.linkedin_url;
                    response.qulified_year = res.qualified_year;
                    response.about = res.about;
                    if (res.categories != null)
                    {
                        var cat = res.categories.Split(',').ToList();
                        foreach (var item in cat)
                        {
                            Category categories = new Category();
                            categories.name = item;
                            response.Category.Add(categories);
                        }
                    }

                    if (res.skills != null)
                    {
                        var skil = res.skills.Split(',').ToList();
                        foreach (var item in skil)
                        {
                            Skills skills = new Skills();
                            skills.name = item;
                            response.Skills.Add(skills);
                        }
                    }
                   
                }
              
                return Ok(response);
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
                Responses responses = new Responses();
                responses.StatusCode = "200";
                responses.Message = "Success";
                return Ok(responses);
            }
            catch
            {
                return NotFound();
            }
        }

        [HttpPost]
        [Route("updateprofile")]
        public async Task<IActionResult> UpdateProfile(StudentFormRequest request)
        {
            try
            {
                Student student = await _applicationDbContext.Student.Where(x => x.Id == request.id).FirstOrDefaultAsync();
                student.name = request.name;
                student.email = request.email;
                _applicationDbContext.Student.Update(student);

                StudentDetails studentDetails = await _applicationDbContext.StudentDetails.Where(x => x.StudentId == request.id).FirstOrDefaultAsync();
                studentDetails.highest_qualification = request.highest_qualification;
                studentDetails.qualified_year = request.qualified_year;
                studentDetails.about = request.about;
                _applicationDbContext.StudentDetails.Update(studentDetails);

                await _applicationDbContext.SaveChangesAsync();

                Responses responses = new Responses();
                responses.StatusCode = "200";
                responses.Message = "Success";

                return Ok(responses);
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
        public async Task<IActionResult> password(string nic)
        {

            var result = await _applicationDbContext.Student.Where(x => x.nic == nic).FirstOrDefaultAsync();
            if (result != null)
            {
                string sRandomOTP = Helper.GenerateRandomOTP(4, saAllowedCharacters);
                await _emailService.SendOtp(result.email, sRandomOTP);
                PasswordResetResponse res = new PasswordResetResponse();
                res.email = result.email;
                res.otp = sRandomOTP;
                res.id = result.Id;
                return Ok(res);
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
            try
            {

                List<CategoriesResponse> categories = new List<CategoriesResponse>();
                var result = await _applicationDbContext.StudentDetails.Where(x => x.StudentId == id).FirstOrDefaultAsync();
                if (result != null)
                {
                    List<string> cat = result.categories.Split(',').ToList();
                    foreach (var item in cat)
                    {
                        int jobCount = 0;
                        var cat_id = await _applicationDbContext.JobCategory.Where(x => x.Name.Contains(item)).FirstOrDefaultAsync();
                        if (cat_id != null)
                        {
                            var count = await _applicationDbContext.Job.Where(x => x.JobCategoryId == cat_id.Id).CountAsync();
                            jobCount = count;
                        }
                        else
                        {
                            jobCount = 0;
                        }
                        CategoriesResponse res = new CategoriesResponse();
                        res.id = cat_id.Id;
                        res.count = jobCount;
                        res.name = item;
                        categories.Add(res);
                    }
                    return Ok(categories);
                }
                else
                {
                    return NotFound();
                }
            }
            catch
            {
                return NotFound();
            }


        }


         [HttpGet]
        [Route("skills")]
        public async Task<IActionResult> skills(int id)
        {
            try
            {


                List<SkillsResponse> skillsResponses = new List<SkillsResponse>();
                var result = await _applicationDbContext.StudentDetails.Where(x => x.StudentId == id).FirstOrDefaultAsync();
                if (result != null)
                {
                    List<string> skills = result.skills.Split(',').ToList();
                    foreach (var item in skills)
                    {
                        SkillsResponse res = new SkillsResponse();
                        res.name = item;
                        skillsResponses.Add(res);
                    }
                    return Ok(skillsResponses);
                }
                else
                {
                    return NotFound();
                }
            }
            catch
            {
                return NotFound();
            }

        }




    }
}
