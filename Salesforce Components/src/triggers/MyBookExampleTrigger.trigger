trigger MyBookExampleTrigger on Book__c (before insert) {
Book__c[] books = Trigger.new;
MyBookExample.ApplyDiscount(books);

}