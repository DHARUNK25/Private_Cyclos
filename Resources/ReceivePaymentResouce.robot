***Settings***
Documentation    All the page object and keyword of Member account page
Library    SeleniumLibrary
Resource    HomeResource.robot

*** Variables ***
${receive_payment}    xpath:(//nav[@class='navbar d-flex flex-column align-items-stretch']//a/div)[4]
${rec_pay_verify}    xpath://div[text()=' Receive payment ']
${rec_pay_verify_keyword}    Receive payment
${input_user}    xpath://input[@placeholder='Type to search']
${input_amount}    xpath://div[@class='input-group']/input
${schedue}    xpath://button[@class='form-control text-left custom-select w-100']
${pay_type}    xpath://div[@role='listbox']//a[text()=' Pay now ']
${descrip_xpath}    xpath://div[@class='d-flex label-value-value']//textarea
${next_button}    xpath://action-button/button
${amt_error_mesg}    xpath:(//div[@class='d-flex label-value-value']/field-errors/div)
${user_error_msg}    xpath:(//div[@class='d-flex label-value-value']//field-errors/div)[1]
${confirm_button}    xpath://button//span[text()='Confirm']

*** Keywords ***

Verify the Receive payment page
    Wait Until Element Is Visible    ${receive_payment}
    Click Element   ${receive_payment}
    Element Text Should Be    ${rec_pay_verify}    ${rec_pay_verify_keyword}

Fill the receive payment form with data
    [Arguments]    ${user}    ${amount}    ${description}
    Input Text    ${input_user}    ${user}
    Input Text    ${input_amount}    ${input_amount}
    Click Button    ${schedue}
    Click Element    ${pay_type}
    Input Text    ${descrip_xpath}    ${description}
    Click Button    ${next_button}

Verify the confirmation page is displayed
    Element Should Be Visible    ${confirm_button}
    Click Button    ${confirm_button}

verify user error message is displayed
    Element Should Be Visible    ${user_error_msg}

verify amount error message is displayed
    Element Should Be Visible    ${amt_error_mesg}