*** Variables ***
# to run --- ( robot -d .\log\ .\Main_testing.robot )
${URL}      https://www.idokep.hu/idojaras/Budapest      
${Browserr}     firefox

*** Settings ***
Library     Selenium2Library
Resource        ./Resources/Open_browser.robot
Resource        ./Resources/Accept_cookies.robot

# open browser start process
Test Setup          Open_browser.Start browser and maximize     ${URL}      ${Browserr}
Test Teardown       Open_browser.Close browserr


*** Test Cases ***
Deselect all cookies
    Accept_cookies.Deselect all cookies


    