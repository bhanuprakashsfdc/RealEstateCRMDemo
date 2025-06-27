import { LightningElement, track } from 'lwc';

export default class RePropertiesList extends LightningElement {
    @track properties = [
        { id: '1', name: 'Modern Downtown Condo', city: 'Seattle', state: 'WA', price: 750 },
        { id: '2', name: 'Luxury Family Home', city: 'Bellevue', state: 'WA', price: 1250 }
    ];
}