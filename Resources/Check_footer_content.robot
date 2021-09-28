*** Settings ***
Library     Selenium2Library

*** Variables ***
# header id-s
@{header_ids}       Előrejelzés     Időkép      Hőtérkép        Felhőkép        Radar       Kamerák     Közösség        Tematikus       Térképek    
# check text's appear 
@{page_should_contains}     Impresszum      Médiaajánlat        ÁSZF        Adatkezelési Tájékoztató        Elvihető tartalmak      
# contain bio
@{page_should_contains_link}        https://twitter.com/idokep      https://www.instagram.com/idokep        https://www.facebook.com/idokep     
# check for date and validity
${validity_text}     xpath://*[@class="col-12 text-center text-md-right ik c-r pt-3 pt-md-0"]        

# scroll pixel
${custom_scroll}        15000



*** Keywords ***
Test header buttons
#
    FOR     ${current_header}       IN      @{header_ids}
        #scrool to top 
        Sleep       2s
        Execute JavaScript      window.scrollTo(${custom_scroll}, 0)
        Execute JavaScript      window.scrollTo(${custom_scroll}, 0)

        Sleep       2s
        Click Element       xpath://a[text()="${current_header}"]

        #scrool to bottom
        Sleep       1s
        Execute JavaScript      window.scrollTo(0, ${custom_scroll})
        Sleep       1s
        Execute JavaScript      window.scrollTo(0, ${custom_scroll})
        
        # Check for footer caontaining all the links
        Check footer content        ${current_header}
    END
#

Check footer content
    [Arguments]     ${current_png_name}

    # check links
    FOR     ${footer_link}     IN      @{page_should_contains}
        Page Should Contain     ${footer_link}
    END

    # check bio: twitter, instagram, facebook 
    FOR     ${BIO_link}     IN      @{page_should_contains_link}
        Page Should Contain Link     ${BIO_link}       
    END
    
    Page Should Contain Element        ${validity_text}

    #capture screenshot
    Capture Page Screenshot     filename=${current_png_name}.png

