namespace PC_Part_Picker.Models;

public class CASE
{
	public Guid CASE_ID { get; set; }
	public string Name { get; set; }
	public string Manufacturer { get; set; }
	public byte[]? Image { get; set; }
	public double Price { get; set; }
	public string Form_Factor { get; set; }
	public int Fan_Size { get; set; }
	public int Fan_Count { get; set; }
	public bool PSU_Inc { get; set; }
	public int? Wattage { get; set; }
	public bool TemperedGlassPanel_Inc { get; set; }
	public bool RGB_Inc { get; set; }
}
