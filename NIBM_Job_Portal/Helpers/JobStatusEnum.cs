using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Helpers
{
    public enum JobStatusEnum
    {
        Active=0,
        Expired= 1,
        AdminDisabled=2,
        Archived=3
    }

    public enum CompanyStatus {
        Enable=1,
        Disable=0
    }

    public enum UserTypeEnum
    {
        Admin=1,
        User=0
    }

}
