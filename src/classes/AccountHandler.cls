public class AccountHandler 
{
	public static Account insertNewAccount( String accName )
    {
        Account acc = new Account( Name = accName );
        Database.SaveResult svRslt = Database.insert(acc, false);
        if( svRslt.isSuccess() )
            return acc;
        else
            return null;
    }
}