namespace PC_Part_Picker.Models;

public class GPU
{
	public Guid GPU_ID { get; set; }
	public string Name { get; set; }
	public float Price { get; set; }
	public byte[]? Image { get; set; }
	public string Manufacturer { get; set; }
	public string Partner_Firm { get; set; }
	public string VRAM_Type { get; set; }
	public int VRAM_Volume { get; set; }
	public string Family { get; set; }
	public string Model { get; set; }
	public int Recommended_Power { get; set; }
	public int Core_Count { get; set; }
	public int Core_Frequency { get; set; }
	public int Boost_Frequency { get; set; }
	public int Memory_Bandwidth { get; set; }
	public int Memory_Frequency { get; set; }
}
