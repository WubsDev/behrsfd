trigger Behr_CreateCaseComment_China on Case (after insert,after update) {
List<CaseComment> lstcasecmnt=new List<CaseComment>();
string Comment,flag='0';

RecordType rt=[SELECT r.Id, r.Name, r.SobjectType 
                 FROM RecordType r 
                 WHERE SobjectType='Case' AND r.Name='US Case'];

for(Case c:trigger.new){
if(Trigger.isinsert){
if(c.Description!=null && c.Subject==null && c.Recordtypeid!=rt.id){
  Comment=c.Description;
}
if(c.Description==null && c.Subject!=null && c.Recordtypeid!=rt.id){
 Comment=c.Subject;
}
    if(c.Description!=null && c.Subject!=null && c.Recordtypeid!=rt.id){
          Comment=c.Subject+' ' +c.Description;
         }
         if(Comment!=null){
         CaseComment cComment=new CaseComment();
         cComment.ParentId=c.id;
         cComment.CommentBody= Comment;
         lstcasecmnt.add(cComment);
        }
        }
    if(Behr_createcommentVariable.flag==false){
   if(Trigger.isUpdate){
   Behr_createcommentVariable.flag=true;
   system.debug('Inside update 1st if');
       if(c.Description==trigger.oldmap.get(c.id).Description && c.Subject!=trigger.oldmap.get(c.id).Subject && c.Recordtypeid!=rt.id)
       {system.debug('Inside update 2nd if');
       
           if(c.Description==null){
               Comment=c.Subject;
           }
           if(c.Subject==null){
               Comment=c.Description;
   
           }
           if(c.Description!=null && c.Subject!=null){
   
              Comment=c.Subject+' ' +c.Description;
           }
   
       }
       if(c.Description!=trigger.oldmap.get(c.id).Description && c.Subject==trigger.oldmap.get(c.id).Subject && c.Recordtypeid!=rt.id)
       {system.debug('Inside update 3rd if');
           if(c.Description==null){
               Comment=c.Subject;
           }
           if(c.Subject==null){
               Comment=c.Description;
   
           }
           if(c.Description!=null && c.Subject!=null){
   
             Comment=c.Subject+' ' +c.Description;
           }
   
   
       }
       if(c.Description!=trigger.oldmap.get(c.id).Description && c.Subject!=trigger.oldmap.get(c.id).Subject && c.Recordtypeid!=rt.id)
        {
           system.debug('Inside update 4th if');
           if(c.Description==null){
               Comment=c.Subject;
           }
           if(c.Subject==null){
               Comment=c.Description;
   
           }
           if(c.Description!=null && c.Subject!=null){
   
               Comment=c.Subject+' ' +c.Description;
           }
           
       
           
        }
        if(Comment!=null){
        system.debug('Inside update 5th if');
        CaseComment cComment=new CaseComment();
         cComment.ParentId=c.id;
         cComment.CommentBody= Comment;
         lstcasecmnt.add(cComment);
       }    
    }
    }
  }  
    
insert lstcasecmnt;


}