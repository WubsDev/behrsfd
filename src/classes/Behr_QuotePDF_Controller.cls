public class Behr_QuotePDF_Controller{

    
    private final quote q;
public list<QuoteLineItem> quotelineList {get;set;}
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public Behr_QuotePDF_Controller(ApexPages.StandardController stdController) {
        this.q = (quote)stdController.getRecord();
    quotelineList = [select id,Quantity,Description,Price_per_Gallon__c,Product__c,TotalPrice,Your_Price__c,Color_Vendor__c,Color_Name_Code1__c from QuoteLineItem where quoteid =: q.id ORDER BY SortOrder ASC];
    }
     public PageReference viewPDF() {
        string quoteId = ApexPages.currentPage().getParameters().get('id');
        PageReference thePDF = Page.Behr_Quote_PDF;
        thePDF.getParameters().put('id',quoteId);
        thePDF.setRedirect(true);
        return thePDF;
    
    }     
    public PageReference savePDF() { 
        string qId = ApexPages.currentPage().getParameters().get('id');
        System.debug(qId);
        PageReference thePDF = Page.Behr_Quote_PDF;
        thePDF.getParameters().put('id',qId);
        thePDF.setRedirect(false);
                
        quotedocument qd = new quotedocument();
        if(!test.isRunningTest()){
            qd.document = thePDF.getContentAsPDF();
            qd.quoteId = qId;
            insert qd;
        }
    
        PageReference quotePage = new PageReference('/'+ qId);
        quotePage.setRedirect(false);
        return quotePage;
    }
}