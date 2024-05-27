*** Settings ***
Documentation    All the page object and keyword of Loginpage page
Library    SeleniumLibrary


*** Variables ***
${login_button}    xpath:(//div[text()=' Login '])[1]
${username_locator}    css:input[placeholder="User"]
${password_locator}    css:input[placeholder="Password"]
${submit_btn}    xpath://button[@class="btn d-flex justify-content-center align-items-center w-100 h-100 btn-primary btn-action-primary"]
${username}    dharun
${password}    1234

*** Keywords ***

Fill the Login page
    Wait Until Element Is Visible    ${login_button}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${username_locator}
    Input Text    ${username_locator}    ${username}
    Wait Until Element Is Visible    ${password_locator}
    Input Text    ${password_locator}    ${password}
    Wait Until Element Is Visible    ${submit_btn} 
    Click Element    ${submit_btn}
    
