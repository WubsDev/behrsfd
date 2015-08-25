@isTest(SeeAllData=true)
private class SendtoHDController_Nova_Test { 
      /*
      *@name testSendEmail_Scenario1()
      *@return void 
       *@description This method for SendEmail () In CLASS SendtoHDController.cls
      */
      static testMethod void  testSendEmail_Scenario1(){ 
            Test.startTest();
            User stdUser = UtilNovaUnitTest.getUser();
            Test_Utility_BehrClass testData = new Test_Utility_BehrClass();
            Quote  quoteNovaTest   = testData.insertQuote();
            PageReference startPage = new PageReference('/apex/SenttoHD?id='+quoteNovaTest.Id);
            Test.setCurrentPage(startPage);
            ApexPages.StandardController ctr = new ApexPages.StandardController(quoteNovaTest );
            SendtoHDController sendtoHDControllerTest  =  new  SendtoHDController(ctr);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = sendtoHDControllerTest.SendEmail();
                  Test.stopTest();
                  System.assert(pagereferenceTest!=null);
            }
      }
      /*
      *@name testCancel_Scenario1()
      *@return void 
       *@description This method for Cancel () In CLASS SendtoHDController.cls
      */
      static testMethod void  testCancel_Scenario1(){
            Test.startTest(); 
            User stdUser = UtilNovaUnitTest.getUser();
            Test_Utility_BehrClass testData = new Test_Utility_BehrClass();
            Quote  quoteNovaTest   = testData.insertQuote();
            PageReference startPage = new PageReference('/apex/SenttoHD?id='+quoteNovaTest.Id);
            Test.setCurrentPage(startPage);
            ApexPages.StandardController ctr = new ApexPages.StandardController(quoteNovaTest );
            SendtoHDController sendtoHDControllerTest  =  new  SendtoHDController(ctr);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = sendtoHDControllerTest.Cancel();
                  Test.stopTest();
                  System.assert(pagereferenceTest!=null);
            }
      }
}