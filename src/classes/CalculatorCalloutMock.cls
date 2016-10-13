@isTest
global class CalculatorCalloutMock implements WebServiceMock
{
	global void doInvoke(
        Object stub,
        Object request,
        Map<String,Object> response,
		String endPoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    )
    {
        calculatorServices.doAddResponse response_x = new calculatorServices.doAddResponse();
        response_x.return_x = 3.0;
        response.put('response_x', response_x);
    }
}