global class ProcessAA {
  
  @InvocableMethod(label='Process AA request')
  global static List<Boolean> processAARequest(List<AAReq> req) {
    
    List<Boolean> res = new List<Boolean>();       
    String body = '{"AppName":"' + req[0].appname + '", "packages":"' + req[0].packages + '", "whichDate":"' + req[0].whichDate + '", "filelocation":"' + req[0].filelocation + '"}';
    System.debug('Request body=' + body);
    
    CallAPI(body);    

    for(AAReq o : req){
        res.add(True);
    }
    return res;
  }

@future(callout=true)
public static void CallAPI(String reqbody){

    String contentType = 'application/json';        
       
    //Get Auth token
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setMethod('POST');
    req.setHeader('Content-Type', contentType);
    req.setEndpoint('callout:AppAnalytics');
    req.setBody(reqbody);
    
    HTTPResponse res = http.send(req);

    System.debug('API call Response-------');
    System.debug(res);
    String body = res.getBody();
    System.debug('API call Response Body ------');
    System.debug(body);

}


}