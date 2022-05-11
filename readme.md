# Installation

1. git clone
2. box install
3. box server start

# Test the Issue

Hit this endpoint /user/password/request/create and notice the error message, should look like this:

![image](https://user-images.githubusercontent.com/991677/167962704-2c8a5ed4-a491-4c9e-9105-5cb33d73fb1a.png)

1. An email log will written to /logs folder
2. Yet the coldbox renderer is still looking for Main layout and the view for the handler of the endpoint mentioned above.

