namespace PC_Part_Picker.Models;

public class PSU
{
    public Guid PSU_ID { get; set; }
    public string Name { get; set; }
    public string Manufacturer { get; set; }
    public byte[]? Image { get; set; }
    public double Price { get; set; }
    public string? Sertificate { get; set; }
    public int Wattage { get; set; }
    public bool Is_Modular { get; set; }
}