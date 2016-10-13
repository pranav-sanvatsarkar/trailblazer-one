public class ContactAndLeadSearch 
{
	public static List<List<sObject>> searchContactsAndLeads( String searchParam )
    {
        List<List<sObject>> lstSOQLResult = [ find :searchParam in name fields returning contact(firstname,lastname), lead(firstname,lastname) ];
        if( lstSOQLResult != null && !lstSOQLResult.isEmpty() && !lstSOQLResult[0].isEmpty() )
            return lstSOQLResult;
        else 
            return null;
    }
}