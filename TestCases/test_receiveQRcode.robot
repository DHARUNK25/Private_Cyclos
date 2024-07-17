*** Settings ***
Documentation    This checks the Receive QR code fubctionality
Library    SeleniumLibrary
Resource    ../Resources/ReceiveQRcodeResources.robot
Resource    ../Resources/HomeResource.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Test Setup    Open the Browser with URL
Test Teardown    close Browser session

*** Variables ***
${amount}    100
${blank_amount}
${description}    "Payment through QR code"
${blank_description}

*** Test Cases ***
Validate the Receive QR code functionality with valid data
    [Documentation]  To validate the Receive qr code feature
    [Tags]  valid_ReceiveQRCode
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceiveQRcodeResources.Verify the Receive qr code page
    ReceiveQRcodeResources.Fill the payment form with data    ${amount}    ${description}
    ReceiveQRcodeResources.Verify the qr code is displayed

Validate the Receive QR code functionality with empty data
    [Documentation]  To validate the Receive qr code feature
    [Tags]  invalid_ReceiveQRCode
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceiveQRcodeResources.Verify the Receive qr code page
    ReceiveQRcodeResources.Fill the payment form with data    ${blank_amount}    ${blank_description}
    ReceiveQRcodeResources.verify error message is displayed

Validate the Receive QR code functionality with empty amount data
    [Documentation]  To validate the Receive qr code feature
    [Tags]  invalid_ReceiveQRCode
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceiveQRcodeResources.Verify the Receive qr code page
    ReceiveQRcodeResources.Fill the payment form with data    ${blank_amount}    ${description}
    ReceiveQRcodeResources.verify error message is displayed

Validate the Receive QR code functionality with blank description
    [Documentation]  To validate the Receive qr code feature
    [Tags]  invalid_ReceiveQRCode
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    sandhiyas    Sand@123
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    ReceiveQRcodeResources.Verify the Receive qr code page
    ReceiveQRcodeResources.Fill the payment form with data    ${amount}    ${blank_description}
    ReceiveQRcodeResources.Verify the qr code is displayed

