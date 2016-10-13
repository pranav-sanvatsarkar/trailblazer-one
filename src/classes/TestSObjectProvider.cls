@isTest
public class TestSObjectProvider
{
	public static Account getAccount( String name )
	{
		return new Account( Name = name ); 
	}
	public static Contact getContact( String lastName, Id accountId )
	{
		return new Contact( LastName = lastName, AccountId = accountId );
	}
	public static Lead getLead( String lastName, String company, String status )
	{
		return new Lead( LastName = lastName, Company = company, Status = status );
	}
}