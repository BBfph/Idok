*** Settings ***
Library     Selenium2Library

*** Variables ***
&{cooki_checkbox}       beállítások=xpath://*[@id="CybotCookiebotDialogBodyLevelButtonPreferences"]     statisztika=xpath://*[@id="CybotCookiebotDialogBodyLevelButtonStatistics"]      marketing=xpath://*[@id="CybotCookiebotDialogBodyLevelButtonMarketing"]
${contain_cooki_Preferencies}       Ez a weboldal sütiket használ         
${Accept_button}        id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowallSelection

*** Keywords ***
#
Deselect all cookies
    Wait Until Page Contains    ${contain_cooki_Preferencies}
    #Unselect Checkbox           ${cooki_checkbox.beállítások}
    #Unselect Checkbox           ${cooki_checkbox.statisztika}
    #Unselect Checkbox           ${cooki_checkbox.marketing}
    Capture Page Screenshot     filename=Deselect_all.png
    Click Element               ${Accept_button}
