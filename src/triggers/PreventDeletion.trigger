trigger PreventDeletion on Account (before delete) 
{
	List<Account> lstAccounts = [ select Name, ( Select Name from Opportunities ) from Account where Id in: Trigger.OldMap.keySet() ];
    for( Account accOuter : lstAccounts )
    {
        for( Account accInner : Trigger.Old )
        {
            if( accOuter.Id == accInner.Id && accOuter.Opportunities.size() > 0 )
                accInner.addError('Sorry, you cannot delete this account!');
        }
    }
}