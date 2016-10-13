//public class DailyLeadProcessor implements Schedulable
public class DailyLeadProcessor implements queueable
{
	/*
	origional
	public void execute( SchedulableContext context )
	{
		List<Lead> leads = [ SELECT LeadSource FROM Lead WHERE LeadSource =: null LIMIT 200 ];
		for( Lead lead : leads )
			lead.LeadSource = 'DreamForce';
		update leads;
	}
	*/
	/*
	modified for contactTrigger
	public void execute( SchedulableContext context )
	{
		List<Contact> lstContacts = [ SELECT FirstName FROM Contact LIMIT 200];
		update lstContacts;
	}
	*/
	public void execute( QueueableContext context )
	{
		List<Contact> lstContacts = [ SELECT FirstName FROM Contact LIMIT 200];
		update lstContacts;
	}
}