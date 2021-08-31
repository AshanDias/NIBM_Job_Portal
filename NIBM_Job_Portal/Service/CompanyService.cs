using NIBM_Job_Portal.Interface;
using NIBM_Job_Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NIBM_Job_Portal.Service
{
    public class CompanyService : ICompanyService
    {
        private readonly ApplicationDbContext _dbContext;
        public CompanyService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public Company GetCompany(int Id)
        {
            return _dbContext.Company.FirstOrDefault(x => x.Id == Id);
        }

        public void UpdateCompany(Company company)
        {
            _dbContext.Company.Update(company);
            _dbContext.SaveChanges();
        }
    }
}
