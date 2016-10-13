public class CustomerPurchaseOrder implements PurchaseOrder
{
	public integer intDiscount { get; set; }
	public Double discount()
	{
		return 0.5;
	}
}