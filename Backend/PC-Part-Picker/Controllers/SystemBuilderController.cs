using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using PC_Part_Picker.Models;
using System.Data;

namespace PC_Part_Picker.Controllers
{
	[ApiController]
	[Route("systemBuilder")]
	public class SystemBuilderController : Controller
	{
		private readonly ILogger<SystemBuilderController> _logger;
		private readonly SqlConnection _connection;

		public SystemBuilderController(ILogger<SystemBuilderController> logger)
		{
			_logger = logger;
			string connectionString = "Data Source=PCRAGON;Initial Catalog=P3_DB;User ID=ppp_user;Password=123456;Encrypt=False;";
			_connection = new SqlConnection(connectionString);
			_connection.Open();
		}

		[HttpGet("motherboards")]
		public IEnumerable<MOTHERBOARD> GetMOTHERBOARD()
		{
			string query = "SELECT * FROM MOTHERBOARD";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var mbs = new List<MOTHERBOARD>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					MOTHERBOARD myMotherboard = new MOTHERBOARD
					{
						MotherBoard_ID = reader.GetGuid("MotherBoard_ID"),
						Manufacturer = reader.GetString("Manufacturer"),
						MotherBoard_Socket = reader.GetString("MotherBoard_Socket"),
						Chipset = reader.GetString("Chipset"),
						MemorySlot_Count = reader.GetInt32("MemorySlot_Count"),
						Memory_Frequency = reader.GetInt32("Memory_Frequency"),
						//SoundCard = (Convert.IsDBNull(reader.GetString("SoundCard"))) ? null : reader.GetString("SoundCard"),
						PCIe_Version = reader.GetDouble("PCIe_Version"),
						PCIe_Max = reader.GetString("PCIe_Max"),
						//Image = (Convert.IsDBNull(reader.GetValue("Image"))) ? null : (byte[])reader.GetValue("Image"),
						M2_Count = reader.GetInt32("M2_Count"),
						SATA_Count = reader.GetInt32("SATA_Count"),
						USB_Version = reader.GetDouble("USB_Version"),
						Memory_Type = reader.GetString("Memory_Type"),
						Form_Factor = reader.GetString("Form_Factor"),
						Name = reader.GetString("Name"),
						Price = reader.GetDouble("Price")
					};
					mbs.Add(myMotherboard);
				}
			}


			return mbs;
		}

		[HttpGet("cpus")]
		public IEnumerable<CPU> GetCPUS()
		{
			string query = "SELECT * FROM CPU";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var cpus = new List<CPU>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					CPU cpu = new CPU
					{
						CPU_ID = reader.GetGuid("CPU_ID"),
						Manufacturer = reader.GetString("Manufacturer"),
						Socket = reader.GetString("Socket"),
						CoreCount = reader.GetInt32("CoreCount"),
						Frequency = reader.GetDouble("Frequency"),
						CacheSize = reader.GetDouble("CacheSize"),
						CoolerInc = reader.GetBoolean("CoolerInc"),
						TDP = reader.GetInt32("TDP"),
						Family = reader.GetString("Family"),
						Architecture = reader.GetString("Architecture"),
						ModelNo = reader.GetString("ModelNo"),
						BoostFrequency = reader.GetDouble("BoostFrequency"),
						Name = reader.GetString("Name"),
						Price = reader.GetDouble("Price")
					};
					cpus.Add(cpu);
				}
			}
			return cpus;
		}
	}
}

