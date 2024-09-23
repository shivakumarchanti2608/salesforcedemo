public with sharing class CTPersonController {
   
    public static String getToken(String mobileNo){
        Blob mobileValueBlog = Blob.valueOf(mobileNo);
        Blob mobileBlog = Crypto.generateDigest('MD5', mobileValueBlog);
        String personMobileToken = EncodingUtil.base64Encode(mobileBlog);

        return personMobileToken;
    }

    public static List<Person__c> getRecentHealthChanges(){
        List<Person__c> people = [SELECT Id, Token__c, Mobile__c, CreatedDate, Name, Status_Update_Date__c, Health_Status__c  FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        return people;
    } 

    public static List<Person__c> searchPeople(String term){
        term = term + '%';
        List <Person__c> getResult = [SELECT Id, Token__c, Mobile__c, CreatedDate, Name, Status_Update_Date__c, Health_Status__c  FROM Person__c WHERE Name LIKE :term OR Token__c LIKE :term OR Mobile__c LIKE :term ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        return getResult;
    }


    public static Person__c getPerson(String PersonId){
         List <Person__c> reqPerson = [SELECT Id, Token__c, Mobile__c, CreatedDate, Name, Status_Update_Date__c, Health_Status__c  FROM Person__c WHERE Id= :PersonId];

         if (reqPerson != null && reqPerson.size() >0) {
            return reqPerson[0];    
         }
         return null;
    }


}