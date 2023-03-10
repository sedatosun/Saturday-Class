@isTest
public class RankHandlerTest {
    @isTest
    private static void method1() {
        RankHandler r = new RankHandler();
        string s1 = r.rankPrize(1);
        assert.areEqual('Gold', s1);

        string s2 = r.rankPrize(2);
        assert.areEqual('Silver', s2);

        string s3 = r.rankPrize(3);
        assert.areEqual('Bronze', s3);

        string s4 = r.rankPrize(5);
        assert.areEqual('Top 10', s4);

        string s5 = r.rankPrize(11);
        assert.areEqual('Participation certificate', s5);
    }
    @isTest
    private static void method2() {
        RankHandler r = new RankHandler();
        string s1 = r.rankPrizeSwitch(1);
        assert.areEqual('Gold', s1);

        string s2 = r.rankPrizeSwitch(2);
        assert.areEqual('Silver', s2);

        string s3 = r.rankPrizeSwitch(3);
        assert.areEqual('Bronze', s3);

        string s4 = r.rankPrizeSwitch(5);
        assert.areEqual('Top 10', s4);

        string s5 = r.rankPrizeSwitch(11);
        assert.areEqual('thank you for participating', s5);
    }

    /*
    RankHandler rankHandler = new RankHandler();
        
        // Test rank 1-3
        for (Integer i = 1; i <= 3; i++) {
            String prize = rankHandler.rankPrize(i);
            Assert.areEqual(
                i == 1 ? 'Gold' : i == 2 ? 'Silver' : 'Bronze', 
                prize
            );
        }
        
        // Test rank 4-10
        for (Integer i = 4; i <= 10; i++) {
            String prize = rankHandler.rankPrize(i);
            Assert.areEqual('Top 10', prize);
        }
        
        // Test rank 11 and above
        for (Integer i = 11; i >= 11 && i < 100; i++) {
            String prize = rankHandler.rankPrize(i);
            assert.areEqual('Participation certificate', prize);
        }
        */
}