namespace PC_Part_Picker.Models;

public class BUILD
{
	public Guid Build_ID { get; set; }
	public Guid CPU_ID { get; set; }
	public Guid MotherBoard_ID { get; set; }
	public Guid Memory_ID { get; set; }
	public Guid? GPU_ID { get; set; }
	public Guid? Cooler_ID { get; set; }
	public Guid? M2_ID { get; set; }
	public Guid? SATA_ID { get; set; }
	public Guid? Monitor_ID { get; set; }
	public Guid? PSU_ID { get; set; }
	public Guid? Case_ID { get; set; }
	public Guid User_ID { get; set; }
	public float Price { get; set; }
}
