*** Settings ***
Library     Selenium2Library

***Variables***

*** Keywords ***
Start browser and maximize
    [Arguments]     ${URL}      ${Browserr}
    
    Open Browser    ${URL}      ${Browserr}     
    Maximize Browser Window

Close browserr
    Close browser