import { LightningElement, wire } from 'lwc';

import fetchAccounts from '@salesforce/apex/wireDecoratorController.fetchAccounts';
import fetchContacts from '@salesforce/apex/wireDecoratorController.fetchContacts';

export default class ExploreWireDecorator extends LightningElement {

    @wire(fetchAccounts)
    accounts;

    handleClick() {
        fetchContacts()
            .then((data) => {console.log(data);})
            .catch((data) => {console.log(error);})
    }

    // @wire(fetchAccounts)
    // accountRecords({error, data}){
    //     if(data)   
    //         console.log(data);
    //     else
    //         console.log(error);
    // }
}