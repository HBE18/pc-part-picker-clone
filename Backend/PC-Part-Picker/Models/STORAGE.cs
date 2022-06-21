namespace PC_Part_Picker.Models
{
    public class STORAGE
    {
        public Guid ID { get; set; }
        public string Name { get; set; }
        public string Manufacturer { get; set; }
        public byte[]? Image { get; set; }
        public double Price { get; set; }
    }
}
