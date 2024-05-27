***Settings***
Documentation    All the page object and keyword of Member account page
Library    SeleniumLibrary
Resource    HomeResource.robot

*** Variables ***
${Member_acc}    xpath://div[text()='Member account']
${Member_acc_keyword_xpath}    xpath://div[text()=' Member account ']
${Member_acc_keyword}    Member account
${balance_xpath}    xpath://div[@class='status-label col-6 col-sm-3']/following-sibling::div
${table_xpath}    xpath://table[@class='table table-hover cursor-pointer']

*** Keywords ***
Verify the Member account page
    Wait Until Element Is Visible    ${Member_acc}
    Click Element   ${Member_acc}
    Element Text Should Be    ${Member_acc_keyword_xpath}    ${Member_acc_keyword}
    
Verify the balance
    Wait Until Element Is Visible    ${balance_xpath}
    ${balance}    Get Text    ${balance_xpath}
    Element Should Contain    ${balance_xpath}    ${balance}
    
Assert the transaction data
    Wait Until Element Is Visible    ${table_xpath}
    ${element_count}    Get Element Count    ${table_xpath}
    Should Not Be Equal As Numbers    0    ${element_count}
    Table Cell Should Contain    ${table_xpath}    2    5    +1,00 IU's    

