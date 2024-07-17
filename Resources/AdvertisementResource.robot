*** Settings ***
Documentation    All the page object and keyword of Advertisement page
Library    SeleniumLibrary

*** Variables ***
${market_title}    xpath://div[@class="side-menu-icon"]//following-sibling::div
${Advertisement}    xpath://div[text()='Advertisements']
${Advertisement_title}    xpath://div[text()=' Search advertisements ']
${keyword}    xpath=(//div[@class='d-flex label-value-value']//input)[1]
${show_advertisement}    xpath://span[text()="Show advertisements"]
${order_By}    xpath://div[@class='w-100 mw-100 text-truncate pr-3']
${Relevance}    xpath://a[@class="select-option mt-1"]
${last_published}    xpath://div[@class="dropdown-menu show"]//a[2]
${lowest_price}    xpath://div[@class="dropdown-menu show"]//a[3]
${highest_price}    xpath://div[@class="dropdown-menu show"]//a[4]
${keyword_based}    xpath:(//div[text()=' food '])[1]
#${invalid_keyword_message}    xpath:(//div[@class="page-content-body card-body d-flex flex-column"])[3]
${invalid_keyword_message}    xpath://div[text()='Invalid keywords']
${no_search_found_error_msg}    xpath://div[@class="page-content card d-flex flex-grow-1 layout-normal last mode-normal"]//div
${Advertisement_content}    xpath://div[@class="row category-results"]//div
${favourite_item}    xpath://label[@class="custom-control-label"]
${relevant_results}    xpath://div[@class='row tiled-results']
${expected_relevant_result}    food
${donut}    xpath://div[text()=" Donuts "]
${relevance_item}    xpath:(//div[text()=" Orange "])[1]
${lowest_price_item}    xpath://div[text()=" Java Development Course "]
${highest_price_item}    xpath://div[text()=" test1 "]
${like_button}    xpath://div[text()='Add to favorites']


*** Keywords ***


verify that the markerplace is open
    Element Text Should Be   ${market_title}     Marketplace   

Click on the advertisement page button
    Wait Until Element Is Visible    ${Advertisement}
    Click Element    ${Advertisement}

Verify the Advertisement page
    Element Text Should Be    ${Advertisement_title}    Search advertisements

Enter the valid Keyword in the keyword box
    Input Text    ${keyword}    food  

Click the show advertisement button
    Click Element    ${show_advertisement}

verify the keyword based items displayed
    Wait Until Element Is Visible   ${keyword_based}
    Element Text Should Be    ${keyword_based}     food 

Enter the invalid Keyword in the keyword box    
    Wait Until Element Is Visible    ${keyword}
    Input Text    ${keyword}    @#$!

verify the invalid keyword error message is displayed
    Wait Until Element Is Visible    ${invalid_keyword_message}
    Element Text Should Be    ${invalid_keyword_message}    Invalid keywords      

verify the no result match message display
    Element Text Should Be    ${no_search_found_error_msg}      No results match the search criteria    

verify the relevance result matches
    ${list_of_elements}=    Get WebElements    ${relevant_results}
    FOR  ${element}    IN    @{list_of_elements}
        ${text}=    Get Text    ${element}
        Should Contain    ${text}    ${expected_relevant_result} 
    END

Click on the dropdown button Order by
    Click Element    ${order_By}


Select the option relevance
    Click Element    ${Relevance}

verify relevance option
    Wait Until Element Is Visible      ${relevance_item}
    Element Text Should Be    ${relevance_item}     Orange 


Select the option last published
    Click Element    ${last_published}


Select the option lowest price
    Click Element    ${lowest_price}

verify the lowest price
    Element Text Should Be    ${lowest_price_item}     Java Development Course 

Select the option highest price
    Click Element    ${highest_price}

verify the highest price
    Element Text Should Be    ${highest_price_item}     test1 




Number of product displayed
    Wait Until Page Contains Element    ${Advertisement_content}  
    ${products}=    Get WebElements    ${Advertisement_content}
    ${product_count}=    Get Length    ${products}
    Log    Number of products displayed: ${product_count}

Select the favourite only checkbox
    Click Element    ${favourite_item}


verify the favourite list contains favorite item
    Element Text Should Be    ${donut}     Donuts 



Enter the keyword in the search 
    Wait Until Element Is Visible    ${keyword}
    Input Text    ${keyword}    donut

click the element donut
    Wait Until Element Is Visible    ${donut}
    Click Element    ${donut}

click the like button
    Wait Until Element Is Visible    ${like_button}
    Click Element    ${like_button}