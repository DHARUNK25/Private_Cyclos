*** Settings ***
Documentation    All the page objects and keywords of My Advertisement page
Library    SeleniumLibrary

*** Variables ***
${advertisements}    xpath://div[text()="My advertisements"]
${add_new}    xpath://div[text()="Add new"]
${Title}    xpath://input-field[@formcontrolname="name"]/label-value/div/div/input
${category}    xpath://single-selection-field[@formcontrolname="categories"]/label-value/div/div/div/button
${item}    xpath:(//a[@class="select-option leaf level0 mt-1"])[1]
${price}    css:input[type="tel"]
${textArea}    xpath://div[@class="wrapper"]/div[@class="editor"]
${save_btn}    css:button[class="btn d-flex justify-content-center align-items-center w-100 h-100 btn-primary"]
${keywords}    xpath://input-field[@formcontrolname="keywords"]/label-value/div/div/input
${search_result}    xpath://div[@class="card-text"]
${searched_element}    Lion

*** Keywords ***

click my advertisements
    Wait Until Element Is Visible    ${advertisements}
    Click Element    ${advertisements}

add new advertisements
    Wait Until Element Is Visible    ${add_new}
    Click Element    ${add_new}

fill the advertisement
    Input Text    ${Title}    Orange
    Click Element    ${category}
    Click Element    ${item}
    Input Text    ${price}    200
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Enabled    ${textArea}
    Input Text    ${textArea}    It's very Delicious

click save button
    Click Button    ${save_btn}

search functionality
    Click Element    ${keywords}
    Input Text    ${keywords}    ${searched_element}  
    Sleep    5s

verify the result
    Sleep    5s
    ${element}    Get Text    ${search_result} 
    Should Be Equal As Strings    ${element}    ${searched_element}
