import { LightningElement } from 'lwc';

export default class helloWorld extends LightningElement {
    name //; // undefined 
    fullname = 'Salesforce LWC'//;
    age = 25 //;
    location = {
        city:"Houston",
        country : "United States",
        postalCode : "456000"    
    };
    fruits = ["Apple" , "Orange" , "Papaya", " Banana" , "Pineapple"];
}