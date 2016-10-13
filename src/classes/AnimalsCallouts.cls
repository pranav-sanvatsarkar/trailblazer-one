public class AnimalsCallouts 
{
	public static HttpResponse makeGetCallout()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if( response.getStatusCode() == 200 )
        {
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            for( Object animal : animals )
                system.debug('Animal: ' + animal);
        }
        return response;
    }
    public static HttpResponse makePostCallout()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty-thor"}');
        HttpResponse response = http.send(request);
        if( response.getStatusCode() > 200 )
            system.debug('POST was successfull');
        else
            system.debug('POST failed');
        return response;
    }
}