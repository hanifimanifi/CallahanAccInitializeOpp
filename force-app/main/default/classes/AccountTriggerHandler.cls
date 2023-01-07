public class AccountTriggerHandler {
    public static void AccWithInitialOpp (List<Account> Triggernew) {
        try {
            if(!Triggernew.isEmpty()){
        Pricebook2 pb = new Pricebook2 ();
        pb = [select id ,name from Pricebook2 where name ='Standard Price Book'];
        List<Opportunity> OppList = new List<Opportunity>();
        for (Account Acc : Triggernew) {
            Opportunity Opp = new Opportunity();
            Opp.Name = 'Initial Opp';
            Opp.CloseDate = Date.today().addDays(30);
            Opp.StageName = 'Prospecting';
            Opp.AccountId = Acc.Id;
            Opp.Pricebook2Id = pb.Id;
            OppList.add(Opp);
        }
        list<Product2> productList = new list<Product2>();
        productList = [select id,name from Product2 where name ='Initial Product'];
        
            insert OppList;
            List<OpportunityLineItem> OppLineItemList = new List<OpportunityLineItem>();
            for( Opportunity eachOpp:OppList){
                OpportunityLineItem OppLineItem = new OpportunityLineItem();
                OppLineItem.Quantity = 1;
                OppLineItem.OpportunityId = eachOpp.Id;
                OppLineItem.TotalPrice = 1000;
                if (productList.size()>0 && productList!=null) {
                    OppLineItem.Product2Id = productList[0].Id;
                } else {
                    OppLineItem.Product2Id = null;
                }
                // the ternary operator
                //OppLineItem.Product2Id = productList.size()>0 && productList!=null ? productList[0].Id: Null;
                OppLineItemList.add(OppLineItem);

            }
            insert OppLineItemList;
        }
    } catch (Exception exp) {}
    }
}
