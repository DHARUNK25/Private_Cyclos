*** Settings ***
Documentation    All the page objects and keywords of Home page
Library    SeleniumLibrary
*** Variables ***
${Banking_Xpath}    xpath://a[@id='menu_banking']
${Banking_page_verify}    xpath://div[text()='Banking']
${Banking_page_keyword}    Banking
*** Keywords ***
Click the Banking Option
     Wait Until Element Is Visible    ${Banking_Xpath}   
     Click Element   ${Banking_Xpath} 
     
Verify the Banking page is displayed
    Element Text Should Be    ${Banking_page_verify}    ${Banking_page_keyword}
