public class UpdateAccountsBatchable implements Database.Batchable<sObject>
{
	public List<Id> LstAccountIds;
	public Database.QueryLocator start( Database.BatchableContext context )
	{
		if( LstAccountIds != null )
		{
			List<sObject> lstContacts = [ Select AccountId From Contact where AccountId IN: LstAccountIds ];
			String strQuery = 'Select AccountId From Contact where AccountId IN (';
			Integer iCount = 0;
			for( Id accId : LstAccountIds )
			{
				if( iCount > 0 )
				{
					strQuery += ', ' + accId;
					if( ++iCount >= LstAccountIds.size() )
						strQuery += ')';
				}
				else
					strQuery += accId;
				iCount++;
			}
			return Database.getQueryLocator(strQuery);
		}
		else
			return null;
	}
	public void execute( Database.BatchableContext context, List<Contact> sObjects )
	{
		Map<Id, Integer> mapAccIdContactCount;
		if( !sObjects.isEmpty() )
        {
        	for( Contact con : sObjects )
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
	public void finish( Database.BatchableContext context )
	{}
}