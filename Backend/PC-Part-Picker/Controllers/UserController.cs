using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using PC_Part_Picker.Models;
using System.Data;

namespace PC_Part_Picker.Controllers
{
    [ApiController]
    [Route("user")]
    public class UserController : Controller
    {

        private readonly ILogger<UserController> _logger;
        private readonly SqlConnection _connection;
        private USER user = new USER
        {
            User_ID = Guid.NewGuid(),
            email = "NULL",
            password = "NULL",
        };

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
            string connectionString = "Data Source=localhost;Initial Catalog=P3_DB;User ID=ppp_user;Password=123456;Encrypt=False;";
            _connection = new SqlConnection(connectionString);
            _connection.Open();
        }

        [EnableCors("cors_allow")]
        [HttpGet]
        public ActionResult GetUser(string email, string password)
        {
            string query = "SELECT * FROM USERS WHERE email=" + email;
            SqlCommand command = new SqlCommand(query, _connection);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string sys_password = reader.GetString("password");
                    if(sys_password.Equals(password))
                    {
                        user = new USER
                        {
                            User_ID = reader.GetGuid("User_ID"),
                            email = reader.GetString("email"),
                            password = reader.GetString("password")
                        };
                        return Ok();
                    }
                    else
                    {
                        return BadRequest("Password not matched");
                    }
                }
            }
            return BadRequest("No User");
        }

        [EnableCors("cors_allow")]
        [HttpGet("auth")]
        public ActionResult GetAuth()
        {
            if(!user.email.Equals("NULL") && !user.password.Equals("NULL"))
            {
                return Ok("User authenticated already");
            }
            else
            {
                return BadRequest("User not authenticated");
            }
        }

        [EnableCors("cors_allow")]
        [HttpPost]
        public ActionResult PostUser(string email, string password)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "INSERT INTO USERS (User_ID, email, password) VALUES (@guid, @email, @password)";
            command.Parameters.AddWithValue("@guid", Guid.NewGuid());
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@password", password);
            try
            {
                int recordsAffected = command.ExecuteNonQuery();
                return Ok(recordsAffected);
            }
            catch (SqlException e)
            {
                return BadRequest(e.Message);
            }

        }
    }
}
