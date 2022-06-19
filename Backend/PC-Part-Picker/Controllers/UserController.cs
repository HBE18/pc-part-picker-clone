using Microsoft.AspNetCore.Mvc;
using PC_Part_Picker.Models;

namespace PC_Part_Picker.Controllers
{
    [ApiController]
    [Route("users")]
    public class UserController : Controller
    {
        public class user
        {
            public string uname { get; set; }
            public string pass { get; set; }
        }

        private readonly ILogger<UserController> _logger;

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public string login_user(user us) 
        {
            string un = us.uname;
            string pw = us.pass;

            return un + "____" + pw;
        }
    }
}
