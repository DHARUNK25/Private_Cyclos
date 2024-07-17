*** Settings ***
Documentation    This checks the Business Directory functionality
Library    SeleniumLibrary
Resource    ../Resources/BusinessDirectoryResource.robot
Resource    ../Resources/GenericResource.robot
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/HomeResource.robot
Library    DataDriver    file=../TestData/busDir_data.xlsx   sheet_name=valid_data
Test Setup    Open the Browser with URL
Test Teardown    close Browser session
Test Template    To Validate the Business Directory functionality with valid data

*** Variables ***
${valid_keyword}

*** Test Cases ***
Validate Business Directory functionality with valid data    ${valid_keyword}
    [Tags]  smoke
    
*** Keywords ***
To Validate the Business Directory functionality with valid data
    [Documentation]    This checks the Business Directory functionality with valid data
    [Arguments]    ${valid_keyword}
    HomeResource.Go to Login Page
    LoginResource.Fill the login form    demo    1234
    LoginResource.click the login button
    HomeResource.Click the Marketplace Option
    HomeResource.Verify the Marketplace page is displayed
    BusinessDirectoryResource.Select the option business directory
    BusinessDirectoryResource.verify the business directory page open
    BusinessDirectoryResource.Enter the key in keyword field    ${valid_keyword}
    BusinessDirectoryResource.Click the orderby button
    BusinessDirectoryResource.Click the relevance option
    BusinessDirectoryResource.Verify the relevance results
