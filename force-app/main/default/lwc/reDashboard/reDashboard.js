import { LightningElement, track } from 'lwc';

export default class ReDashboard extends LightningElement {

    @track totalProperties = 2;
    @track portfolioValue = 2.0;
    @track activeLeads = 2;
    @track closedDeals = 0;

    @track properties = [
        { id: '1', name: 'Modern Downtown Condo', city: 'Seattle', state: 'WA', price: 750 },
        { id: '2', name: 'Luxury Family Home', city: 'Bellevue', state: 'WA', price: 1250 }
    ];

    @track leads = [
        { id: 'a', name: 'Alice Johnson', email: 'alice@example.com', status: 'Qualified', statusClass: 'status-qualified' },
        { id: 'b', name: 'Bob Smith', email: 'bob@example.com', status: 'New', statusClass: 'status-new' }
    ];
}