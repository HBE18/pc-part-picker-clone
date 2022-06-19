namespace PC_Part_Picker.Models

public class MOTHERBOARD
{
	public Guid MotherBoard_ID { get; set; }
	public string Manıfacturer { get; set; }
	public string MotherBoard_Socket { get; set; }
	public string Chipset { get; set; }
	public int MemorySlot_Count { get; set; }
	public int Memory_Frequency { get; set; }
	public string? SoundCard { get; set; }
	public float PCIe_Version { get; set; }
	public string PCIe_Max { get; set; }
	public int M2_Count { get; set; }
	public int SATA_Count { get; set; }
	public float USB_Version { get; set; }
	public byte[]? Image { get; set; }
	public string Memory_Type { get; set; }
	public string Form_Factor { get; set; }
	public string Name { get; set; }
	public float Price { get; set; }
}
