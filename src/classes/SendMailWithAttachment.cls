/*Class Name: SendMailWithAttachment 
@Author Name: Prasanna C
@Purpose: This class has method to send Mail with credit application form attachment to the users
@Created Date: 1/12/2014
@Last modified by: Prasanna
@Last modified date: 3/12/2014 */
// Req 059
/*** Apex class written to Fetch the user information from the EmailUser VF page***/
public with sharing class SendMailWithAttachment {

    public String idService{get;set;}
    public Case caserecord{get;set;}
    User recipientUser;
    
    /*** Constructor for this class***/
    public SendMailWithAttachment(ApexPages.StandardController controller) {
        this.caserecord = (case)controller.getRecord();
    }
    
     /***Method to send mail to the user selected and redirecting to the case record***/
    public pagereference sendMail(){
    
        PageReference acctPage;
        try{
            recipientUser = [select id,Email from user where id =: caserecord.Behr_Representative__c limit 5];
            BEHR_QuotetoOrder_US.SendTestEmail1(recipientUser.Email,Label.Credit_Application_Form);
            acctPage = new ApexPages.StandardController(caserecord).view();
            acctPage.setRedirect(true);
        }
        catch(Exception e){
            caserecord.addError(Label.SendMail_Exception);
        }               
        return acctPage;
    }
    
    /***Method to cancel the action and redirecting to the case record***/
    public pagereference cancel(){
    
        PageReference acctPage;
        try{
            acctPage = new ApexPages.StandardController(caserecord).view();
            acctPage.setRedirect(true);
        }
        catch(Exception e){
            system.debug('Error message is'+ e.getMessage());
        }
        return acctPage;        
    }
}