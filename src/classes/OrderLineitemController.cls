public class OrderLineitemController {


    public String retURL ;
    public string qliid;
    public boolean normal{get;set;}
    public string product{get;set;}
    public OrderLineitemController(ApexPages.StandardController controller) {

    }
    
    public PageReference getredirect() {
   // normal=true;
    PageReference newPage ;
    string rt1,retURL1;
    /*retURL = ApexPages.currentPage().getParameters().get('retURL');
   
    rt1=retURL.substring(1,(retURL.length()));
    system.debug('UUUUUUUUUUUUUUUU'+rt1);*/
    qliid=ApexPages.currentPage().getParameters().get('id');
     RecordType rt = [select id, name 
                     from Recordtype 
                     where sobjectType ='Quote' and name = 'Quote'];
    List<QuoteLineitem> QLI=[select id, PricebookEntryId,Quoteid from QuoteLineitem where id=:qliid];
    //system.debug('IIIIIIIIIIIIIIII'+QLI[0].PricebookEntryId );
   // PricebookEntry  pbe=[select Product2Id from PricebookEntry where id =:QLI[0].PricebookEntryId ];
    //Product2 pro=[select id,Name from Product2 where id =:pbe.Product2Id ];
   // product=pro.Name;
    
    
    Quote q=[select id,recordtypeid,Converted_to_Order__c from Quote where id=:QLI[0].Quoteid];
    
   if(q.recordtypeid==rt.id){ 
   system.debug('Inside If'+q.Converted_to_Order__c+q.id);
   
   //normal=true;
   newPage = new PageReference('/' + QLI[0].id+ '/e');
            newPage.getParameters().put('nooverride', '1');
            newPage.getParameters().put('retURL','/'+ QLI[0].Quoteid);
            
            system.debug('Pagggggg'+newPage  );
            newPage.getParameters().put('id',QLI[0].id);
 
        return newPage.setRedirect(true);
   
   
   }
    //system.debug('Inside IF');
   // syatem.debog('AAAAAAAAAAAA'+url);
    //system.debug('OOOOOOOOOOOOOOOOOO'+System.URL.getSalesforceBaseUrl().toExternalForm());
    //pg= new PageReference('https://cs1.salesforce.com/0QLS0000000D3tE/e?retURL=%2F0Q0S0000000CxBW');
    
    else{
    returl1='/'+q.id;
    system.debug('inside else');
   newPage = Page.behr_orderlineitemedit_us;
  newPage.getParameters().put('id', QLI[0].id);
  newPage.getParameters().put('retUrl','/'+QLI[0].Quoteid);
  
 return newPage.setRedirect(true);
   }
   // return null;
   
    
   
    

}
}