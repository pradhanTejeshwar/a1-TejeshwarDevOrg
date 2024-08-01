import { LightningElement, api } from 'lwc';

//1. Import the dependencies
import { deleteRecord } from "lightning/uiRecordApi";

export default class ExpDeleteRecord extends LightningElement {
    @api recordId;

    handleDelete() {
        deleteRecord(this.recordId)
        .then(() => {
            console.log("Record is Deleted");
            alert("Record is Deleted");
        })
        .catch((error) => {
            console.log(JSON.stringify(error));
        });
    }
}