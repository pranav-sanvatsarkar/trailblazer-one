@isTest
private class AnimalsCalloutsTest
{
    @isTest
    static void testGetCallOut()
    {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse result = AnimalsCallouts.makeGetCallout();
        system.assertNotEquals(null, result, 'The callout returned a null response');
        system.assertEquals(200, result.getStatusCode());
        system.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'));
        Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        system.assertNotEquals(0, animals.size());
    }
    @isTest
    static void testPostCallOut()
    {
        AnimalsHttpCalloutMock mock = new AnimalsHttpCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = AnimalsCallouts.makePostCallout();
        system.assertNotEquals(null,response);
        HttpRequest request = new HttpRequest();
        response = mock.respond(request);
    }
}