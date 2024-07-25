import { LightningElement ,wire,track} from 'lwc';
import getAccounts from '@salesforce/apex/accountController.getAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CustomSearch extends LightningElement {
    key;
    @track accounts;
    /*@wire (getAccounts,{searchKey:'$key'}) accountsSearched({error,data}){
        if(data){
        this.accounts = data;
        }
        else if(error){
            console.log('error');
        }
    };*/
    updateKey(event){
        this.key = event.target.value;
    }

    handleSearch(){
        /*if(getaccounts==Null){
        const evt = new ShowToastEvent({
            title: 'Toast Error',
            message: 'Some unexpected error',
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }*/
       
        getAccounts({searchkey : this.key})
        .then(result=>{
            this.accounts = result;
        })
        .catch(error=>{
            this.accounts = null;
        });
    }
    cols = 
        [  
            {label:'Account Name',fieldName:'Name', type:'text'},
            {label:'Phone',fieldName:'Phone', type:'phone'},
            {label:'Industry',fieldName:'Industry', type:'text'}
        ]
    
}