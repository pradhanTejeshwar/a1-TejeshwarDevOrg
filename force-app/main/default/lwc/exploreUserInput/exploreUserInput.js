import { LightningElement, track } from 'lwc';

export default class ExploreUserInput extends LightningElement {
    //message = 'Hey Salesforce User';

    @track
    person = {
        name : 'Chandler',
        age: 60,
        location: 'Central Perk'
    }

    handleClick() {
        console.log('Heyy');
        this.person.name = 'Bing';
        // this.person = {
        //     name : 'Bing',
        //     age: 78,
        //     location: 'Central Park'
        // }
        //this.message = 'This is updated';
    }
}