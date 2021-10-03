using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using NIBM_Job_Portal.Interface;
using MimeKit;
using System.Text;
using System.Text.Encodings.Web;

namespace NIBM_Job_Portal.Service
{
    public class EmailService : IEmailService
    {

        public Task Send(string email,string callbackUrl)
        {
            var fromAddress = new MailAddress("nibmjobportal@gmail.com", "NIBM Job Portal");
            var toAddress = new MailAddress(email, "User");
            const string fromPassword = "NibmJob2021";
            const string subject = "Subject";
          
          
            
            string body = "Please reset your password by <a href="+HtmlEncoder.Default.Encode(callbackUrl)+">clicking here</a>.";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            var builder = new BodyBuilder();
            builder.HtmlBody = body;
         
            try
            {
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = builder.ToMessageBody().ToString().Replace("Content-Type: text/html; charset=utf-8",""),
                    IsBodyHtml=true,
                    BodyEncoding= Encoding.ASCII
                 })
                {
                    smtp.Send(message);
                }
            }
            catch
            {

            }
           

            return Task.CompletedTask;
        }

        public Task SendOtp(string email, string otp)
        {
            var fromAddress = new MailAddress("nibmjobportal@gmail.com", "NIBM Job Portal");
            var toAddress = new MailAddress(email, "User");
            const string fromPassword = "NibmJob2021";
            const string subject = "Subject"; 

            string body = "Please use this OTP number for reset password <b>"+HtmlEncoder.Default.Encode(otp)+"</b>.";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            var builder = new BodyBuilder();
            builder.HtmlBody = body;

            try
            {
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = builder.ToMessageBody().ToString().Replace("Content-Type: text/html; charset=utf-8", ""),
                    IsBodyHtml = true,
                    BodyEncoding = Encoding.ASCII
                })
                {
                    smtp.Send(message);
                }
            }
            catch 
            {

            }


            return Task.CompletedTask;
        }

        public Task SendEmail(string email, string subject,string body)
        {
            var fromAddress = new MailAddress("nibmjobportal@gmail.com", "NIBM Job Portal");
            var toAddress = new MailAddress(email, "User");
            const string fromPassword = "NibmJob2021";


            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            var builder = new BodyBuilder();
            builder.HtmlBody = body;

            try
            {
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = builder.ToMessageBody().ToString().Replace("Content-Type: text/html; charset=utf-8", ""),
                    IsBodyHtml = true,
                    BodyEncoding = Encoding.ASCII
                })
                {
                    smtp.Send(message);
                }
            }
            catch 
            {

            }


            return Task.CompletedTask;
        }
    }
}
