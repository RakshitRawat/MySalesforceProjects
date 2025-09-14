@SuppressWarnings('PMD.ApexDoc')
public with sharing class WrapperClass {
     public class Wrapper {
        @AuraEnabled
        public String Name;
        @AuraEnabled
        public String Id;
        @AuraEnabled
        public String Phone;
        @AuraEnabled
        public String AccountNumber;
        @AuraEnabled
        public Integer count;
    }
    @AuraEnabled(cacheable=true)
    public static List<Wrapper> getAllAccount() {
        List<Account> accList = [SELECT Id, Name, Type, AccountNumber, Phone, CreatedDate, 
                                        (SELECT Id FROM Contacts) 
                                 FROM Account limit 5] ;

        List<Wrapper> wrapperList = new List<Wrapper>();
        for (Account acc : accList) {
            Wrapper wrapperObj = new Wrapper();
            wrapperObj.Name = acc.Name;
            wrapperObj.Id = acc.Id;
            wrapperObj.Phone = acc.Phone;
            wrapperObj.AccountNumber = String.valueOf(acc.AccountNumber);
            wrapperObj.count = acc.Contacts.size();

            wrapperList.add(wrapperObj);
        }
        return wrapperList;
    }

    // **Inner Wrapper Class with @AuraEnabled Variables**
   
}