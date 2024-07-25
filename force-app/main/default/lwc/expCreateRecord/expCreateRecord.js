import { LightningElement } from 'lwc';

//1. Import all the dependencies
import { createRecord } from "lightning/uiRecordApi";

import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import ACCOUNT_NAME_FIELD from "@salesforce/schema/Account.Name";
import ACCOUNT_INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";

export default class expCreateRecord extends LightningElement {
    handleClick() {
        const fields = {};
        
        fields[ACCOUNT_NAME_FIELD.fieldApiName] = "Test1Alpha";
        fields[ACCOUNT_INDUSTRY_FIELD.fieldApiName] = "Apparel";
        
        console.log("Before");
        
        createRecord({
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: fields
        })
        .catch( (error) => {console.log(error);});
        console.log("Done");
    }
}
    // handleClick() {
    //     //map the data to the fields
    //     const fields = {};
    
    //     fields[ID_FIELD.fieldApiName] = this.recordId;
    //     fields[NAME_FIELD.fieldApiName] = this.name;
    //     fields[INDUSTRY_FIELD.fieldApiName] = this.industry;
    //     fields[RATING_FIELD.fieldApiName] = this.rating;
    
    //     const recordInput = {
    //       fields: fields
    //     };
    
    //     updateRecord(recordInput).then((record) => {
    //       console.log(record);
    //     });
    //   }