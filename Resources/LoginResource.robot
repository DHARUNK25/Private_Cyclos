*** Settings ***

Documentation    All the page objects and keywords of Login page
Library    SeleniumLibrary

*** Variables ***
${username}    css:input[placeholder="User"]
${password}    css:input[placeholder="Password"]
${submit_btn}    xpath://button[@class="btn d-flex justify-content-center align-items-center w-100 h-100 btn-primary btn-action-primary"]
${forgot_pass}    css:a[class="d-block login-margin-top"]
${alert}    css:div[class="notification-message"]
${error}    css:div[class="invalid-feedback"]

*** Keywords ***

Fill the login form
    [Arguments]    ${user}    ${pass}
    Input Text    ${username}    ${user}
    Input Password    ${password}    ${pass}

click the login button
    Click Button    ${submit_btn}

check the error message
    Wait Until Element Is Visible    ${alert}
    Element Text Should Be    ${alert}    The given name / password are incorrect. Please, try again.

check the empty field alert
    Element Text Should Be    ${error}    This field is required

