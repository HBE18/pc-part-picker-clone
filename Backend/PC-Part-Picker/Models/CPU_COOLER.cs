namespace PC_Part_Picker.Models;

public class CPU_COOLER
{
	public Guid Cooler_ID { get; set; }
	public string Name { get; set; }
	public string Manufacturer { get; set; }
	public byte[]? Image { get; set; }
	public double Price { get; set; }
	public int Fan_Size { get; set; }
	public string Type { get; set; }
	public int Max_TDP { get; set; }
	public int Fan_Count { get; set; }
	public int Noise { get; set; }
}
