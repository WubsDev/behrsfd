/*Class Name: Behr_LeadPDF_Controller
@Author Name: Pratheepa Sudarsanam
@Purpose: This class has methods to View the Lead And related pricleist anmd to atach and send Email to Lead Email
@Created Date: 1/28/2014
@Last modified by: Pratheepa
@Last modified date: 2/3/2014 */
/*** Apex class written to view a Visulface page of Lead and related pricelist,To Send an Email with PDF attachment to lead Email and to attach teh PDF to the Notes and Atachments of Lead record.***/

 
public class Behr_LeadPDF_Controller{

    
public Lead l{get;set;}
public list<Price_list__c> priceList {get;set;}
public User us{get;set;}
public Lead lead;
public Product2 pdt{get;set;}
public Price_list__c plist;
public String pdfName;
public string leadId;
public boolean err{get;set;}

User recipientUser;
Blob body;  
Public List<QueueSobject> que = new List<QueueSobject>();


    /*** The extension constructor initializes the private member ***/
    /*** variable l by using the getRecord method from the standard controller.***/
  
    public Behr_LeadPDF_Controller(ApexPages.StandardController stdController) {
        try{  
            this.l = (Lead)stdController.getRecord();
            priceList = [select id,Product__r.Name,Product_Code__c, Price__c from Price_list__c where lead__c =: l.id Limit 100];
            leadId= ApexPages.currentPage().getParameters().get('id');
            lead=[select id, Ownerid, Owner.Name, Email from Lead where id =: l.id];
            //system.debug('****************'+lead);
            que = [Select Id from QueueSobject where Queue.Name=:lead.Owner.Name limit 1]; 
            //system.debug('****************'+que );
            if(que.size()<1)
            {
              us = [select Id,Name, Phone, Email from User where Id =: lead.Ownerid];
              system.debug('@@@@@@@@@@@@@@@@@@@@@@@'+us);
            }
            if(lead.Email==null )
            {
              err = true;
              ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please provide the Lead email id'); 
              ApexPages.addMessage(myMsg);
            }
          }
          Catch(Exception e){
          System.debug('The following exception has occurred: ' + e.getMessage());
        }
      }
   
      /*** This method is to View the Visualforce Page of Lead and Pricelist records.***/
      public PageReference viewPDF() {
        PageReference thePDF;
         try{ 
            thePDF = Page.Create_PDF_Lead;
            thePDF.getParameters().put('id',LeadId);
            thePDF.setRedirect(true);
           }
           Catch(Exception e){
           System.debug('The following exception has occurred: ' + e.getMessage());
        }
         return thePDF;
    }    
     /*** This method is to render the Lead and related pricelist as PDF, Email the same to Lead Email and attach the PDF to Notes and Attachment ***/
     public PageReference savePdf(){
       PageReference thePDF;
        try{
            thePDF = Page.Create_PDF_Lead;
            thePDF.getParameters().put('id',LeadId);
            pdfName = 'PriceList PDF'+' '+System.Now()+ '.'+ 'pdf';
            try{
               body = thePDF.getContentAsPDF();
              } catch (VisualforceException e) {
                body = Blob.valueOf('PDF error');
              }
          EmailTemplate templateId = [Select id,name from EmailTemplate where name =:Label.Price_List_Template limit 1];
          if(templateId != Null && lead.Email!=Null )
              {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[]{lead.Email});
                mail.setTargetObjectId(l.id);
                mail.setTemplateId(templateId.id);
                mail.setSaveAsActivity(false);
                
                Messaging.EmailFileAttachment attachEmail = new Messaging.EmailFileAttachment();
                attachEmail.setFileName(pdfName);
                attachEmail.setInline(false);
                attachEmail.Body = body;
                mail.setFileAttachments(new Messaging.EmailFileAttachment[] {attachEmail});
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
              }
      
                Attachment attach = new Attachment();
                attach.Body = body;
                attach.Name = pdfName;
                attach.IsPrivate = false;
                attach.ParentId = LeadId;
                insert attach;
              }
              Catch(Exception e){
              System.debug('The following exception has occurred: ' + e.getMessage());
              }
                return new PageReference('/'+LeadId);
      
         }
      /***Method is to return to detail page of the Lead record***/   
      public PageReference Cancel(){
        PageReference pgRefCan;
           try{
               pgRefCan = new PageReference('/' + LeadId);           
               pgRefCan.setRedirect(true); 
               }
               Catch(Exception e){
               System.debug('The following exception has occurred: ' + e.getMessage());
               }    
               return pgRefCan;
         }
   }