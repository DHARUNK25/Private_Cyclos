***Settings***
Documentation    All the page object and keyword of Member account page
Library    SeleniumLibrary

*** Variables ***
${receive_payment}    xpath://div[text()='Receive payment']
${rec_pay_verify}    xpath://div[text()=' Receive payment ']
${rec_pay_verify_keyword}    Receive payment
${input_user}    xpath://input[@placeholder='Type to search']
${input_amount}    xpath://div[@class='label-value-container']//div[@class='input-group']//input
${schedue}    xpath://button[@class='form-control text-left custom-select w-100']
${pay_type}    xpath://div[@role='listbox']//a[text()=' Pay now ']
${descrip_xpath}    xpath://div[@class='d-flex label-value-value']//textarea
${next_button}    xpath://action-button/button
${error_msg}    This field is required
${alert_xpath}    xpath://notification//div[@class='notification-message']
${alert_text}    Invalid keywords
${amt_error_mesg}    xpath:(//div[@class='d-flex label-value-value']/field-errors/div)
${user_error_msg}    xpath:(//div[@class='d-flex label-value-value']//field-errors/div)[1]
${confirm_button}    xpath:(//action-button[@class='d-inline-block button']//button)[1]

*** Keywords ***

Verify the Receive payment page
    Wait Until Element Is Visible    ${receive_payment}
    Click Element   ${receive_payment}
    Element Text Should Be    ${rec_pay_verify}    ${rec_pay_verify_keyword}

Fill the receive payment form with data
    [Arguments]    ${user}    ${amount}
    Input Text    ${input_user}    ${user}
    Input Text    ${input_amount}    ${amount}

Select the schedule
    Click Button    ${schedue}
    Click Element    ${pay_type}

Fill the description
    [Arguments]    ${description}
    Input Text    ${descrip_xpath}    ${description}
    
Click the next button
    Click Element    ${next_button}

Verify the confirmation page is displayed
    Element Should Be Visible    ${confirm_button}
    Click Button    ${confirm_button}

verify user error message is displayed
    Wait Until Element Is Visible    ${user_error_msg} 
    Element Text Should be    ${user_error_msg}    ${error_msg}

verify amount error message is displayed
    Element Should Be Visible    ${amt_error_mesg}

Fill the user data
    [Arguments]    ${user}
    Input Text    ${input_user}    ${user}

verify alert is displayed
    TRY
        Wait Until Element Is Visible    ${alert_xpath}
        Element Text Should Be    ${alert_xpath}    ${alert_text}
    EXCEPT
        Fatal Error    "Alert not found"
    END