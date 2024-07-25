import { api, LightningElement } from 'lwc';

export default class ExploreAPIDecorator extends LightningElement {
    @api
    message = 'Hey';

    @api
    handleSum(a,b) {
        let c = a+b;
        console.log(c);
    }
}