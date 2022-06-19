namespace PC_Part_Picker.Models;

public class SATA
{
	public Guid SATA_ID { get; set; }
	public string Name { get; set; }
	public string Manufacturer { get; set; }
	public byte[]? Image { get; set; }
	public double Price { get; set; }
	public int Volume { get; set; }
	public int Read_Speed { get; set; }
	public int Write_Speed { get; set; }
	public int? RPM { get; set; }
}
