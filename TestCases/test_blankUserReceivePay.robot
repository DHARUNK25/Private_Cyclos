*** Settings ***
Documentation    This checks the Receive payment functionality
Library    SeleniumLibrary
Resource    ../Resources/ReceivePaymentResouce.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Library    DataDriver    file=../TestData/receivePay_data.xlsx   sheet_name=blank_user_data
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    Validate the Receive payment functionality with empty user data

*** Variables ***
${blank_user}
${amount}
${description}

*** Test Cases ***

Validate Receive payment with empty user data    ${blank_user}    ${amount} 
    [Tags]  smoke
*** Keywords ***
Validate the Receive payment functionality with empty user data
    [Documentation]    This checks the Receive payment functionality with empty user data
    [Tags]  invalid_Receive_payment
    [Arguments]    ${blank_user}    ${amount}    
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    demo    1234
    LoginResource.click the login button
    HomeResource.Verify the Banking page is displayed
    ReceivePaymentResouce.Verify the Receive payment page
    ReceivePaymentResouce.Fill the receive payment form with data    ${blank_user}    ${amount}
    ReceivePaymentResouce.Click the next button
    ReceivePaymentResouce.verify user error message is displayed
