using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Models
{
    public class JobApplicationViewModel
    {
        public List<StudentJobPost> StudentJobPost { get; set; }

        public List<FileModel> files { get; set; }

        public List<int> Ids { get; set; }
    }
}
