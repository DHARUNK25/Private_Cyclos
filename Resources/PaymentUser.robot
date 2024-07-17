*** Settings ***
Documentation    All the page object and keyword of Payment to user Page
Library    SeleniumLibrary

*** Variables ***
${select_payment_to_user}    xpath://div[text()="Payment to user"]
${payment_user_title}    xpath://div[@class="content-title d-flex"]//div
${to_User}    xpath://input[@placeholder="Type to search"]
${user_select}    xpath://div[@role='listbox']/a[text()=' Demo one ']
${amount}    xpath://div[@class="input-group"]//input
${to_user_error_msg}    xpath:(//field-errors)[1]//div
${amount_error_msg}    xpath:(//field-errors)[2]//div
${Scheduling_opt}    xpath://button[@class='form-control text-left custom-select w-100']
${monthly_inst_option}    xpath://div[@role='listbox']//a[text()=' Monthly installments ']
${no_of_installments}    xpath://div[@class='d-flex label-value-value']//input[@type='number']
${first_instal}    xpath://label[@class='custom-control-label' and text()=' Future date ']
${future_date}    xpath://div[@class='d-flex label-value-value']//input[@type='date']
${descrip_xpath}    xpath://div[@class='d-flex label-value-value']//textarea
${pay_confirm_title}    xpath://div[text()=' Payment confirmation ']
${confirm_button}    xpath://span[text()='Confirm']
${successfull_payment_msg}    xpath://div[@class="notification-message"]//div
${user_name}    demo  
${amount_data}    10  
${inst_no}    5  
${fut_date}    30-05-2024     
${description}    Monthly Installments
${Banking_title}    xpath://div[@class="side-menu-header"]//following-sibling::div
${select_user}    xpath://div[@class="dropdown-menu show"]//a[1]
${amount}    xpath://div[@class="input-group"]//input
${invalid_amount_error_msg}    xpath://div[@class='invalid-feedback']
${Scheduling}    xpath://button[@title="Pay now"]
${pay_now_option}    xpath://a[text()=' Pay now ']

${next}    xpath://action-button[@class="d-inline-block button"]/button

${exceed_max_payment_error_msg}    xpath://div[@class="notification-message"]
${expected_error_msg}    You have exceeded the maximum of payments per day for the demo network
${successfull_payment_msg}    xpath://div[@class='notification-message']//div


${recurring_payment}    xpath://a[text()=" Recurring payments "]
${click_process_every}    xpath:(//div[@class="w-100"])[2]//button
${click_week}    xpath://a[text()=" Weeks "]
${process_every_value}    xpath://input[@class="form-control text-right ng-valid ng-touched ng-dirty"]

${cancel_recurring_payment}    xpath://div[text()='Cancel this recurring payment']
${cancellation_status}    xpath://div[text()=" Canceled "]

*** Keywords ***


verify the Banking page open
    Wait Until Element Is Visible    ${Banking_title} 
    Element Text Should Be    ${Banking_title}     Banking 

Select the option payment to user
    Wait Until Element Is Visible    ${select_payment_to_user}
    Click Element    ${select_payment_to_user}

verify the payment to user page open
    Element Text Should Be    ${payment_user_title}      Payment to user  

Enter the username in the to user field
    [Arguments]    ${user_name}
    Input Text    ${to_User}    ${user_name}

Select the user from list
    Click Element    ${user_select}

Select the user
    Click Element    ${select_user}


verify the error message for user to field is given blank
    Wait Until Element Is Visible    ${to_user_error_msg}
    Element Text Should Be    ${to_user_error_msg}     This field is required

verify the error message for amount field is given blank
    Wait Until Element Is Visible    ${amount_error_msg}
    Element Text Should Be    ${amount_error_msg}     This field is required

verify exceeded amount is entered
    Wait Until Element Is Visible    ${invalid_amount_error_msg}
    Element Text Should Be    ${invalid_amount_error_msg}      Amount must be less or equal to 500,00 IU's.

Enter the valid amount in the amount field
    [Arguments]    ${amount_data}
    Input Text    ${amount}    ${amount_data}

Click the scheduling field
    Click Element    ${Scheduling_opt}

Click the monthly installment option
    Click Element    ${monthly_inst_option}

Fill the no of installments
    [Arguments]    ${no_of_installments_data}
    Input Text    ${no_of_installments}    ${no_of_installments_data}

Click the first installment
    Click Element    ${first_instal}

Fill the future date
    [Arguments]    ${fut_date}
    Input Text    ${future_date}    ${fut_date}

Fill the description
    [Arguments]    ${description}
    Input Text    ${descrip_xpath}    ${description}

Click the scheduling dropdown button
    Click Element    ${Scheduling}

Click the pay now option
    Click Element    ${pay_now_option}

Click the next Button in payment page
    Wait Until Element Is Visible    ${next}
    Click Element    ${next}

Verify the confirmation page is displayed
    Element Should Be Visible    ${pay_confirm_title}

Click the confirm button in the payment page
    Wait Until Element Is Visible    ${confirm_button}
    Click Element    ${confirm_button}

verify the succesfull payment notification
    Wait Until Element Is Visible    ${successfull_payment_msg}
    Element Text Should Be    ${successfull_payment_msg}    The payment was successfully processed

verify the exceed maximun payment error message is dispalyed
    Wait Until Element Is Visible    ${exceed_max_payment_error_msg}
    ${actual_error_msg}    Get Text    ${exceed_max_payment_error_msg}
    Should Be Equal    ${actual_error_msg}    ${expected_error_msg}

Select the Recurring payment option
    Click Element    ${recurring_payment}

Click the process every dropdown list
    Click Element    ${click_process_every}

Select the week in process every dropdown list
    Click Element    ${click_week}



Click Cancel the recurring payment
    Wait Until Element Is Visible    ${cancel_recurring_payment}
    Click Element    ${cancel_recurring_payment}
    Click Element    ${confirm_button}

verify the cancellation status
    Wait Until Element Is Visible     ${cancellation_status}
    Element Text Should Be    ${cancellation_status}    Canceled    







