public class StringArrayTest 
{
	public static List<String> generateStringArray( Integer stringCount )
    {
        List<String> lstStrings = new List<String>();
        for( Integer iCount = 0; iCount < stringCount; iCount++ )
            lstStrings.add('Test ' + iCount);
        return lstStrings;
    }
}