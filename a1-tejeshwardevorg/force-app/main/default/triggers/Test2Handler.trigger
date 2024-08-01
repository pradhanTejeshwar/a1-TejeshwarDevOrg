trigger Test2Handler on Case (before insert) {
    List<ID> AccID = New List<ID>();   
    for(Case con : Trigger.new){
        if(con.AccountId != null){
            AccID.add(con.AccountId);
        }
    }
    
    List<Case> conlist = [ select AccountId from Case where accountId in :AccID];
    List<Account> accList = [SELECT Name FROM Account WHERE id in :AccID];
    for(integer i = 0 ; i < accList.size(); i++){
        String address = ''+conlist[0].get('AccountId');
        accList[i].Description = address;
    }
    update accList;
}