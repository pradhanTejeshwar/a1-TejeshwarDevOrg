import { LightningElement } from 'lwc';

export default class ExploreParentDecorator extends LightningElement {
    handleCalculations() {
        this.template.querySelector('c-explore-a-p-i-decorator').handleSum(10,20);
    }
}