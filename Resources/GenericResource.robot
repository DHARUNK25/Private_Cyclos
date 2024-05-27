*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${url}    https://demo.cyclos.org/ui/home
${brower_name}    Chrome

*** Keywords ***

Open the Browser with URL
    Create Webdriver    Chrome  
    Go To       ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5
 
Close Browser Session
    Close Browser