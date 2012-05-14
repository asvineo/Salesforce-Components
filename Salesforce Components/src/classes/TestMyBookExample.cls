@isTest

private class TestMyBookExample 
{
    static testMethod void ValidateMyBookExample()
    {
        Book__c b = new Book__c(name = 'Angels and Demons',Price__c = 100);
        System.debug('The price of the book before insert:' + b.Price__c);
        
        insert b;
        
        b = [select Price__c from Book__c where name like 'Angels%'];
        System.debug('The price of the book after insert:' + b.Price__c);
        
        System.assertEquals(90,b.Price__c); 
    }
}