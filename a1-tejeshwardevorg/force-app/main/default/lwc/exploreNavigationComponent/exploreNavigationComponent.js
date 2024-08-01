import { LightningElement } from 'lwc';

import {NavigationMixIn} from 'lightning/navigation';

export default class ExploreNavigationComponent extends NavigationMixIn(LightningElement) {
    handleClick() {
        let payload = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
        }
    }
    this[NavigationMixin.Navigate](payload);
    }
}