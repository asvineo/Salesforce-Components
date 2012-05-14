trigger No_Of_Contacts_Trig on Contact (after insert) {

List<Contact> accountsWithContacts = [select Id,Account.Name from Contact where Id IN :Trigger.newMap.keySet()];
for(Contact a: accountsWithContacts){
try
{
    System.debug('Contact AccountName:' + a.Account.Name); 
    Account acct = [select No_Of_Contacts__c from Account where Name = :a.Account.Name];
    System.debug('Contact AccountValue:' + acct.No_Of_Contacts__c);
    acct.No_Of_Contacts__c = acct.No_Of_Contacts__c + 1;
    update acct;
}
catch(Exception e)
{
    System.debug('Error description: '+ e.getMessage());
    Error_Log__c err = new Error_Log__c(Error_Description__c = e.getMessage(),Errored_Date__c = System.today(),Record_ID__c = a.ID); 
    insert err;
}   
    }
}