*** Settings ***
Documentation    To validate Banking - payment to user Functionality
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Resource    ../Resources/PaymentUser.robot
 
*** Test Cases ***
To validate payment to user functionality with valid data 
    [Tags]    smoke 
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the username in the to user field   ${user_name}
    PaymentUser.Select the user
    PaymentUser.Enter the valid amount in the amount field     ${amount_data}
    PaymentUser.Click the scheduling dropdown button
    PaymentUser.Click the monthly installment option
    PaymentUser.Fill the no of installments    ${inst_no}
    PaymentUser.Click the first installment
    PaymentUser.Fill the future date    ${fut_date}
    PaymentUser.Fill the description    ${description}
    PaymentUser.Click the next Button in payment page
    PaymentUser.Verify the confirmation page is displayed
    PaymentUser.Click the confirm button in the payment page
    PaymentUser.verify the succesfull payment notification

To validate payment to user functionality with blank user name
    [Tags]    regression
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the valid amount in the amount field   ${amount_data}
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify the error message for user to field is given blank

To validate payment to user functionality with blank amount field
    [Tags]    regression
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Enter the username in the to user field   ${user_name}
    PaymentUser.Select the user
    PaymentUser.Click the scheduling dropdown button
    PaymentUser.Click the monthly installment option
    PaymentUser.Fill the no of installments    ${inst_no}
    PaymentUser.Click the first installment
    PaymentUser.Fill the future date    ${fut_date}
    PaymentUser.Fill the description    ${description}
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify the error message for amount field is given blank

To validate payment to user functionality with blank fields
    [Tags]    retest
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    PaymentUser.Select the option payment to user
    PaymentUser.verify the payment to user page open
    PaymentUser.Click the next Button in payment page
    PaymentUser.verify the error message for user to field is given blank
    PaymentUser.verify the error message for amount field is given blank


