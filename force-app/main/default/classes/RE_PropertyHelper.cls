public with sharing class RE_PropertyHelper {

    @AuraEnabled
    public RE_Property__c property { get; set; }

    public RE_PropertyHelper() {
        // Default Constructor (not used heavily in VF context but required)
    }

}