@isTest
public class DailyLeadProcessorTest
{
	public static void setupTestData()
	{
		List<Lead> lstLeads = new List<Lead>();
		for( Integer iCount = 0; iCount < 200; iCount++ )
		{
			lstLeads.add( TestSObjectProvider.getLead( 'Lead # ' + iCount, 'Test', 'Unqualified') );
		}
		insert lstLeads;
	}
	public static testMethod void unitTest()
	{
		DailyLeadProcessorTest.setupTestData();
		Test.startTest();
			DailyLeadProcessor leadProcessor = new DailyLeadProcessor();
			System.schedule('Daily Lead Processor', '0 0 12 1 1 ? *', leadProcessor );
		Test.stopTest();
	}
}