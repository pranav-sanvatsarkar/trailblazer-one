public class BatchUtility implements Database.Batchable<sObject> 
{
    public String strQuery;
    public Database.QueryLocator start( Database.BatchableContext context )
    {
        if( strQuery != null )
        	return Database.getQueryLocator('Select name from Contact');
        else
            return null;
    }
	public void execute( Database.BatchableContext context, List<sObject> objects )
    {
    	system.debug('Size of records: ' + objects.size());
        update objects;
    }
    public void finish( Database.BatchableContext context )
    {
        
    }
}