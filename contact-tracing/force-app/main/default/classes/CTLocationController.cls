public with sharing class CTLocationController {
    
        public static List <Location__c > getRecentStatusChanges(){
            List <Location__c> recentLocations = [SELECT Id, Name, Red_Score__c, Status_Update_Date__c, Address__c, Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
            return recentLocations;
        }

        public static List<Location__c> searchLocations(String searchTerm){
            searchTerm = searchTerm + '%';
            List <Location__c> getAreas = [SELECT Id, Name, Red_Score__c,Pincode__c , Status_Update_Date__c, Address__c, Status__c FROM Location__c WHERE Address__c LIKE :searchTerm OR Address__c LIKE :searchTerm OR Pincode__c LIKE :searchTerm ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
            return getAreas;
        }
    
    
        public static Location__c getLocationById(String LocationId){
            
             List <Location__c> reqArea = [SELECT Id, Name, Red_Score__c, Status_Update_Date__c, Address__c, Status__c FROM Location__c WHERE Id = :LocationId ];
    
             if (reqArea != null && reqArea.size() >0) {
                return reqArea[0];    
             }
             return null;
        }
    
}