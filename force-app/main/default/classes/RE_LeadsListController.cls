public with sharing class RE_LeadsListController {

    public List<Lead> recentLeads { get; set; }
    public Lead newLead { get; set; }
    public String currentUserName { get; set; }

    public RE_LeadsListController() {
        newLead = new Lead();
        loadLeads();
        currentUserName = [SELECT Name FROM User WHERE Id = :UserInfo.getUserId()].Name;
    }

    public void loadLeads() {
        recentLeads = [SELECT Id, Name, FirstName, LastName, Email, Status FROM Lead ORDER BY CreatedDate DESC LIMIT 10];
    }

    public void saveLead() {
        insert newLead;
        newLead = new Lead();
        loadLeads();
    }

    public List<SelectOption> getLeadStatusOptions() {
        return new List<SelectOption>{
            new SelectOption('New', 'New'),
            new SelectOption('Working', 'Working'),
            new SelectOption('Qualified', 'Qualified'),
            new SelectOption('Unqualified', 'Unqualified')
        };
    }
}