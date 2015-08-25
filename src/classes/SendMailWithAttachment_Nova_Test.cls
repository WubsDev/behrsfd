@isTest(SeeAllData=true)
private class SendMailWithAttachment_Nova_Test { 
      /*
      *@name testSendMail_Scenario1()
      *@return void 
       *@description This method for SendMail () In CLASS SendMailWithAttachment.cls
      */
      static testMethod void  testSendMail_Scenario1(){ 
            User stdUser = UtilNovaUnitTest.getUser();
            Case  caseNovaTest   = UtilNovaUnitTest.getCase();
            caseNovaTest.Behr_Representative__c = stdUser.Id;
            insert caseNovaTest;          
            
            ApexPages.StandardController ctr = new ApexPages.StandardController(caseNovaTest );
            SendMailWithAttachment sendMailWithAttachmentTest  =  new  SendMailWithAttachment(ctr);
            Test.startTest();
            Test.setCurrentPage(Page.EmailUser);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = sendMailWithAttachmentTest.SendMail();
                  Test.stopTest();
                  System.assert(pagereferenceTest != null);
            }
      }
      /*
      *@name testCancel_Scenario1()
      *@return void 
       *@description This method for Cancel () In CLASS SendMailWithAttachment.cls
      */
      static testMethod void  testCancel_Scenario1(){ 
            User stdUser = UtilNovaUnitTest.getUser();
            Case  caseNovaTest   = UtilNovaUnitTest.getCase();
            caseNovaTest.Behr_Representative__c = stdUser.Id;
            insert caseNovaTest;
            
            ApexPages.StandardController ctr = new ApexPages.StandardController(caseNovaTest );
            SendMailWithAttachment sendMailWithAttachmentTest  =  new  SendMailWithAttachment(ctr);
            Test.startTest();
            Test.setCurrentPage(Page.EmailUser);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = sendMailWithAttachmentTest.Cancel();
                  Test.stopTest();
                  System.assert(pagereferenceTest!=null);
            }
      }
}