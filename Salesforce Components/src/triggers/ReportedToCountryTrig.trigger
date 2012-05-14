trigger ReportedToCountryTrig on Contact (After insert) 
{
        List<Contact> ContactsWithAccounts = [select Id,Account.Name,Account.Reported_to_country__c from Contact where Id IN :Trigger.newMap.keySet()];
        for(Contact cont : ContactsWithAccounts)
        {
            try
            {
                System.debug('Reported_to_country__c: '+ cont.Account.Reported_to_country__c);
                cont.Reported_to_country__c = cont.Account.Reported_to_country__c;
                update cont;
            }
            catch(Exception e)
            {
                System.debug('Error description: '+ e.getMessage());
                Error_Log__c err = new Error_Log__c(Error_Description__c = e.getMessage(),Errored_Date__c = System.today(),Record_ID__c = cont.ID); 
                insert err;
            }   
        }

           
}