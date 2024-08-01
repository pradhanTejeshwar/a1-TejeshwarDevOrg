// import { LightningElement , wire , track } from 'lwc';
// import getOpportunities from '@salesforce/apex/opportunityController.getOpportunities';

// export default class MySearch extends LightningElement {
//     areDetailsVisible = false;
//     key;
//     @track opportunities;

//     updateKey(event){
//         this.key = event.target.value;
//     }

//     handleSearch() {
//         getOpportunities({searchkey : this.key})
//         .then(result=>{
//             this.opportunities = result;
//         })
//         .catch(error=>{
//             console.debug(error);
//             this.opportunities = null;
//         });
//     }

//     handleChange(event) {
//         this.areDetailsVisible = event.target.checked;
//     }

//     handleError() {
//         if(searchkey == null || searchkey == '') {
//             alert("Search is Null or Empty String");
//         }
//     }

//     cols = 
//         [  
//             {label:'Opportunity Name',fieldName:'Name', type:'text'},
//             {label:'Account Id',fieldName:'AccountId', type:'text'},
//             {label: 'Account Name', fieldName: 'Account.Name'},
//             {label:'Stage',fieldName:'StageName', type:'text'},
//             {label:'Type',fieldName:'Type', type:'text'},
//             {label:'Amount',fieldName:'Amount', type:'number'}
//         ]
// }
import { api, LightningElement, track, wire } from 'lwc';
import { updateRecord } from "lightning/uiRecordApi";

import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";
import ID_FIELD from "@salesforce/schema/Opportunity.Id";
import INTEGRATION_STATUS_FIELD from "@salesforce/schema/Opportunity.Integration_Status__c";
import INTEGRATION_COMMENTS_FIELD from "@salesforce/schema/Opportunity.Integration_Comments__c";

import getOpportunities from '@salesforce/apex/opportunityController.getOpportunities';
import getBody from '@salesforce/apex/opportunityController.getHttpRequest';

import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class mySearch extends LightningElement {
    key;
    @track opportunities = [];

    @api
    recordId;
    integrationStatus;
    integrationComments;
    
    cols = 
    [
        {label:'Opportunity Name',fieldName:'Name', type:'text'},
        //{label:'Account Name',fieldName:'AccountId'},
        {label:'Account Name',fieldName:'Account.Name', type:'text'},
        {label:'Stage',fieldName:'StageName', type:'text'},
        {label:'Amount',fieldName:'Amount', type:'Currency'},
        {label:'Type',fieldName:'Type', type:'Picklist'}
    ]
     
    _flatten = (nodeValue, flattenedRow, nodeName) => {        
        let rowKeys = Object.keys(nodeValue);
        rowKeys.forEach((key) => {
            let finalKey = nodeName + '.'+ key;
            flattenedRow[finalKey] = nodeValue[key];
        })
    }
 
    // displayTable(event){
    //     this.areDetailsVisible = event.target.true;
    // }

    updateKey(event) {
        this.key = event.target.value;
    }

    sendRecord(event) {
        var selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();  
        console.log('selectedRecords are ',selectedRecords);
        this.opportunities = selectedRecords;

        getBody()
        .then((data)=>{
            console.log(data),
            this.integrationStatus = 'Success',
            this.integrationComments = 'Success',
            this.recordUpdate;
        })
        .catch((error)=>{
            console.log(error),
            this.integrationStatus = error,
            this.integrationComments = error,
            this.recordUpdate;
        })
    }

    recordUpdate() {
        const fields = {};

        fields[ID_FIELD.fieldApiName] = this.recordId;
        //console.log(this.recordId);
        fields[INTEGRATION_STATUS_FIELD.fieldApiName] = this.integrationStatus;
        //console.log(this.integrationStatus);
        fields[INTEGRATION_COMMENTS_FIELD.fieldApiName] = this.integrationComments;
        //console.log(this.integrationComments);

        const recordInput = {
            fields: fields
        };

        updateRecord(recordInput).then((record) => {
            console.log(record);
        });
    }

    handleSearch(){
        if (this.key !== ''){
            getOpportunities({searchkey : this.key})
            .then(data=>{
                //this.opportunities = result;

                if(data) {
                    //this is the final array into which the flattened response will be pushed. 
                    let accountsArray = [];
                    
                    for (let row of data) {
                        // this const stroes a single flattened row. 
                        const flattenedRow = {}
                        
                        // get keys of a single row — Name, Phone, LeadSource and etc
                        let rowKeys = Object.keys(row); 
                        
                        //iterate 
                        rowKeys.forEach((rowKey) => {
                            //get the value of each key of a single row. John, 999-999-999, Web and etc
                            const singleNodeValue = row[rowKey];

                            //check if the value is a node(object) or a string
                            if(singleNodeValue.constructor === Object){
                                //if it's an object flatten it
                                this._flatten(singleNodeValue, flattenedRow, rowKey)        
                            }else{ 
                                //if it’s a normal string push it to the flattenedRow array
                                flattenedRow[rowKey] = singleNodeValue;
                            }  
                        });
                        //push all the flattened rows to the final array 
                        accountsArray.push(flattenedRow);
                    }

                    //assign the array to an array that's used in the template file
                    this.opportunities = accountsArray;
                    console.log(accountsArray);
                } else if (error) {
                    this.error = error;
                }

            });
        }   
        else {
            this.data = null;
            // fire toast event if input field is blank
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Nothing to Search ! Try entering something to Search...',
            });
            this.dispatchEvent(event);
        }

        /*.catch(error=>{
            this.opportunities = null;
        });*/
    }
    nodeValue
}