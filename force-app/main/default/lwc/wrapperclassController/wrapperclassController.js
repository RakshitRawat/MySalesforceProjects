import { LightningElement, wire, track } from 'lwc';
import getAllAccount from '@salesforce/apex/WrapperClass.getAllAccount';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'ID', fieldName: 'Id', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Account Number', fieldName: 'AccountNumber', type: 'text' },
    { label: 'Contact Count', fieldName: 'count', type: 'number' }
];

export default class WrapperDataTable extends LightningElement {
    @track data = [];
    columns = COLUMNS;
    error;

    @wire(getAllAccount)
    wiredAccounts({ error, data }) {
        if (data) {
            this.data = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }
}
