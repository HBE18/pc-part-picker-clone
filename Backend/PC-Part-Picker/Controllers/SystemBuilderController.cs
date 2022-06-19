using Microsoft.AspNetCore.Mvc;
using PC_Part_Picker.Models;

namespace PC_Part_Picker.Controllers
{
	[ApiController]
	[Route("systemBuilder")]
	public class SystemBuilderController : Controller
	{
		private readonly ILogger<SystemBuilderController> _logger;

		public SystemBuilderController(ILogger<SystemBuilderController> logger)
		{
			_logger = logger;
		}

		[HttpGet("motherboards")]
		public ActionResult<MOTHERBOARD> GetMOTHERBOARD()
		{
			MOTHERBOARD m = new MOTHERBOARD();
			m.MotherBoard_ID = Guid.NewGuid();
			m.Manufacturer = "m1";
			m.MotherBoard_Socket = "mbs1";
			m.Chipset = "c1";
			m.MemorySlot_Count = 1;
			m.Memory_Frequency = 1;
			m.SoundCard = null;
			m.PCIe_Version = 4;
			m.PCIe_Max = "1";
			m.M2_Count = 0;
			m.SATA_Count = 0;
			m.USB_Version = 0;
			m.Memory_Type = "ddr1";
			m.Form_Factor = "atx";
			m.Name = "mb1";
			m.Price = 125;
				
			return m;
		}

		[HttpGet("cpus")]
		public ActionResult<CPU> GetCPUS()
		{
			CPU m = new CPU();
			m.CPU_ID = Guid.NewGuid();
			m.Manufacturer = "m1";
			m.Socket = "s1";
			m.CoreCount = 2;
			m.Frequency = 1;
			m.CacheSize = 1;
			m.CoolerInc = true;
			m.TDP = 4;
			m.Family = "corei1";
			m.Architecture = null;
			m.ModelNo = "md1";
			m.BoostFrequency = 0;
			m.Name = "cpu1";
			m.Price = 125;

			return m;
		}
	}
}

