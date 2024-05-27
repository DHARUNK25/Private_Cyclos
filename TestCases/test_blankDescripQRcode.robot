*** Settings ***
Documentation    This checks the Receive QR code fubctionality
Library    SeleniumLibrary
Resource    ../Resources/ReceiveQRcodeResources.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Library    DataDriver    file=../TestData/qrcode.xlsx   sheet_name=blank_desc_data
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    Validate the Receive QR code functionality with blank description
*** Variables ***
${amount}
${blank_description}

*** Test Cases ***
Validate Receive QR code with valid data    ${amount}    ${blank_description}

*** Keywords ***
Validate the Receive QR code functionality with blank description
     [Documentation]    This checks the qr code with blank description
    [Tags]  valid_ReceiveQRCode
    [Arguments]    ${amount}    ${blank_description}
    LoginResource.Fill the Login page
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceiveQRcodeResources.Verify the Receive qr code page
    ReceiveQRcodeResources.Fill the payment form with data    ${amount}    ${blank_description}
    ReceiveQRcodeResources.Verify the qr code is displayed
