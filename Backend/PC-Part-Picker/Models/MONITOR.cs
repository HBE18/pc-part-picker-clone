namespace PC_Part_Picker.Models

public class MONITOR
{
    public Guid Monitor_ID { get; set; }
    public string Name { get; set; }
    public string Manufacturer { get; set; }
    public byte[]? Image { get; set; }
    public float Price { get; set; }
    public string Panel_Type { get; set; }
    public int Refresh_Rate { get; set; }
    public string Resolution { get; set; }
    public string? Sync { get; set; }
    public string Connection { get; set; }
    public int Brightness { get; set; }
    public bool Has_HDR { get; set; }
    public string? HDR_Version { get; set; }
    public float Screen_Size { get; set; }
}