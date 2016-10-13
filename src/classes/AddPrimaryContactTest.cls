@isTest
public class AddPrimaryContactTest
{
	public static void setupTestData()
	{
		List<Account> lstAccount = new List<Account>();
		for( Integer iCount = 0; iCount < 100; iCount ++ )
		{
			Account acc = TestSObjectProvider.getAccount(('Account # ' + iCount));
			if( iCount < 50 )
				acc.BillingState = 'NY';
			else
				acc.BillingState = 'CA';
			lstAccount.add( acc );
		}
		Database.SaveResult[] svRslt = Database.insert(lstAccount);
		for( Database.SaveResult result : svRslt )
			system.assertNotEquals( result.isSuccess(), false );
	}
	public static testMethod void executeTest()
	{
		AddPrimaryContactTest.setupTestData();
		List<Account> accounts = [ Select Name from Account ];
		Contact contact = TestSObjectProvider.getContact( 'lastName', accounts[0].Id );
		Test.startTest();
			AddPrimaryContact addPrmryCntct = new AddPrimaryContact( contact, 'NY' );
			System.enqueueJob(addPrmryCntct);
		Test.stopTest();
	}
}