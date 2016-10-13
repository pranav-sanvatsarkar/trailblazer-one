@isTest
public class LeadProcessorTest
{
	@testSetup
	static void setup()
	{
		List<Lead> lstLeads;
		for( Integer iCount = 0; iCount < 200; iCount ++ )
		{
			if( lstLeads == null )
				lstLeads = new List<Lead>();
			String leadName = 'lead-' + iCount;
			Lead leadObj = TestSObjectProvider.getLead( leadName , 'enzigma', 'Open - Not Contacted' );
			lstLeads.add(leadObj);
		}
		insert lstLeads;
		for( Lead leadObj : lstLeads )
			system.assertNotEquals( leadObj.Id, null );
	}
	
	static testMethod void test()
	{
		Test.startTest();
			LeadProcessor leadPro = new LeadProcessor();
			Id batchId = Database.executeBatch( leadPro );
		Test.stopTest();
	}
}