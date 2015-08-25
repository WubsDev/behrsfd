/*Class Name: SendtoHDController 
@Author Name: Prasanna C
@Purpose: This class has method to send Mail to HD on Send to HD button on Order Layout
@Created Date: 2/12/2014
@Last modified by: Prasanna
@Last modified date: 4/12/2014 */
/*** Apex class written to send mail to a static email with attachment***/
public class SendtoHDController {
    public String pdfName;
    Blob body;  
    public Quote quoteSource {get;set;}
    public List<QuoteLineItem> quoteLineItems {get; set;}    
    /*** Constructor method for this Apex class ***/
    public SendtoHDController(ApexPages.StandardController controller) {
      //  this.quoteSource = (quote)controller.getRecord();
        Id quoteId = ApexPages.CurrentPage().getParameters().get('id'); 
        SObject[] quoteTemp = [SELECT id, QuoteNumber,Rep_Name__c,Rep_Phone__c, Rep_Email__c, Order_Date__c, Type_Of_Order__c, Opportunity.THD_Store__r.Name,
                                 Account.name, Pro_Rewards__c, Project_Name__c, Opportunity.Primary_Contact__r.Name, Phone, Email, Special_Instructions__c,
                                 Requested_Delivery_Date__c, Name, CreatedBy.name,Ship_To_Name_PDF__c, ShippingStreet,ShippingCity,ShippingState,ShippingPostalCode,ShippingCountry,  
                                 (SELECT Id, Vendor__c,Use__c,Sheen__c, Base__c, Product__c, Product_ID__c, Color_Vendor__c, Color_Name_Code1__c,Size__c,Quantity FROM QuoteLineItems)
                                 FROM Quote WHERE id = :quoteId LIMIT 1];
        quoteLineItems = new List<QuoteLineItem>();
        List<Quote> quoteListTemp = (List<Quote>) quoteTemp;
        quoteSource = quoteListTemp[0];
        quoteLineItems = (List<QuoteLineItem>) quoteTemp.get(0).getSObjects('QuoteLineItems');
      
    }
    /*** Method to send email to static mail id with the visualforce template attachment***/
    public pagereference sendEmail() {  
        PageReference thePDF;  
        quoteSource.Sent_To_HD__c = True;
        PageReference acctPage;
        try{
            Database.update(quoteSource);
        }
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
       
        try{
            thePDF = Page.SenttoHD;
            thePDF.getParameters().put('id',quoteSource.Id);
            pdfName = 'SendToHD'+' '+System.Now()+ '.'+ 'pdf';
            try{
               body = thePDF.getContentAsPDF();
            }catch (VisualforceException e) {
               body = Blob.valueOf('PDF error');
            }
        
            //Accessing Email id from 'Behr_Custom_Settings__c' Custom Setting
            Behr_Custom_Settings__c sendEmailId= Behr_Custom_Settings__c.getValues(Label.SendHD_Custom_Setting);
            String hdEmail = sendEmailId.Information__c;       
            
            EmailTemplate templateId = [Select id,name from EmailTemplate where name =: Label.HD_Order_Email_Template limit 5];
            if(templateId != Null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] {hdEmail});
                mail.setTargetObjectId(UserInfo.getUserId());
                mail.setTemplateId(templateId.id);
                mail.setWhatId(quoteSource.Id);
                mail.setSaveAsActivity(false);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
            }
            acctPage = new ApexPages.StandardController(quoteSource).view();
            acctPage.setRedirect(true);
            
            Attachment attach = new Attachment();
            attach.Body = body;
            attach.Name = pdfName;
            attach.IsPrivate = false;
            attach.ParentId = quoteSource.Id;
            insert attach;
          
        }
        Catch(Exception e){
              System.debug('The following exception has occurred: ' + e.getMessage());
        }
        return acctPage;
    }
    /*** Method to cancel the action and return to the previous order record***/
    public pagereference cancel() {
        PageReference acctPage;
        try{
            acctPage = new ApexPages.StandardController(quoteSource).view();
            acctPage.setRedirect(true);
        }
        Catch(Exception e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        return acctPage;
    }

}