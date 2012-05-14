trigger Reported_To_Country_Trig on Account (after update) 
{
    List<Account> accountsWithContacts = [select id, name,Reported_to_country__c,(select id,Reported_to_country__c from Contacts)
                                                                from Account where Id IN :Trigger.newMap.keySet()];

    List<Contact> contactsToUpdate = new List<Contact>{};
    // For loop to iterate through all the queried Account records
    for(Account a: accountsWithContacts)
    {
     // Use the child relationships dot syntax to access the related Contacts
         for(Contact c: a.Contacts)
         {
              System.debug('Contact Id: ' + c.Id + ' Reported_To_Country_Contact: ' + c.Reported_to_country__c);
              System.debug('Account Id: ' + a.Id + ' Reported_To_Country_Account: ' + a.Reported_to_country__c);
              c.Reported_to_country__c=a.Reported_to_country__c;
              contactsToUpdate.add(c);
         }
     }
     update contactsToUpdate;
}