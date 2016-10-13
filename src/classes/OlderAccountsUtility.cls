public class OlderAccountsUtility 
{
	public static void updateOlderAccounts()
    {
		List<Account> lstAccounts = [ select description from account order by createddate asc limit 5 ];
		for( account acc : lstAccounts )
            acc.description = 'Heritage Account';
        update lstAccounts;
    }
}