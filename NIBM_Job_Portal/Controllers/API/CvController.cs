using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class CvController : ControllerBase
    {

        private readonly ApplicationDbContext _applicationDbContext;

        public CvController(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        [HttpPost]
        [Route("save")]
        public async Task<IActionResult> Save(CVDocsRequest request)
        {
            try
            {
                CVDocs model = new CVDocs();
                model.added_date = request.added_date;
                model.alias = request.alias;
                model.document_url = request.document_url;
                model.file_name = request.file_name;
                model.StudentId = request.id;

                _applicationDbContext.CVDocs.Add(model);
                await _applicationDbContext.SaveChangesAsync();


                return Ok(request);
            }
            catch
            {
                return StatusCode(500);
            }

        }

        [HttpGet]
        [Route("getallcv")]
        public async Task<IActionResult> GetAllCv(int id)
        {
            try
            {
                List<string> vcs = new List<string>();
                var students = await _applicationDbContext.CVDocs.Where(x => x.StudentId == id).ToListAsync();
                foreach (var item in students)
                {
                    vcs.Add(item.document_url);
                }
                return Ok(vcs);
            }
            catch
            {
                return StatusCode(500);
            }

        }

    }
}
