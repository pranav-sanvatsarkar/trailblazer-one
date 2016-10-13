public class SMSUtils
{
	@future (callout=true)
    public static void procAsync( String name )
    {
        system.debug('Sync: ' + name);
    }
    public static void procSync( String name )
    {
        system.debug('Sync: ' + name);
        procAsync( name );
    }
}