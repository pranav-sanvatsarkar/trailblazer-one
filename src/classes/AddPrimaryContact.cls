public class AddPrimaryContact implements Queueable
{
	private String stateAbbr;
	private Contact contact;
	public AddPrimaryContact( Contact contact, string stateAbbr )
	{
		this.stateAbbr = stateAbbr;
		this.contact = contact;
	}
	public void execute( QueueableContext context )
	{
		List<Account> lstAccounts = [ SELECT BillingState FROM Account WHERE BillingState =: stateAbbr LIMIT 200 ];
		List<Contact> lstContacts = new List<Contact>();
		for( Account account : lstAccounts )
		{
			lstContacts.add( contact.clone( false, false, false, false ) );
		}
		insert lstContacts;
	}
}