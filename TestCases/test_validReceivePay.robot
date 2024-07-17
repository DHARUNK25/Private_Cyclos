*** Settings ***
Documentation    This checks the Receive payment fubctionality
Library    SeleniumLibrary
Resource    ../Resources/ReceivePaymentResouce.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Library    DataDriver    file=../TestData/receivePay_data.xlsx   sheet_name=valid_data
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    Validate the Receive payment functionality with valid data

*** Variables ***
${user}
${amount}
${description}

*** Test Cases ***
Validate Receive payment with valid data    ${user}    ${amount}    ${description}
    [Tags]  smoke
*** Keywords ***
Validate the Receive payment functionality with valid data
    [Documentation]    This checks the Receive payment functionality with valid data
    [Arguments]    ${user}    ${amount}    ${description}
    HomeResource.Go to Login Page
    LoginResource.click the login button
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceivePaymentResouce.Verify the Receive payment page
    ReceivePaymentResouce.Fill the receive payment form with data    ${user}    ${amount}
    ReceivePaymentResouce.Select the schedule
    ReceivePaymentResouce.Fill the description    ${description} 
    ReceivePaymentResouce.Click the next button 
    ReceivePaymentResouce.Verify the confirmation page is displayed