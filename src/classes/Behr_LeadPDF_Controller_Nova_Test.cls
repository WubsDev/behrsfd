@isTest(SeeAllData=true)
private class Behr_LeadPDF_Controller_Nova_Test { 
      /*
      *@name testViewPDF_ErrorScenario()
      *@return void 
       *@description This method for viewPDF () In CLASS Behr_LeadPDF_Controller.cls
       *This scenario is used for showing error in the PDF page, by making the email of the Lead as NULL.
      */
    
      static testMethod void  testViewPDF_ErrorScenario(){ 
            User stdUser = UtilNovaUnitTest.getUser();
            Lead  leadNovaTest   = UtilNovaUnitTest.getLead();
            leadNovaTest.Email = Null;
            update leadNovaTest;
            ApexPages.StandardController ctr = new ApexPages.StandardController(leadNovaTest );
            Behr_LeadPDF_Controller behr_LeadPDF_ControllerTest  =  new  Behr_LeadPDF_Controller(ctr);
            Test.startTest();
            Test.setCurrentPage(Page.Create_PDF_Lead);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = behr_LeadPDF_ControllerTest.viewPDF();
                  Test.stopTest();
                  System.assert(pagereferenceTest!=null);
            }
      }  
      /*
      *@name testViewPDF_Scenario1()
      *@return void 
       *@description This method for viewPDF () In CLASS Behr_LeadPDF_Controller.cls
      */
      static testMethod void  testViewPDF_Scenario1(){ 
            User stdUser = UtilNovaUnitTest.getUser();
            Lead  leadNovaTest   = UtilNovaUnitTest.getLead();
            ApexPages.StandardController ctr = new ApexPages.StandardController(leadNovaTest );
            Behr_LeadPDF_Controller behr_LeadPDF_ControllerTest  =  new  Behr_LeadPDF_Controller(ctr);
            Test.startTest();
            Test.setCurrentPage(Page.Create_PDF_Lead);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = behr_LeadPDF_ControllerTest.viewPDF();
                  Test.stopTest();
                  System.assert(pagereferenceTest!=null);
            }
      }
      /*
      *@name testSavePdf_Scenario1()
      *@return void 
       *@description This method for savePdf () In CLASS Behr_LeadPDF_Controller.cls
      */
      static testMethod void  testSavePdf_Scenario1(){ 
            User stdUser = UtilNovaUnitTest.getUser();
            Lead  leadNovaTest   = UtilNovaUnitTest.getLead();
            ApexPages.StandardController ctr = new ApexPages.StandardController(leadNovaTest );
            Behr_LeadPDF_Controller behr_LeadPDF_ControllerTest  =  new  Behr_LeadPDF_Controller(ctr);
            Test.startTest();
            Test.setCurrentPage(Page.Create_PDF_Lead);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = behr_LeadPDF_ControllerTest.savePdf();
                  Test.stopTest();
                  System.assert(pagereferenceTest!=null);
            }
      }
      /*
      *@name testCancel_Scenario1()
      *@return void 
       *@description This method for Cancel () In CLASS Behr_LeadPDF_Controller.cls
      */
      static testMethod void  testCancel_Scenario1(){ 
            User stdUser = UtilNovaUnitTest.getUser();
            Lead  leadNovaTest   = UtilNovaUnitTest.getLead();
            ApexPages.StandardController ctr = new ApexPages.StandardController(leadNovaTest );
            Behr_LeadPDF_Controller behr_LeadPDF_ControllerTest  =  new  Behr_LeadPDF_Controller(ctr);
            Test.startTest();
            Test.setCurrentPage(Page.Create_PDF_Lead);
            System.runAs(stdUser) {
                  PageReference pagereferenceTest = behr_LeadPDF_ControllerTest.Cancel();
                  Test.stopTest();
                  System.assert(pagereferenceTest!=null);
            }
      }
}