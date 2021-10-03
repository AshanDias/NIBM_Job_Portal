using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class CVDocs
    {
        public int Id { get; set; }
        public string document_url { get; set; }
        public string file_name { get; set; }
        public string alias { get; set; }
        public string added_date { get; set; }
        
        public int StudentId { get; set; }
        public Student Student { get; set; }
    }
}
