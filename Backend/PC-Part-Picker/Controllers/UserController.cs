using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using PC_Part_Picker.Models;
using PC_Part_Picker.Services;
using System.Data;

namespace PC_Part_Picker.Controllers
{
    [EnableCors("cors_allow")]
    [ApiController]
    [Route("user")]
    public class UserController : Controller
    {

        private readonly ILogger<UserController> _logger;
        private readonly SqlConnection _connection;
        UserService userService;

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
            string connectionString = "Data Source=localhost;Initial Catalog=P3_DB;User ID=ppp_user;Password=123456;Encrypt=False;";
            _connection = new SqlConnection(connectionString);
            _connection.Open();
            userService = new UserService(_connection);
        }

        [EnableCors("cors_allow")]
        [HttpGet]
        public async Task<ActionResult> GetUser(string email, string password)
        {
            string result = await userService.LogIn(email, password);
            if (result.Equals("Password not matched") || result.Equals("There is no such an email."))
            {
                return BadRequest(result);
            }
            else
            {
                return Ok(result);
            }
        }

        [EnableCors("cors_allow")]
        [HttpPost]
        public async Task<ActionResult> PostUser(string email, string password)
        {
            bool result = await userService.SignIn(email, password);
            if (result)
            {
                return Ok();
            }
            else
            {
                return BadRequest("An error occured");
            }
        }
    }
}
