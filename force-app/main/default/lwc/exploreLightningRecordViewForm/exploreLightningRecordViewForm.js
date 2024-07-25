import { LightningElement, api } from 'lwc';

export default class ExploreLightningRecordViewForm extends LightningElement {
    @api
    recordId;

    objectApiName = 'Account';

    handleSubmit(event) {
        console.log("Submit");
      }
    
      handleSuccess() {
        console.log("Success");
      }
    
      handleError() {
        console.log("Error");
      }
}