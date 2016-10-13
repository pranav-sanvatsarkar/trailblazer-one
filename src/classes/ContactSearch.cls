public class ContactSearch 
{
	public static List<Contact> searchForContacts( String lastName, String postalCode )
    {
        List<Contact> lstContacts = [ select name from contact where lastname =: lastname and mailingpostalcode =: postalcode ];
        if( lstContacts != null && !lstContacts.isEmpty() )
            return lstContacts;
        else
            return null;
    }
}