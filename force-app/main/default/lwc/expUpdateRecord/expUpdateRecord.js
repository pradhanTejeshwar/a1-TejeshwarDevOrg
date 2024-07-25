import { api, LightningElement } from 'lwc';

import { updateRecord } from "lightning/uiRecordApi";

import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import ID_FIELD from "@salesforce/schema/Account.Id";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import RATING_FIELD from "@salesforce/schema/Account.Rating";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";

export default class ExpUpdateRecord extends LightningElement {
    @api 
    recordId;
    name;
    rating;
    industry;

    handleChange(event) {
        if(event.target.name === "name") {
            //name input textbox
            this.name = event.target.value;
            console.log(this.name);
        } else if(event.target.name === "rating") {
            //rating  textbox
            this.rating = event.target.value;
            console.log(this.rating);
        } else {
            //industry input textbox
            this.industry = event.target.value;
            console.log(this.industry);
        }
    }

    handleUpdate() {
        const fields = {};

        fields[ID_FIELD.fieldApiName] = this.recordId;
        fields[NAME_FIELD.fieldApiName] = this.name;
        fields[INDUSTRY_FIELD.fieldApiName] = this.industry;
        fields[RATING_FIELD.fieldApiName] = this.rating;

        const recordInput = {
            fields: fields
        };

        updateRecord(recordInput).then((record) => {
            console.log(record);
        });
    }
}