@isTest
private class Test_No_Of_Contacts_Trigger {

static testMethod void testContactInsert() {

  Contact a = new Contact(FirstName='Apex',LastName='Trig9',email='vinodh.mad@test.com');
  insert a;
  }
  }