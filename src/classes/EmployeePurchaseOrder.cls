public class EmployeePurchaseOrder implements PurchaseOrder
{
	public double dbDiscount { get; set; }
	public Double discount()
	{
		return 0.10;
	}
}