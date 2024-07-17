*** Settings ***
Documentation    All the page objects and keywords of Register page
Library    SeleniumLibrary

*** Variables ***
${name_field}    xpath://input-field[@formcontrolname="name"]/label-value/div/div/input
${loginName_field}    xpath://input-field[@formcontrolname="username"]/label-value/div/div/input
${email_field}    xpath://input-field[@formcontrolname="email"]/input
${website_field}    css:input[name="website"]
${female_checkbox}    xpath:(//input[@name="gender"])[1]
${male_checkbox}    xpath:(//input[@name="gender"])[2]
${business_type}    css:button#business_type
${clothing}    css:a#business_type_clothing
${mobile_number}    xpath:(//input-field[@formcontrolname="number"]/input)[1]
${Landline_number}    xpath:(//input-field[@formcontrolname="number"]/input)[2]
${address_enable}    xpath:(//label[@class="custom-control-label"])[3]
${address_line1}    xpath:(//label-value[@class="label-on-side label-value any-label-value field"]/div/div/input)[3]
${zip_code}    css:input#zip
${city_field}    css:input#city
${region_field}    css:input#region
${country}    css:button#country
${next_btn}    xpath:(//action-button[@class="d-inline-block button"]/button)[3]
${man_next_btn}    xpath:(//action-button[@class="d-inline-block button"]/button)[2]
${password_field}    xpath://input-field[@formcontrolname="value"]/label-value/div/div/input
${confirm_password}    xpath://input-field[@formcontrolname="confirmationValue"]/label-value/div/div/input
${demo_checkbox}    xpath://accept-agreements[@formcontrolname="acceptAgreements"]/div/div/div/boolean-field/div/label
${submit_btn}    xpath:(//action-button[@class="d-inline-block button"]/button)[1]  
${password_validation}    css:li[class="invalid"] 
${field_required}    css:div[class="invalid-feedback"]
${verify_register}    xpath://div[text()=" User registration "]
${value}    male
${value1}    female


*** Keywords ***

Verify Register Page opens
    Element Should Contain    ${verify_register}    User registration


Fill the Required feilds
    [Arguments]    ${name}    ${login_name}    ${email}    

    Input Text    ${name_field}    ${name}
    Input Text    ${loginName_field}    ${login_name}
    Input Text    ${email_field}    ${email}

Fill the Remaining profile feilds
    [Arguments]    ${website}    ${gender}    ${mobile_number1}    ${landline}

    Input Text    ${website_field}    ${website} 
    Click Element    ${business_type}
    Click Link    ${clothing}
    Input Text    ${mobile_number}    ${mobile_number1}
    Input Text    ${Landline_number}    ${landline}

Enable address fields
    Click Element    ${address_enable}

Fill the address fields
    [Arguments]    ${address}    ${zip}    ${city}    ${region}
    # Wait Until Element Is Visible    ${address_line1}
    Input Text    ${address_line1}    ${address}
    Input Text    ${zip_code}    ${zip}
    Input Text    ${city_field}    ${city}
    Input Text    ${region_field}    ${region}

Click next button
    Wait Until Element Is Visible    ${next_btn}
    Click Button    ${next_btn}

fill password fields
    [Arguments]    ${pass}    ${cpass}
    Input Password    ${password_field}    ${pass}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Enabled    ${confirm_password} 
    Input Text    ${confirm_password}    ${cpass}

click Registration confirmation checkbox
    Click Element    ${demo_checkbox}

click submit button
    Click Button    ${submit_btn}

verify the registration is successful
    Element Text Should Be    ${field_required}    This field is required

verfication for necessary fields
    Element Text Should Be    ${field_required}    This field is required

verification for password
    Element Text Should Be    ${password_validation}     At least 4 characters ✗ 

verification for confirmPassword
    Element Text Should Be    ${field_required}    The passwords don't match

clicking next button for mandatory field
    Wait Until Element Is Visible    ${man_next_btn}
    Click Button    ${man_next_btn}

verification for invalid email
    Element Text Should Be    ${field_required}    This field is invalid

verification for email already exists
    Element Text Should Be    ${field_required}    E-Mail must be unique.





    
    
    
    

    

