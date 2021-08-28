using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Interface
{
    public interface ICompanyService
    {
        void UpdateCompany(Company company);
    }
}
