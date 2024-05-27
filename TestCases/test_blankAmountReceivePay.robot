*** Settings ***
Documentation    This checks the Receive payment fubctionality
Library    SeleniumLibrary
Resource    ../Resources/ReceivePaymentResouce.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
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

*** Keywords ***
Validate the Receive payment functionality with empty amount
    [Documentation]    This checks the Receive payment functionality with empty amount
    [Tags]  invalid_Receive_payment
    [Arguments]    ${user}    ${blank_amount}    ${description}
    LoginResource.Fill the Login page
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceivePaymentResouce.Verify the Receive payment page
    ReceivePaymentResouce.Fill the receive payment form with data    ${user}    ${blank_amount}    ${description}  
    ReceivePaymentResouce.verify amount error message is displayed