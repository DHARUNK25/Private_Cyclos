*** Settings ***
Documentation    This checks the Receive payment functionality
Library    SeleniumLibrary
Resource    ../Resources/ReceivePaymentResouce.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Library    DataDriver    file=../TestData/receivePay_data.xlsx   sheet_name=invalid_data
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    Validate the Receive payment functionality with empty data

*** Variables ***
${invalid_user}

*** Test Cases ***
Validate Receive payment with data    ${invalid_user}    
    [Tags]  smoke
*** Keywords ***
Validate the Receive payment functionality with empty data
    [Documentation]    This checks the Receive payment functionality with empty data
    [Tags]  invalid_Receive_payment
    [Arguments]    ${invalid_user}
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceivePaymentResouce.Verify the Receive payment page
    ReceivePaymentResouce.Fill the user data    ${invalid_user}
    ReceivePaymentResouce.verify alert is displayed