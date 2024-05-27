*** Settings ***
Documentation    This checks the Receive QR code fubctionality
Library    SeleniumLibrary
Resource    ../Resources/ReceiveQRcodeResources.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Library    DataDriver    file=../TestData/qrcode.xlsx   sheet_name=blank
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    Validate the Receive QR code functionality with empty data
*** Variables ***
${blank_amount}
${blank_description}

*** Test Cases ***
Validate Receive QR code with valid data    ${blank_amount}    ${blank_description}

*** Keywords ***
Validate the Receive QR code functionality with empty data
    [Documentation]    This checks the qr code with blank data
    [Tags]  invalid_ReceiveQRCode
    [Arguments]    ${blank_amount}    ${blank_description}
    LoginResource.Fill the Login page
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceiveQRcodeResources.Verify the Receive qr code page
    ReceiveQRcodeResources.Fill the payment form with data    ${blank_amount}    ${blank_description}
    ReceiveQRcodeResources.verify error message is displayed   


