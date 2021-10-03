using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models.API
{
    public class CVDocsRequest
    {
        public string document_url { get; set; }
        public string file_name { get; set; }
        public string alias { get; set; }
        public string added_date { get; set; }
        public int id { get; set; }
    }
}
