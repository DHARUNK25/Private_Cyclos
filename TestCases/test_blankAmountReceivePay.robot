*** Settings ***
Documentation    This checks the Receive payment fubctionality
Library    SeleniumLibrary
Resource    ../Resources/ReceivePaymentResouce.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Library    DataDriver    file=../TestData/receivePay_data.xlsx   sheet_name=blank_amt_data
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    Validate the Receive payment functionality with empty amount

*** Variables ***
${user}
${blank_amount}
${description}

*** Test Cases ***
Validate Receive payment with data    ${user}    ${blank_amount}    ${description}
    [Tags]  smoke
*** Keywords ***
Validate the Receive payment functionality with empty amount
    [Documentation]    This checks the Receive payment functionality with empty amount
    [Arguments]    ${user}    ${blank_amount}    ${description}
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceivePaymentResouce.Verify the Receive payment page
    ReceivePaymentResouce.Fill the receive payment form with data    ${user}    ${blank_amount}  
    ReceivePaymentResouce.Select the schedule
    ReceivePaymentResouce.Fill the description     ${description}
    ReceivePaymentResouce.Click the next button
    ReceivePaymentResouce.verify amount error message is displayed