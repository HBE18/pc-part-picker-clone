namespace PC_Part_Picker.Models

public class CPU
{
	public Guid CPU_ID { get; set; }
	public string Name { get; set; }
	public string Socket { get; set; }
	public int CoreCount { get ; set; }
	public float Frequency { get; set; }
	public string Manufacturer { get; set; }
	public float CacheSize { get; set; }
	public Boolean CoolerInc { get; set; }
	public int TDP { get; set; }
	public string? Family { get; set; }
	public string? Architecture { get; set; }
	public string? ModelNo { get; set; }
	public byte[]? Image { get; set; }
	public float BoostFrequency { get; set; }
	public float Price { get; set; }
}
