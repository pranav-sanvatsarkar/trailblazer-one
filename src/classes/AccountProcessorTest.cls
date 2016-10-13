@isTest
public class AccountProcessorTest 
{
	public static testMethod void countContactTest()
    {
    	Account accOne = TestSObjectProvider.getAccount( 'Sanvatsarkar' );
        insert accOne;
        system.assertNotEquals( accOne.Id, null );
        
    	Account accTwo = TestSObjectProvider.getAccount( 'Raut' );
        insert accTwo;
        system.assertNotEquals( accTwo.Id, null );
        
        Account accThree = TestSObjectProvider.getAccount( 'Shinde' );
        insert accThree;
        system.assertNotEquals( accThree.Id, null );
        
        List<Id> lstIds = new List<Id>();
        lstIds.add(accOne.Id);
        lstIds.add(accTwo.Id);
        lstIds.add(accTwo.Id);
        lstIds.add(accThree.Id);
        lstIds.add(accThree.Id);
        lstIds.add(accThree.Id);
        lstIds.add(accThree.Id);
        
        Contact conOne = TestSObjectProvider.getContact( 'Sanvatsarkar', accOne.Id );
        insert conOne;
        system.assertNotEquals( conOne.Id, null );
        
        Contact conTwo = TestSObjectProvider.getContact( 'Sanvatsarkar', accOne.Id );
        insert conTwo;
        system.assertNotEquals( conTwo.Id, null );
        
        Contact conThree = TestSObjectProvider.getContact( 'Sanvatsarkar', accOne.Id );
        insert conThree;
        system.assertNotEquals( conThree.Id, null );
        
        Contact conFour = TestSObjectProvider.getContact( 'Raut', accTwo.Id );
        insert conFour;
        system.assertNotEquals( conFour.Id, null );
        
        Test.startTest();
        	AccountProcessor.countContacts(lstIds);
        Test.stopTest(); 
    }
}