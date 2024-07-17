*** Settings ***
Documentation    This checks the Member account fubctionality
Library    SeleniumLibrary
Resource    ../Resources/MemberAccountResource.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Test Setup    Open the Browser with URL
Test Teardown    close Browser session


*** Test Cases ***
Validate the Member Account
    [Documentation]     validate the balance and transaction
    [Tags]    smoke
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    MemberAccountResource.Verify the Member account page
    MemberAccountResource.Verify the balance
    MemberAccountResource.Assert the transaction data   