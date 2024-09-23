public with sharing class CTLocationTracingController {
  
    public static List<Person__c> getVisitors(String LocationId){
        List <Person__c> visitorsList = [SELECT Id, Name, Person__c, Location__c, Visit_Date__c FROM Location_Tracing__c where Location__c = :LocationId];
        return visitorsList;
    }

    public static List <Location__c> getLocationByPersonIDs(Set <Id> personIds){
        
    }


}