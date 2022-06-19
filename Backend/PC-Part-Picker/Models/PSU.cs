namespace PC_Part_Picker.Models

public class PSU
{
    public PSU_ID { get; set; }
    public string Name { get; set; }
    public string Manufacturer { get; set; }
    public byte[]? Image { get; set; }
    public float Price { get; set; }
    public string? Sertificate { get; set; }
    public int Wattage { get; set; }
    public string Resolution { get; set; }
    public bool Is_Modular { get; set; }
}