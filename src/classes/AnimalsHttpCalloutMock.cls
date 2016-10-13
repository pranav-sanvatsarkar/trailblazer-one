@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock
{
	global HttpResponse respond( HttpRequest request )
    {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setBody('{"animals":["monkey","donkey","cat","dog"]}');
        response.setStatusCode(200);
        return response;
    }
}