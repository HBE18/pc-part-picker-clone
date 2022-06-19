namespace PC_Part_Picker.Models;

public class MEMORY
{
	public Guid Memory_ID { get; set; }
	public string Name { get; set; }
	public string Manufacturer { get; set; }
	public byte[]? Image { get; set; }
	public double Price { get; set; }
	public string Memory_Type { get; set; }
	public int Memory_Frequency { get; set; }
	public int Memory_Volume { get; set; }
	public int Memory_Count { get; set; }
	public string Latency { get; set; }
}
