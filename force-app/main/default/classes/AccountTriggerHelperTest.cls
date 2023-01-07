@isTest
public class AccountTriggerHelperTest {
   @isTest
   static void createAccountWithOppTestMethod(){

    Pricebook2 pb = new Pricebook2 ();
    pb.Name = 'Standard Price Book';
    pb.IsActive = true;
    insert pb;

    Product2 product = new Product2();
    product.Name = 'Initial Product';
    product.IsActive = true;
    insert product;


    List<Account> accList = new List<Account>(); 
    for (Integer i = 0; i < 220; i++) {
        Account acc = new Account();
        acc.Name = 'Test Account' + i;
    }  

    test.startTest();
    insert accList;

    Set<Id> accIds = new Set<Id>();
    for (account acc : accList) {
        accIds.add(acc.Id);
    }
    test.stopTest();
//acount create edilince otomatik  
            //Opp.Name = 'Initial Opp';
            //Opp.CloseDate = Date.today().addDays(30);
            //Opp.StageName = 'Prospecting';
// opp ozellikleri bunlar
//
// pricebook to opp bi tane standart price book olusturduk
//bitane opp line item baglamis her birine 
    List<Opportunity> OppList = [SELECT Name, StageName 
                                FROM Opportunity
                                WHERE AccountId IN :accIds ];

    // System.assertEquals(OppList.size(), 220 );
    //System.assert(OppList.size() > 0 );
   }
}