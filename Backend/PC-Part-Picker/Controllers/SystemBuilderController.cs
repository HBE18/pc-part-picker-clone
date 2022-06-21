using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using PC_Part_Picker.Models;
using System.Data;

namespace PC_Part_Picker.Controllers
{
	[EnableCors("cors_allow")]
	[ApiController]
	[Route("systemBuilder")]
	public class SystemBuilderController : Controller
	{
		private readonly ILogger<SystemBuilderController> _logger;
		private readonly SqlConnection _connection;

		public SystemBuilderController(ILogger<SystemBuilderController> logger)
		{
			_logger = logger;
			string connectionString = "Data Source=localhost;Initial Catalog=P3_DB;User ID=ppp_user;Password=123456;Encrypt=False;";
			_connection = new SqlConnection(connectionString);
			_connection.Open();
		}

		[EnableCors("cors_allow")]
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

		[HttpGet("coolers")]
		public IEnumerable<CPU_COOLER> GetCoolers()
		{
			string query = "SELECT * FROM CPU_COOLER";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var coolers = new List<CPU_COOLER>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					CPU_COOLER cooler = new CPU_COOLER
					{
						Cooler_ID = reader.GetGuid("Cooler_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Fan_Size = reader.GetInt32("Fan_Size"),
						Type = reader.GetString("Type"),
						Max_TDP = reader.GetInt32("Max_TDP"),
						Fan_Count = reader.GetInt32("Fan_Count"),
						Noise = reader.GetInt32("Noise")


					};
					coolers.Add(cooler);
				}
			}
			return coolers;
		}

		[HttpGet("memories")]
		public IEnumerable<MEMORY> GetMemory()
		{
			string query = "SELECT * FROM Memory";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var memories = new List<MEMORY>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					MEMORY memory = new MEMORY
					{
						Memory_ID = reader.GetGuid("Memory_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Memory_Type = reader.GetString("Memory_Type"),
						Memory_Frequency = reader.GetInt32("Memory_Frequency"),
						Memory_Volume = reader.GetInt32("Memory_Volume"),
						Memory_Count = reader.GetInt32("Memory_Count"),
						Latency = reader.GetString("Latency")


					};
					memories.Add(memory);
				}
			}
			return memories;
		}

		[HttpGet("gpus")]
		public IEnumerable<GPU> GetGpus()
		{
			string query = "SELECT * FROM GPU";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var gpus = new List<GPU>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					GPU gpu = new GPU
					{
						GPU_ID = reader.GetGuid("GPU_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Partner_Firm = reader.GetString("Partner_Firm"),
						VRAM_Type = reader.GetString("VRAM_Type"),
						VRAM_Volume = reader.GetInt32("VRAM_Volume"),
						Family = reader.GetString("Family"),
						Model = reader.GetString("Model"),
						Recommended_Power = reader.GetInt32("Recommended_Power"),
						Core_Count = reader.GetInt32("Core_Count"),
						Core_Frequency = reader.GetInt32("Core_Frequency"),
						Boost_Frequency = reader.GetInt32("Boost_Frequency"),
						Memory_Bandwidth = reader.GetInt32("Memory_Bandwidth"),
						Memory_Frequency = reader.GetInt32("Memory_Frequency")


					};
					gpus.Add(gpu);
				}
			}
			return gpus;
		}

		[HttpGet("cases")]
		public IEnumerable<CASE> GetCases()
		{
			string query = "SELECT * FROM CCase";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var cases = new List<CASE>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					CASE c = new CASE
					{
						CASE_ID = reader.GetGuid("Case_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Form_Factor = reader.GetString("Form_Factor"),
						Fan_Size = reader.GetInt32("Fan_Size"),
						Fan_Count = reader.GetInt32("Fan_Count"),
						PSU_Inc = reader.GetBoolean("PSU_Inc"),
						TemperedGlassPanel_Inc = reader.GetBoolean("TemperedGlassPanel_Inc"),
						RGB_Inc = reader.GetBoolean("RGB_Inc")
					};
					cases.Add(c);
				}
			}

			return cases;
		}


		[HttpGet("psus")]
		public IEnumerable<PSU> GetPsus()
		{
			string query = "SELECT * FROM PSU";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var psus = new List<PSU>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					PSU psu = new PSU
					{
						PSU_ID = reader.GetGuid("PSU_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Sertificate = reader.GetString("Sertificate"),
						Wattage = reader.GetInt32("Wattage"),
						Is_Modular = reader.GetBoolean("Is_Modular")
					};
					psus.Add(psu);
				}
			}
			return psus;
		}

		[HttpGet("monitors")]
		public IEnumerable<MONITOR> GetMonitors()
		{
			string query = "SELECT * FROM Monitor";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var monitors = new List<MONITOR>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					MONITOR monitor = new MONITOR
					{
						Monitor_ID = reader.GetGuid("Monitor_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Panel_Type = reader.GetString("Panel_Type"),
						Refresh_Rate = reader.GetInt32("Refresh_Rate"),
						Resolution = reader.GetString("Resolution"),
						Sync = reader.GetString("Sync"),
						Connection = reader.GetString("Connection"),
						Brightness = reader.GetInt32("Brightness"),
						Has_HDR = reader.GetBoolean("Has_HDR"),
						Screen_Size = reader.GetDouble("Screen_Size")
					};
					monitors.Add(monitor);
				}
			}
			return monitors;
		}

		[HttpGet("storages")]
		public IEnumerable<Object> GetStorages()
		{
			string query = "SELECT * FROM M2";
			SqlCommand command = new SqlCommand(query, _connection);
			SqlDataReader reader = command.ExecuteReader();
			var storages = new List<Object>();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					M2 m2 = new M2
					{
						M2_ID = reader.GetGuid("M2_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Volume = reader.GetInt32("Volume"),
						Read_Speed = reader.GetInt32("Read_Speed"),
						Write_Speed = reader.GetInt32("Write_Speed"),
						PCIe_Version = reader.GetDouble("PCIe_Version")
					};
					storages.Add(m2);
				}
			}
			reader.Close();
			query = "SELECT * FROM SATA";
			command = new SqlCommand(query, _connection);
			reader = command.ExecuteReader();
			if (reader.HasRows)
			{
				while (reader.Read())
				{
					SATA sata = new SATA
					{
						SATA_ID = reader.GetGuid("SATA_ID"),
						Name = reader.GetString("Name"),
						Manufacturer = reader.GetString("Manufacturer"),
						Price = reader.GetDouble("Price"),
						Volume = reader.GetInt32("Volume"),
						Read_Speed = reader.GetInt32("Read_Speed"),
						Write_Speed = reader.GetInt32("Write_Speed")
					};
					storages.Add(sata);
				}
			}
			return storages;
		}


		[HttpPost()]
		public ActionResult postBuild(Guid userID, Guid price,Guid cpuID, Guid coolerID, Guid motherboardID, Guid memoryID, STORAGE storage, Guid gpuID, Guid caseID, Guid psuID, Guid monitorID)
		{
			string storageType = storage is M2 ? "M2_ID" : "SATA_ID";
			SqlCommand command = new SqlCommand();
			command.CommandText = "INSERT INTO BUILD (" +
                "Build_ID, " +
                "CPU_ID, " +
                "Cooler_ID, " +
                "MotherBoard_ID, " +
                "Memory_ID, " + 
				storageType + 
				", GPU_ID, " +
                "Case_ID, " +
                "PSU_ID, " +
                "Monitor_ID, " +
                "User_ID, " +
                "Price) " +
                "VALUES (@buildID, @cpuID, @coolerID, @motherboardID, @memoryID, @storageID, @gpuID, @caseID, @psuID, @monitorID, @userID, @price)";
			command.Parameters.AddWithValue("@buildID", Guid.NewGuid());
			command.Parameters.AddWithValue("@cpuID", cpuID);
			command.Parameters.AddWithValue("@coolerID", coolerID);
			command.Parameters.AddWithValue("@motherboardID", motherboardID);
			command.Parameters.AddWithValue("@memoryID", memoryID);
			command.Parameters.AddWithValue("@storageID", storageType.Equals("M2_ID") ? (storage as M2).M2_ID : (storage as SATA).SATA_ID);
			command.Parameters.AddWithValue("@gpuID", gpuID);
			command.Parameters.AddWithValue("@caseID", caseID);
			command.Parameters.AddWithValue("@psuID", psuID);
			command.Parameters.AddWithValue("@monitorID", monitorID);
			command.Parameters.AddWithValue("@userID", userID);
			command.Parameters.AddWithValue("@price", price);
			
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

