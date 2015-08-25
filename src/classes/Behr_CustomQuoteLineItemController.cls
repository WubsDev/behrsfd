public class Behr_CustomQuoteLineItemController {
  public string product{get;set;}
  //public boolean colorNoint{get;set;}
  //public boolean colorformula{get;set;}
 public QuoteLineitem qliobj{get;set;}
 public String colorvendor{get; set;}
 public Boolean flag{get;set;}
 public boolean quoteDisplay{get;set;}
 public boolean orderDisplay{get;set;}
    public Behr_CustomQuoteLineItemController(ApexPages.StandardController controller) {
     flag=false;
        qliobj =[select quoteId,ListPrice,Quantity,Color_Vendor__c,Color_Name_Code1__c,Color_Name_Code__c,Use__c, Sheen__c, Base__c, Vendor__c, Size__c,
                 X384ths_5__c, X384ths_4__c, X384ths_3__c, X384ths_2__c, X384ths_1__c, OZ_5__c, OZ_4__c, OZ_3__c, OZ_2__c, 
                 OZ_1__c, Colorant__c,Colorant1__c,Colorant2__c,Colorant3__c,Colorant4__c, Unitprice, Discount from QuoteLineItem 
                 where id=:ApexPages.currentPage().getParameters().get('id')];
                 
         RecordType rt = [select id, name 
                     from Recordtype 
                     where sobjectType ='Quote' and name = 'Quote'];
          Quote q=[select id,recordtypeid,Converted_to_Order__c from Quote where id=:qliobj .QuoteId];          
                 
                  if(q.recordtypeid==rt.id){
                  quoteDisplay=true;
                    
              }
              else     {
                   orderDisplay=true;
                   if(qliobj.Color_Vendor__c=='Color Formula'){
                    flag =true;
                    //colorformula=true;
                    }
              
              
              }                 
               
    
    
                 
                 
                 
    }
     public void onchange1(){
        
        if(qliobj.Color_Vendor__c=='Color Formula'){
        flag =true;
        
        //colorformula=true;
        }
        else{
        //colorNoint=true;
        }
        system.debug('onchangeeeeeeeeeeeee'+flag);
       // return null;
        }
    
  
    
}