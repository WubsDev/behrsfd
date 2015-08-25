public class Behr_orderLineItemEdit {
 public string product{get;set;}
 public Boolean disableInput {get; set;}
  public Boolean dummydisableInput {get; set;}
 public QuoteLineitem qliobj{get;set;}
 public String colorvendor{get; set;}
 public Boolean flag{get;set;}
    public Behr_orderLineItemEdit(ApexPages.StandardController controller) {
    flag=false;
    disableInput=true;
        qliobj =[select quoteId,ListPrice,Quantity,Color_Vendor__c,Color_Name_Code__c,Use__c, Sheen__c, Base__c, Vendor__c, Size__c,
                 X384ths_5__c, X384ths_4__c, X384ths_3__c, X384ths_2__c, X384ths_1__c, OZ_5__c, OZ_4__c, OZ_3__c, OZ_2__c, 
                 OZ_1__c, Colorant__c,Colorant1__c,Colorant2__c,Colorant3__c,Colorant4__c, Unitprice, Discount from QuoteLineItem 
                 where id=:controller.getRecord().id];
                 if(qliobj.Color_Vendor__c=='Color Formula')
                    flag =true;
        
    }
    
    public void onchange1(){
        
        if(qliobj.Color_Vendor__c=='Color Formula')
        {
            flag =true;
            disableInput=false;
            dummydisableInput =true;
            }
        else 
        {
          flag =false;
           disableInput=true;
           dummydisableInput =false;
           }
        system.debug('onchangeeeeeeeeeeeee'+flag);
       // return null;
        }
    
    public pagereference redirect(){
    string qliid,returl,rt1;
    qliid=ApexPages.currentPage().getParameters().get('id');
    returl=ApexPages.currentPage().getParameters().get('retURL');
     rt1=retURL.substring(1,(retURL.length()));
    List<QuoteLineitem> QLI=[select id, PricebookEntryId,QuoteId from QuoteLineitem where id=:qliid];
    system.debug('IIIIIIIIIIIIIIII'+QLI[0].PricebookEntryId );
    PricebookEntry  pbe=[select Product2Id from PricebookEntry where id =:QLI[0].PricebookEntryId ];
    system.debug('AAAAAAAAAAAAAAAA'+pbe.Product2Id );
    Product2 pro=[select id,Name from Product2 where id =:pbe.Product2Id ];
    system.debug('SSSSSSSSSSSSSSSSS'+pro.Name);
    Quote q=[select id,recordtypeid,Converted_to_Order__c from Quote where id=:QLI[0].QuoteId ];
    product=pro.Name;
   return null;
    
    }
    public pagereference save1(){
    pagereference newPage;
    string color;
    
     if(qliobj.Color_Name_Code__c == null) {
     if(qliobj.Color_Vendor__c=='Behr' || qliobj.Color_Vendor__c=='Benjamin Moore' || qliobj.Color_Vendor__c=='Comex' || qliobj.Color_Vendor__c=='Dunn-Edwards' || qliobj.Color_Vendor__c=='Glidden' || qliobj.Color_Vendor__c=='ICI' || qliobj.Color_Vendor__c=='Kelly Moore' || qliobj.Color_Vendor__c=='Kilz' || qliobj.Color_Vendor__c=='PPG' || qliobj.Color_Vendor__c=='Sherwin Williams' || qliobj.Color_Vendor__c=='Vista'){
        Apexpages.addMessage(new ApexPages.Message(Apexpages.Severity.ERROR,'Color Name/Code is mandatory if the color is not: Color Formula or No Tint'));
        return null;
    }
    }
    if(qliobj.Color_Vendor__c=='Color Formula'){
    //1st colorant
    if(qliobj.Colorant__c!=null){
     color =qliobj.Colorant__c;
    if(qliobj.OZ_1__c!=null){
    color = color +'-'+qliobj.OZ_1__c;
    
    }
    else
    {
    color =color +'-'+qliobj.X384ths_1__c;
    
    }
    if(qliobj.OZ_1__c!=null && qliobj.X384ths_1__c!=null )
    {
    color =color +'Y'+qliobj.X384ths_1__c;
    
    }
    }
    qliobj.Color_Name_Code1__c=color;
    
   //2nd colorant 
   if(qliobj.Colorant1__c!=null){
    color=color+';'+' '+qliobj.Colorant1__c;
    
     if(qliobj.OZ_2__c!=null){
    color = color +'-'+qliobj.OZ_2__c;
    
    }
    else
    {
    if(qliobj.X384ths_2__c!=null){
    color =color +'-'+qliobj.X384ths_2__c;
    }
    }
    if(qliobj.OZ_2__c!=null && qliobj.X384ths_2__c!=null )
    {
    color =color +'Y'+qliobj.X384ths_2__c;
    
    }
    }
    qliobj.Color_Name_Code1__c=color;
   
    
    //3rd colorant
    if(qliobj.Colorant2__c!=null){
     color=color+';'+' '+qliobj.Colorant2__c;
    
     if(qliobj.OZ_3__c!=null){
    color = color +'-'+qliobj.OZ_3__c;
    
    }
    else
    {
    if(qliobj.X384ths_3__c!=null){
    color =color +'-'+qliobj.X384ths_3__c;
    }
    }
    if(qliobj.OZ_3__c!=null && qliobj.X384ths_3__c!=null )
    {
    color =color +'Y'+qliobj.X384ths_3__c;
    
    }
    }
    qliobj.Color_Name_Code1__c=color;
    
    //4th colorant
    if(qliobj.Colorant3__c!=null){
    color=color+';'+' '+qliobj.Colorant3__c;
    
     if(qliobj.OZ_4__c!=null){
    color = color +'-'+qliobj.OZ_4__c;
    
    }
    else
    {
    if(qliobj.X384ths_4__c!=null){
    color =color +'-'+qliobj.X384ths_4__c;
    }
    
    }
    if(qliobj.OZ_4__c!=null && qliobj.X384ths_4__c!=null )
    {
    color =color +'Y'+qliobj.X384ths_4__c;
    
    }
    }
    qliobj.Color_Name_Code1__c=color;
    
    //5th colorant
    if(qliobj.Colorant4__c!=null){
     color=color+';'+' '+qliobj.Colorant4__c;
    
     if(qliobj.OZ_5__c!=null){
    color = color +'-'+qliobj.OZ_5__c;
    
    }
    else
    {
    if(qliobj.X384ths_5__c!=null){
    color =color +'-'+qliobj.X384ths_5__c;
    }
    }
    if(qliobj.OZ_5__c!=null && qliobj.X384ths_5__c!=null )
    {
    color =color +'Y'+qliobj.X384ths_5__c;
    
    }
    }
    
    qliobj.Color_Name_Code1__c=color;
    }
    else
    {
    
    qliobj.Color_Name_Code1__c=qliobj.Color_Name_Code__c;
   
    }
    
    update qliobj ;
    newPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));
    return newPage;
    
    }
    
    /*public pagereference save(){
    pagereference newPage;
    update qliobj ;
    newPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));
    return newPage;
    
    }*/

}