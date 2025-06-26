public with sharing class RE_DashboardController {

    public Integer totalProperties { get; private set; }
    public Decimal portfolioValue { get; private set; }
    public Integer activeLeads { get; private set; }
    public Integer closedDeals { get; private set; }
    public String currentUserName { get; private set; }
	public Integer currentYear { get; set; }
    
    public List<RE_Property__c> recentProperties { get; private set; }
    public List<Lead> recentLeads { get; private set; }

    public RE_DashboardController() {
        currentYear = Date.today().year();
        currentUserName = [SELECT Name FROM User WHERE Id = :UserInfo.getUserId()].Name;
        loadSummary();
        loadRecentProperties();
        loadRecentLeads();
    }

    private void loadSummary() {
        totalProperties = [SELECT COUNT() FROM RE_Property__c ];
      //  portfolioValue = [SELECT SUM(Price__c) total FROM RE_Property__c][0].total;
        AggregateResult[] groupedResults = [SELECT SUM(Price__c) sumPrice FROM RE_Property__c];
        if (!groupedResults.isEmpty() && groupedResults[0].get('sumPrice') != null) {
            portfolioValue = (Decimal) groupedResults[0].get('sumPrice');
        } else {
            portfolioValue = 0;
        }

        
        activeLeads = [SELECT COUNT() FROM Lead WHERE Status = 'Open - Not Contacted' OR Status = 'Working'];
      	Integer currentMonth = Date.today().month();
		closedDeals = [SELECT COUNT() FROM Opportunity WHERE IsClosed = TRUE AND CALENDAR_MONTH(CloseDate) = :currentMonth];
    }

    private void loadRecentProperties() {
        recentProperties = [SELECT Id, Name,City__c, Price__c FROM RE_Property__c ORDER BY CreatedDate DESC LIMIT 5];
    }

    private void loadRecentLeads() {
        recentLeads = [SELECT Id, Name, Email, Status FROM Lead ORDER BY CreatedDate DESC LIMIT 5];
    }
}