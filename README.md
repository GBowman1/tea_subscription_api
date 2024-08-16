# Tea Subscription API
<h2> This service is designed to provide data for customers and there subscriptions to teas, the API is organized under the `api/v1` namespace and follows RESTful conventions. This API allows the users to create, cancel and view subscriptions belonging to a customer </h2>

## Table of Contents
- [Endpoints](#endpoints)
- [Responses](#responses)
- [Contributors](#contributors)

## Endpoints

### Subscriptions
- **`GET /api/v1/customers/customer_id/subscriptions`**
  - Returns a list of all of a specific customers subscriptions.
    
- **`POST /api/v1/customers/customer_id/subscriptions`**
  - Creates a subscription for a customer to a tea.
  - Parameters needed:
	•	title: The title of the subscription.
	•	price: The price of the subscription.
	•	frequency: The frequency of the subscription (e.g., weekly, monthly).
	•	tea_id: The ID of the tea being subscribed to.
    
- **`DELETE /api/v1/customers/customer_id/subscriptions/subscription_id`**
  - cancels the customers subscription to a tea.

## Responses
- All endpoints return data in JSON Format



### Creating a subscription 
<h5>REQUEST:</h5>
 <img width="1004" alt="Screenshot 2024-08-16 at 1 31 47 PM" src="https://github.com/user-attachments/assets/12d2ccdb-60e4-4b11-90e5-c5b3df3326c9">
 
<h5>RESONSE:</h5>
<img width="877" alt="Screenshot 2024-08-16 at 1 32 36 PM" src="https://github.com/user-attachments/assets/834fc110-b398-41d1-b866-a08eabea870f">


### Viewing a customers subscriptions
<h5>REQUEST: GET http://localhost:3000/api/v1/customers/1/subscriptions </h5>

<h5>RESONSE:</h5>
<img width="896" alt="Screenshot 2024-08-16 at 1 36 40 PM" src="https://github.com/user-attachments/assets/38eb5289-e645-4cab-8149-9e22f592219c">


### Deleting a customers subscriptions
<h4>REQUEST: DELETE http://localhost:3000/api/v1/customers/1/subscriptions/1 </h4>

<h5>RESONSE:</h5>
<img width="881" alt="Screenshot 2024-08-16 at 1 39 59 PM" src="https://github.com/user-attachments/assets/009f4b5a-38d6-4be4-8464-51c054cf9576">


 ## Contributors
- [Garrett Bowman](https://github.com/GBowman1)

