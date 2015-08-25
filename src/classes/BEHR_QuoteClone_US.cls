Global class BEHR_QuoteClone_US {
    public BEHR_QuoteClone_US (){
    }
  public static string getCreatableFieldsSOQL(String objectName, String whereClause){
 
        String selects = '';
 
        if (whereClause == null || whereClause == ''){ return null; }
 
        // Get a map of field name and field token
        Map<String, Schema.SObjectField> fMap = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().Fields.getMap();
        list<string> selectFields = new list<string>();
 
        if (fMap != null){
            for (Schema.SObjectField ft : fMap.values()){ // loop through all field tokens (ft)
                Schema.DescribeFieldResult fd = ft.getDescribe(); // describe each field (fd)
                if (fd.isCreateable()){ // field is creatable
                    selectFields.add(fd.getName());
                }
            }
        }
 
        if (!selectFields.isEmpty()){
            for (string s:selectFields){
                selects += s + ',';
            }
            if (selects.endsWith(',')){selects = selects.substring(0,selects.lastIndexOf(','));}
 
        }
 
        return 'SELECT ' + selects + ' FROM ' + objectName + ' WHERE ' + whereClause;
 
    } 
   
    
   webservice static Id cloneQuote(id qid){
   List<QuoteLineItem> qlilst = new List<QuoteLineItem>();
   List<QuoteLineItem> qliolst = new List<QuoteLineItem>();
   //system.debug('@@@@@@@'+qid);
   String quoteid=(String)qid;
   List<Quote> qlst = new List<Quote>();
  
   string o='id=\''+qid+'\'';  
    string o1='id=\''+qid+'\'';
  string id;
  system.debug('check2222'+o1);
  string p='\'a\'';
 
  
  qlst= [select Account__c,RecordtypeID,OpportunityID ,name from Quote where id=:qid];
  Opportunity Op1=[select StageName ,Closedate ,Behr_Rep_Name__c,Behr_Rep_Email__c,
                       Behr_Rep_Contact_Number__c,RecordTypeId,Opportunity_Type__c from 
                           Opportunity where id=:qlst[0].OpportunityId];
    Account acc=[select name from Account where id =:qlst[0].Account__c]; 
  
                               
   list<RecordType> rt1=[SELECT r.Id, r.Name, r.SobjectType 
                 FROM RecordType r 
                 WHERE SobjectType='Opportunity' AND r.Name='Opportunity For Quote' limit 1]; 
  
  
  Opportunity Op = new Opportunity(AccountId = qlst[0].Account__c , StageName = op1.StageName  ,
                                        Closedate = op1.Closedate  , Name = acc.name+'_'+System.Now().format('MM/dd/yy HH:mm a', 'PST'),
 
                                        Behr_Rep_Name__c =op1.Behr_Rep_Name__c ,Behr_Rep_Email__c=op1.Behr_Rep_Email__c ,
                                        Behr_Rep_Contact_Number__c =op1.Behr_Rep_Contact_Number__c ,
                                        RecordTypeId=op1.RecordTypeId,Opportunity_Type__c=op1.Opportunity_Type__c);
  insert op;
  
  
  
    String soql = getCreatableFieldsSOQL('Quote',o);
 
    Quote q = (Quote)Database.query(soql);
    Quote q2 = q.clone(false, true);
    q2.OpportunityId=op.id;
    insert q2;
    
     qlilst = [SELECT Your_Price__c, Vendor__c, Use__c, UnitPrice, TotalPrice, Subtotal, SortOrder,
                  Size__c, Sheen__c, QuoteId, Quantity, PricebookEntryId, Price_per_Gallon__c, ListPrice,
                  LineNumber, Discount, Description, Color_Vendor__c, Color_Name_Code__c, Base__c,
                  X384ths_1__c, X384ths_2__c, X384ths_3__c, X384ths_4__c, X384ths_5__c,
                  Colorant__c, Colorant1__c, Colorant2__c, Colorant3__c, Colorant4__c,
                  Color_Name_Code1__c,
                  OZ_1__c, OZ_2__c, OZ_3__c, OZ_4__c, OZ_5__c 
                  FROM QuoteLineItem 
                  WHERE QuoteId =: q.id];
      system.debug('LLLLLLLLLLLLL'+qlilst) ;           
         
        for(Quotelineitem qli : qlilst){
           Quotelineitem insertqli;           
           insertqli = qli.clone(false,true);
           insertqli.QuoteId = q2.id;          
           qliolst.add(insertqli); 
           system.debug('qliiiiiiiiiiiii'+qliolst);
        } 
        insert qliolst;  
    
   
    
    q2.name=acc.name+'_'+System.Now().format('MM/dd/yy HH:mm a', 'PST');
    
    q2.Converted_to_Order__c=false;
    q2.Convert_to_Order__c=false;
   
    update q2;
    
    
         system.debug('OOOOOOOOOOOOOO'+qlilst) ;             
    return q2.id;
  
    
    }
    
 

}