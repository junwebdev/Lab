using System;
using System.Web.Http;

namespace CreatingWebAPIService.Controllers
{
    public class HomeController : ApiController
    {
        [HttpPost]
        public bool AddEmpDetails()
        {
            return true;
            //write insert logic

        }
        [HttpGet]
        public string GetEmpDetails()
        {
            return "Vithal Wadje";

        }
        [HttpDelete]
        public string DeleteEmpDetails(string id)
        {
            return "Employee details deleted having Id " + id;

        }
        [HttpPut]
        public string UpdateEmpDetails(string Name)
        {
            return "Employee details Updated with Name " + Name;

        }
    }

}

