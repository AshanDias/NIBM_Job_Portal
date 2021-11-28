using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NIBM_Job_Portal.Interface;
using NIBM_Job_Portal.Models.API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Controllers.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmailController : ControllerBase
    {

        private readonly IEmailService _emailService;
        public EmailController(IEmailService emailService)
        {
            _emailService = emailService;
        }

        [HttpPost]
        [Route("send")]
        public async Task<IActionResult> Send(EmailRequest request)
        {
            try
            {

                await _emailService.SendEmail(request.reciever, request.email_subject, request.email_body);
                Responses response = new Responses();
                response.Message = "Success";
                response.StatusCode = "200";
                return Ok(response);
            }
            catch
            {
                return NotFound();
            }

        }
    }
}
