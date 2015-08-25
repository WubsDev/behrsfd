trigger BEHR_populateStorepurchase_US on Direct_To_Pro_Sales__c (before insert, before update) {

List<Home_Depot_Store__c> homedepotlst = new List<Home_Depot_Store__c>();

Map<String, id> homedepotmap = new Map<String, id>();

    homedepotlst =[Select name, id from Home_Depot_Store__c];
    
    for(Home_Depot_Store__c hds : homedepotlst)
        homedepotmap.put(hds.name, hds.id);
     
    for(Direct_To_Pro_Sales__c dtp: trigger.new){
      
       if(trigger.Isupdate){

           if(homedepotmap.containsKey(dtp.Store_Number_Backend__c) == true){              
               dtp.Store_of_Purchase__c = homedepotmap.get(dtp.Store_Number_Backend__c);
              
           }
           
           if(dtp.Store_Number_Backend__c== null)
               dtp.Store_of_Purchase__c = null;
        
        }
        
        if(trigger.isInsert){
            if(homedepotmap.containsKey(dtp.Store_Number_Backend__c) == true)
                dtp.Store_of_Purchase__c = homedepotmap.get(dtp.Store_Number_Backend__c);
               
            
        }
        
         
    } 
}