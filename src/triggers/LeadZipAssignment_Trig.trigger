trigger LeadZipAssignment_Trig on Lead (before insert, before update) {
    Set<String> Zip = new Set<String>();
    Set<Id> TDStoreIds= new Set<Id>();
    for(Lead ld: Trigger.New){
        if(ld.PostalCode != Null && ld.postalCode != '')
        Zip.add(ld.PostalCode);    
    }
    System.Debug('zip'+zip);
    map<String,Id> mapZipId= new map<String,Id>();
    map<String,Id> mapZipCodeOwnerId= new map<String,Id>();
    map<String,Id> mapZipAssignId  = new map<String,Id>();
  List<Zip_Code_Assignment__C> ZipAsgnmnt = [Select Id,Zip_code__c,ownerId,Assign_To__c from Zip_Code_Assignment__c where Zip_Code__c IN: Zip];
    
    System.Debug('List'+ZipAsgnmnt);
    for(Zip_Code_Assignment__C z:ZipAsgnmnt){
        mapZipId.put(z.Zip_Code__c,z.Id); 
        mapZipAssignId.put(z.Zip_Code__c,z.Assign_To__c) ;
        mapZipCodeOwnerId.put(z.Zip_Code__c,z.OwnerId);       
    }
    System.Debug('map'+mapZipId);
    
    for(Lead l: Trigger.New){
        if(mapZipId.get(l.PostalCode) != NULL){
            l.Zip_Code_lookup_del__c = mapZipId.get(l.PostalCode);
            System.Debug('map2'+mapZipId.get(l.PostalCode));
        }
        else
            l.Zip_Code_lookup_del__c = null;
    }      
    List<User> StoreOWner =[Select Id,name from user where name ='Behr Instore Rep']; 
    List<UserRole> ProRepRole =[SELECT Id,Name FROM UserRole where name LIKE '%Pro Rep%'];
    Public Set<Id> RoleIdSet = new Set<id>(); 
    for(UserRole ur:ProRepRole){
        RoleIdSet.add(ur.Id);
    }
    System.debug('Role Set'+ RoleIdset);
    List<Profile> pro=[Select Id from profile where Name = 'Standard User Level 2'];
    System.Debug('profilechek'+pro);
    List<User> ProRepUSers = new List<User>();
    if (pro.size()>=0 ){
        ProRepUSers=[Select Id from user where (ProfileId =: pro[0].Id AND UserRoleId IN: RoleIdSet AND name !='Behr Instore Rep')];
    }
    for(lead ld2:Trigger.New){
        if(ld2.Primary_Store_Number__c != null)
        TDStoreIds.add(ld2.Primary_Store_Number__c);   
        
    }
    List<Home_Depot_Store__c> StoreList= [Select Id, OwnerId ,name from Home_Depot_Store__c where Id IN: TDStoreIds];
    map<ID,ID> mapTDSIdOwnerId= new map<Id,Id>();
    for(Home_Depot_Store__c hds: StoreList){
        mapTDSIdOwnerId.put(hds.Id,hds.OwnerId);    
    }
    List<Group> queueList = [select Id from Group where Name = 'Pro Unassigned' and Type = 'Queue'];
    id unAssignedProLeadId = null;
    if (queueList.size() >=0 ){
        unAssignedProLeadId = queueList[0].id;
    }
    for(lead l3: Trigger.New){
        Boolean Flag =false;
        Boolean Flag2 = false;
        system.debug('==='+l3.OwnerId  + '=='+unAssignedProLeadId +'=='+l3.Primary_Store_Number__c + '=='+ l3.PostalCode);
        if(unAssignedProLeadId != null && l3.OwnerId == unAssignedProLeadId) {
           //&& (l3.Primary_Store_Number__c != null || l3.PostalCode != NULL)){
            
            for(User u:ProRepUsers){
                if(mapTDSIdOwnerId.get(l3.Primary_Store_Number__c) == u.Id ){
                    flag = true;
                    l3.OwnerId=u.Id;
                    break;
                }
               System.Debug('flag rep'+flag); 
            }
            if(flag == false){
    
                for(User u1:ProRepUsers){
                    if(mapZipCodeOwnerId.get(l3.Zip_Code_lookup_del__c) == u1.Id)    
                    {
                        l3.OwnerId = u1.Id;
                        Flag2= true;
                        break;
                        
                    }System.Debug('flag2 rep'+flag2); 

                }
                if(Flag2 == false){
                  //l3.OwnerId = StoreOWner[0].Id;
                  System.Debug('chk'+mapZipAssignId.get(l3.PostalCode));
                  If(mapZipAssignId.get(l3.PostalCode) !=null)
                   l3.OwnerId = mapZipAssignId.get(l3.PostalCode);
                  }
                for(User u2:StoreOWner){ 
                  If(l3.PostalCode == null &&(l3.Primary_Store_Number__c != null && mapTDSIdOwnerId.get(l3.Primary_Store_Number__c) ==  u2.Id))
                  l3.OwnerID = u2.Id;
              }

          }
        }    
    }       
}