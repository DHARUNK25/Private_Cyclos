***Settings***
Documentation    All the page object and keyword of Business Directory page
Library    SeleniumLibrary

*** Variables ***
${business_dir}    xpath:(//nav[@class='navbar d-flex flex-column align-items-stretch']//a/div)[1]
${business_dir_title}    xpath://div[text()=' Business directory ']
${business_dir_title_verify}     Business directory 
${input_key}    xpath://div[@class='d-flex label-value-value']/input
${key_error_msg}    xpath://div[text()=' No results match the search criteria  ']
${key_error_alert}    xpath://div[@class='notification-message']
${alert_text}    Invalid keywords
${order_by_xpath}    xpath://button[@class='form-control text-left custom-select w-100']
${relevance_option}    xpath://div[@role='listbox']//a[text()='Relevance']
${relev_results}    xpath://div[@class='row tiled-results']
${expected_relev_res}    shop
${contact}    xpath:(//div[@class='row tiled-results']//a)[3]
${add_to_contact}    xpath://div[text()='Add to contacts']
${add_contact_verify}    xpath://div[text()='Remove from contacts']

*** Keywords ***
Select the option business directory
    Wait Until Element Is Visible    ${business_dir}
    Click Element    ${business_dir}

verify the business directory page open
    Element Text Should Be    ${business_dir_title}      ${business_dir_title_verify}  

Enter the key in keyword field
    [Arguments]    ${keyword}
    Input Text    ${input_key}    ${keyword}

Verify the invalid key alert
    Wait Until Element Is Visible    ${key_error_alert}
    Element Text Should Be    ${key_error_alert}    ${alert_text}

Verify the invalid error message
    Element Should Be Visible    ${key_error_msg}

Click the orderby button
    Click Button    ${order_by_xpath}

Click the relevance option
    Click Element    ${relevance_option}

Verify the relevance results
    ${list_of_elements}=    Get WebElements    ${relev_results}
    FOR  ${element}    IN    @{list_of_elements}
        ${text}=    Get Text    ${element}
        Should Contain    ${text}    ${expected_relev_res} 
    END

Add user to Contact
    Wait Until Element Is Visible     ${contact}
    Click Element    ${contact}
    Wait Until Element Is Visible     ${add_to_contact}
    Click Element    ${add_to_contact}

Verify the contact is added
    Element Should Be Visible    ${add_contact_verify}
