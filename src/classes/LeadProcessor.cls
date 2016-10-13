public class LeadProcessor implements Database.Batchable<sObject>
{
	public Database.QueryLocator start( Database.BatchableContext bc )
	{
		String query = ' SELECT LeadSource FROM lead';
		return Database.getQueryLocator(query);
	}
	public void execute( Database.BatchableContext bc, List<Lead> scope )
	{
		for( Lead lead : scope )
			lead.LeadSource = 'Dreamforce';
		update scope;
	}
	public void finish( Database.BatchableContext bc )
	{}
}