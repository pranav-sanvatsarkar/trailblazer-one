public class UpdateAccountsQueueable implements Queueable
{
	private List<Id> LstAccountIds;
	public UpdateAccountsQueueable( List<Id> lstAccountIds )
	{
		this.LstAccountIds = lstAccountIds;
	}
	public void execute( QueueableContext context )
	{
		system.debug('Inside Queueable context: ' + LstAccountIds.size());
		if( LstAccountIds != null && !LstAccountIds.isEmpty() )
		{
			Map<Id, Integer> mapAccIdContactCount;
	        List<Contact> lstContacts = [ Select AccountId From Contact where AccountId IN: LstAccountIds  ];
	        if( !lstContacts.isEmpty() )
	        {
	        	for( Contact con : lstContacts )
	            {
	                Integer iCount = 0;
	                if( mapAccIdContactCount == null )
	                	mapAccIdContactCount = new Map<Id, Integer>();
	        		if( mapAccIdContactCount.get( con.AccountId ) != null )
	                	iCount = (Integer) mapAccIdContactCount.get( con.AccountId );
	            	iCount++;
	                mapAccIdContactCount.put( con.AccountId, iCount );	
	            }
	        }
	        if( mapAccIdContactCount != null )
	        {
	        	List<Account> lstAccount = new List<Account>();
	        	for( Id accId : mapAccIdContactCount.keySet() )
	        	{
	        		Integer iCount = (Integer) mapAccIdContactCount.get( accId );
	                Account acc = new Account( Id = accId, Number_of_Contacts__c = iCount );
	                lstAccount.add(acc);        		
	        	}    
	        	update lstAccount;
	        }
		}
	}	
}