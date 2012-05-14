trigger InternalToTCSTrig on Account (before insert,before update) 
{
    //Query for the Account record types
    for(Account a: Trigger.new)
    {
        try
        {
            List<RecordType> rtypes = [Select Name From RecordType
            where sObjectType='Account' and isActive=true and Id =:a.RecordTypeId];
            
            for(RecordType rt: rtypes)
            {
        
                if(rt.Name == 'Internal To TCS' && a.Type == 'Internal To TCS')
                {
                    System.debug('Record Type Name: ' + rt.Name);
                    a.BillingStreet = 'YANTRA PARK';
                    a.BillingCity = 'MUMBAI';
                    a.BillingState = 'MAHARASHTRA';
                    a.BillingCountry = 'INDIA';
                    a.Fax = '223120';
                    a.Phone = '2230175';
                    a.Website = 'http://www.tcs.com';
                }    
            }
        }
        catch(Exception e)
        {
            System.debug('Error description: '+ e.getMessage());
            Error_Log__c err = new Error_Log__c(Error_Description__c = e.getMessage(),Errored_Date__c = System.today(),Record_ID__c = a.ID); 
            insert err;
        }   
    }
}