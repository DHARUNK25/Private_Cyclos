*** Settings ***
Documentation    All the page objects and keywords of HomePage page
Library    SeleniumLibrary


*** Variables ***
${register_btn}    xpath://div[text()=" Register "]
${verify_login}    xpath:(//div[@class="top-title"])[2]
${login_btn}    xpath:(//div[@class="ml-2"])[3]
${Marketplace}    xpath://div[text()="Marketplace"]
#${Marketplace}    xpath:(//div[@class="menu-container"]//a)[3]
${Banking}    xpath://div[text()='Banking']
${Banking_page_verify}    xpath://div[text()='Banking']
${Banking_page_keyword}    Banking
${Logout}    xpath://a[@aria-label="Logout"]//icon//*[name()="svg"]
${Marketplace_Xpath}    xpath://a[@id='menu_marketplace']
${Marketplace_page_verify}    xpath://div[@class='side-menu-title' and text()=' Marketplace ']
${Marketplace_page_keyword}    Marketplace

*** Keywords ***

Go to Register Page
    Sleep    5s
    Click Element    ${register_btn}

verify the login
    Element Text Should Be    ${verify_login}    Cyclos

Go to Login Page
    Sleep    5s
    Click Element    ${login_btn}

Go to MarketPlace Page
    Click Element    ${Marketplace}

Click on the MarketPlace button
    Wait Until Element Is Visible    ${Marketplace}
    Click Element     ${Marketplace}

Click on the Banking button
    Wait Until Element Is Visible    ${Banking}
    Click Element     ${Banking}

Click the Banking Option
     Wait Until Element Is Visible    ${Banking}   
     Click Element   ${Banking} 
     
Verify the Banking page is displayed
    Element Text Should Be    ${Banking_page_verify}    ${Banking_page_keyword}

click the logout 
    Wait Until Element Is Visible   ${Logout}
    Click Element    ${Logout}


Click the Marketplace Option
     Wait Until Element Is Visible    ${Marketplace_Xpath}   
     Click Element   ${Marketplace_Xpath} 
     
Verify the Marketplace page is displayed
    Element Text Should Be    ${Marketplace_page_verify}    ${Marketplace_page_keyword}


