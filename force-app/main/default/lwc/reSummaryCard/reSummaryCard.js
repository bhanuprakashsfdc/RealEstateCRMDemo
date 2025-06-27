import { LightningElement, api } from 'lwc';

export default class ReSummaryCard extends LightningElement {
    @api label;
    @api value;
    @api icon;
    @api color;

    get tileClass() {
        return `summary-tile ${this.color}`;
    }
}