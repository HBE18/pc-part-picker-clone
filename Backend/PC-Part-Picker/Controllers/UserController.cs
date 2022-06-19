using Microsoft.AspNetCore.Mvc;
using PC_Part_Picker.Models;

namespace PC_Part_Picker.Controllers
{
    [ApiController]
    [Route("users")]
    public class UserController : Controller
    {
        public class User
        {
            public string username { get; set; }
            public string password { get; set; }
        }

        private readonly ILogger<UserController> _logger;

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public string login_user(User us) 
        {
            string un = us.username;
            string pw = us.password;

            return un + "____" + pw;
        }
    }
}
