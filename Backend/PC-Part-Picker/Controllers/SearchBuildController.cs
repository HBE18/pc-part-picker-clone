using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using PC_Part_Picker.Models;
using System.Data;

namespace PC_Part_Picker.Controllers
{
	[EnableCors("cors_allow")]
	[ApiController]
	[Route("buildSearch")]
	public class SearchBuildController : Controller
	{
		private readonly ILogger<SearchBuildController> _logger;
		private SqlConnection _connection;

		public SearchBuildController(ILogger<SearchBuildController> logger)
		{
			_logger = logger;
			string connectionString = "Data Source=localhost;Initial Catalog=P3_DB;User ID=ppp_user;Password=123456;Encrypt=False;";
			_connection = new SqlConnection(connectionString);
			_connection.Open();
		}

		[EnableCors("cors_allow")]
		[HttpGet("all")]
		public IEnumerable<string> GetAllBuilds()
		{
			string query = "SELECT Name FROM [LT_COMMON].[BUILD]";
			SqlCommand command = new SqlCommand(query, _connection);
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
		[HttpGet]
		public IEnumerable<string> GetBuild([FromQuery] string name)
		{
			string query = "SELECT Name FROM [LT_COMMON].[BUILD] WHERE Name=\'" + name + "\'";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader =  command.ExecuteReader();
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