global class AAReq {


    @InvocableVariable(required=false)
    @AuraEnabled
    global String appname;

    @InvocableVariable(required=false)
    @AuraEnabled
    global String packages;

    @InvocableVariable(required=false)
    @AuraEnabled
    global String whichDate;

    @InvocableVariable(required=false)
    @AuraEnabled
    global String filelocation;

}