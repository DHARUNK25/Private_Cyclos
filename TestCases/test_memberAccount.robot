*** Settings ***
Documentation    This checks the Member account fubctionality
Library    SeleniumLibrary
Resource    ../Resources/MemberAccountResource.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Test Setup    Open the Browser with URL
Test Teardown    close Browser session


*** Test Cases ***
TC_001: Validate the Member Account
    [Documentation]     validate the balance and transaction
    [Tags]    member_account
    LoginResource.Fill the Login page
    HomeResource.Click the Banking Option
    HomeResource.Verify the Banking page is displayed
    MemberAccountResource.Verify the Member account page
    MemberAccountResource.Verify the balance
    MemberAccountResource.Assert the transaction data   