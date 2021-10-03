using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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

    }
}
