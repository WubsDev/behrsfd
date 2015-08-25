trigger Behr_UpdateEcoFeeQuote on Quote(after update) {
set<ID> quotelineitemIdSet=new set<ID>();
map<id,string> feeStateId=new map<id,string>();
set<id> quoteIdSet = new set<id>();
map<string,Eco_Fee_State__c> stateSet=new map<string,Eco_Fee_State__c>();
List<Quote> qlist=new List<Quote>();
List<Eco_Fee_State__c > ecoFeeStateList= new List<Eco_Fee_State__c>();
Eco_Fee_State__c  ecoFeeStateForGallon= new Eco_Fee_State__c();

List<Quotelineitem> qlilist=new List<Quotelineitem>();
map<id,List<Quotelineitem>> quoteLineItemMap = new map<id,List<Quotelineitem>> ();
    for(Quote q:trigger.new){               
        quoteIdSet.add(q.id);
        feeStateId.put(q.id,q.ShippingState);

   }
  system.debug('feeStateId =='+feeStateId);
   for(Quotelineitem  q:[select id,quoteid, Recycling_fee_for_1_Gallon__c,Recycling_fee_for_5_Gallon__c,Quantity,Product_Size__c,X1_Gallon__c,X5_Gallon__c from Quotelineitem where quoteid in:quoteIdSet]){
        if (quoteLineItemMap.containskey(q.quoteid)){
            qlilist = quoteLineItemMap.get(q.quoteid);
        }else{
            qlilist=new List<Quotelineitem>();
        }
        qlilist.add(q);
        quoteLineItemMap.put (q.quoteid,qlilist);
        
   }
   system.debug('quoteLineItemMap=='+quoteLineItemMap);
    ecoFeeStateList = [select State__c,Per_Gallon__c,Per_5_Gallon__c from Eco_Fee_State__c where State__c in :feeStateId.values() ];
    //ecoFeeStateListForGallon=[select Per_Gallon__c,Per_5_Gallon__c from Eco_Fee_State__c];
    for (Eco_Fee_State__c  state :ecoFeeStateList ){
        stateSet.put(state.state__c,state);
    }
    
      
    system.debug('stateSet=='+stateSet);
    for(id quoteId :feeStateId.keyset()){
        string feeState  = feeStateId.get(quoteId );
            if (stateSet.containskey(feeState )){
                feeStateId.put(quoteId ,'true');
            }        
    }
    system.debug('feeStateId=='+feeStateId);
   // Eco_fee__c efee= Eco_fee__c.getValues('ECO_Fee');
    List<Quotelineitem > updateQuoteLineList = new List<Quotelineitem >();
      qlilist = null;
    for(Quote q:trigger.new){   
        if (feeStateId.get(q.id) =='true'){   
            qlilist = quoteLineItemMap.get(q.id);
            if (qlilist != null){
                for(Quotelineitem qli:qlilist ){  
                     //for testing
                        ecoFeeStateForGallon    = stateSet.get(q.ShippingState);
                        system.debug('ecoFeeStateForGallon    =='+ecoFeeStateForGallon    );
                        if (ecoFeeStateForGallon != null){  
                            if (qli.Product_Size__c==1 ){  
                                if (ecoFeeStateForGallon.Per_Gallon__c    != null){             
                                    qli.Recycling_fee_for_1_Gallon__c = qli.Quantity * ecoFeeStateForGallon.Per_Gallon__c;
                                }
                                qli.X1_Gallon__c=qli.Quantity; 
                            }
                            else  {    
                                system.debug('@@@qty ' +qli.Quantity+'---'+   ecoFeeStateForGallon.Per_5_Gallon__c);   
                                if (ecoFeeStateForGallon.Per_5_Gallon__c    != null){
                                    qli.Recycling_fee_for_5_Gallon__c = qli.Quantity * ecoFeeStateForGallon.Per_5_Gallon__c; 
                                 }
                                qli.X5_Gallon__c = qli.Quantity;
                                
                            }
                          }
                    }
                }               
        }else{
            if (qlilist != null){
                for(Quotelineitem qli:qlilist ){    
                    qli.Recycling_Fee__c = null;
                    qli.Recycling_fee_for_5_Gallon__c = null;
                    qli.Recycling_fee_for_1_Gallon__c = null;
                }
            }
        }
        if (qlilist != null){
        updateQuoteLineList.addall(  qlilist );
       }
    }  
    system.debug('updateQuoteLineList=='+updateQuoteLineList);  
    update updateQuoteLineList;
}