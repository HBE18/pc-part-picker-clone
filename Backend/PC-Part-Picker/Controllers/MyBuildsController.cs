using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using PC_Part_Picker.Models;
using System.Data;

namespace PC_Part_Picker.Controllers
{
	[EnableCors("cors_allow")]
	[ApiController]
	[Route("myBuilds")]
	public class MyBuildsController : Controller
	{
		private readonly ILogger<MyBuildsController> _logger;
		private SqlConnection _connection;

		public MyBuildsController(ILogger<MyBuildsController> logger)
		{
			_logger = logger;
			string connectionString = "Data Source=localhost;Initial Catalog=P3_DB;User ID=ppp_user;Password=123456;Encrypt=False;";
			_connection = new SqlConnection(connectionString);
			_connection.Open();
		}

		[EnableCors("cors_allow")]
		[HttpGet]
		public IEnumerable<string> GetBuild([FromQuery] string uID)
		{
			SqlCommand command = new SqlCommand();
			command.CommandText = "SELECT Name FROM [LT_COMMON].[BUILD] WHERE User_ID= @uID";
			command.Connection = _connection;
			command.Parameters.AddWithValue("@uID", new Guid(uID));
			SqlDataReader reader = command.ExecuteReader();
			var builds = new List<string>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					builds.Add(reader.GetString("Name"));
				}
			}
			return builds;
		}
		[EnableCors("cors_allow")]
		[HttpGet("/myBuild")]
		public IEnumerable<string> GetMyBuild([FromQuery] string uID, [FromQuery] string name)
		{
			SqlCommand command = new SqlCommand();
			command.CommandText = "SELECT Name FROM [LT_COMMON].[BUILD] WHERE User_ID= @uID AND Name = @name";
			command.Connection = _connection;
			command.Parameters.AddWithValue("@uID", new Guid(uID));
			command.Parameters.AddWithValue("@name", name);
			SqlDataReader reader = command.ExecuteReader();
			var builds = new List<string>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					builds.Add(reader.GetString("Name"));
				}
			}
			return builds;
		}
	}
}