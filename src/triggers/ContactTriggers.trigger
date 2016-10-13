trigger ContactTriggers on Contact (after insert, after update) 
{
	system.debug('Inside contact trigger - list size: ' + Trigger.New.size());
	Set<Id> setAccIds = new Set<Id>();
    for( Contact contact : trigger.New )
        setAccIds.add( contact.AccountId );
    List<Id> lstAccIds = new List<Id>();
    lstAccIds.addAll(setAccIds);
	if( System.isBatch() )
	{
	    Queueble_Apex__c queueable = Queueble_Apex__c.getValues('UpdateAccountsQueueable');
	    if( queueable != null )
	    {
			List<AsyncApexJob> lstAsyncJobs = [ SELECT TotalJobItems, JobType FROM AsyncApexJob WHERE Status = 'Processing' AND JobType = 'BatchApex' ];
			if( !lstAsyncJobs.isEmpty() && ( queueable.Pending_Processes__c == null || queueable.Pending_Processes__c < 1 ) )
			{
				queueable.Pending_Processes__c = lstAsyncJobs[0].TotalJobItems;
				update queueable;
			}
			if( queueable.Pending_Processes__c > 0 )
			{
			    UpdateAccountsQueueable updtAccnts = new UpdateAccountsQueueable(lstAccIds);
			    System.enqueueJob(updtAccnts);
			    queueable.Pending_Processes__c -= 1;
			    update queueable;
			}
		}
    }
    else if( System.isFuture() )
    {
    	Queueble_Apex__c queueable = Queueble_Apex__c.getValues('UpdateAccountsQueueable');
    	if( queueable != null )
    	{
    		if( queueable.Pending_Processes__c == null || queueable.Pending_Processes__c < 1 )
    		{
    			queueable.Pending_Processes__c = 1;
				update queueable;
    		}
    		if( queueable.Pending_Processes__c > 0 )
			{
			    UpdateAccountsQueueable updtAccnts = new UpdateAccountsQueueable(lstAccIds);
			    System.enqueueJob(updtAccnts);
			    queueable.Pending_Processes__c -= 1;
			    update queueable;
			}
    	}
    }
    else
    {
    	AccountProcessor.countContacts(lstAccIds);
    }
}