*** Settings ***
Documentation    This checks the Business Directory functionality
Library    SeleniumLibrary
Resource    ../Resources/BusinessDirectoryResource.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Library    DataDriver    file=../TestData/busDir_data.xlsx   sheet_name=valid_data
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    To Validate the add to contact in Business Directory functionality

*** Variables ***
${valid_keyword}

*** Test Cases ***
Validate add to contact in Business Directory functionality    ${valid_keyword}
    [Tags]  regression
    
*** Keywords ***
To Validate the add to contact in Business Directory functionality
    [Documentation]    This checks the add to contact in Business Directory functionality
    [Arguments]    ${valid_keyword}
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    dharun    1234
    LoginResource.click the login button
    HomeResource.Click the Marketplace Option
    HomeResource.Verify the Marketplace page is displayed
    BusinessDirectoryResource.Select the option business directory
    BusinessDirectoryResource.verify the business directory page open
    BusinessDirectoryResource.Enter the key in keyword field    ${valid_keyword}
    BusinessDirectoryResource.Add user to Contact
    BusinessDirectoryResource.Verify the contact is added
