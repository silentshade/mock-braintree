# Todo

##### Add additional `transaction` type calls
* refund
* void
* submit_for_settlement

##### Add more attributes to result and transaction objects to resemble all of, or most of Braintree's attributes

##### Add option to gateway reject (possibly based off of fake nonce value somehow) - revise documentation to list what values to change nonce in `transaction.sale` request to

#### Make requests wait several seconds before returning response to match actual request times

#### Add ability to create customer and/or payment method in transaction requests, return customer and payment method objects
