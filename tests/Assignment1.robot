*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/BaseKeywords_Selenium.robot

*** Variables ***
${Base_URL}     https://qentinelqi.github.io/shop/
${T_SHIRT_TO_PURCHASE}    Gerald the Giraffe
${T_SHIRT_TO_TEST_COLOR_OPTIONS}    Bumble the Elephant
${SHOP_PAGE_HEADING}    //*[text()='Find your spirit animal']
${COPADO_TEST_PLATFORM}    https://robotic.copado.com/
${COPADO_LOGIN}    //img[@title='Copado Robotic Testing']

*** Test Cases ***
Purchase The Shirt
    [Documentation]    Open shop website
    [Tags]    One
    Open Website Page    ${Base_URL}
    Verify If Page Is Opened    ${SHOP_PAGE_HEADING}
    Log    ${T_SHIRT_TO_PURCHASE}
    Find If The Shirt Is Available    ${T_SHIRT_TO_PURCHASE}
    ${ITEM_PRICE}=    Get The Price Of Shirt    ${T_SHIRT_TO_PURCHASE}
    Log    ${T_SHIRT_TO_PURCHASE}
    Choose The Shirt    ${T_SHIRT_TO_PURCHASE}
    Click Element    //button
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Cart summary')]    10
    ${CART_TOTOAL}=    Get Cart Total
    Should Be Equal    ${CART_TOTOAL}    ${ITEM_PRICE}
    Close Browser 

Verify The Shirt Color Change With Given Options
    [Documentation]    Verify if the color option is clicked the color of the shirt image changes
    [Tags]    Two
    Open Website Page    ${Base_URL}
    Verify If Page Is Opened    ${SHOP_PAGE_HEADING}
    Log    ${T_SHIRT_TO_PURCHASE}
    Find If The Shirt Is Available    ${T_SHIRT_TO_TEST_COLOR_OPTIONS}
    Choose The Shirt    ${T_SHIRT_TO_TEST_COLOR_OPTIONS}
    Click On The Color Option    Green
    Close Browser
    # Click On The Color Option    Biege
    # Click On The Color Option    Green
    #Wait Until Element Is Visible    xpath=//*[contains(text(),'Cart summary')]    10
    #${CART_TOTOAL}=    Get Cart Total
    #Should Be Equal    ${CART_TOTOAL}    ${ITEM_PRICE} 

Login Copado 
    [Documentation]    Open Copado Testing URL
    [Tags]    Three
    Open Website Page    ${COPADO_TEST_PLATFORM}
    Verify If Page Is Opened    ${COPADO_LOGIN}
    Wait Until Element Is Visible    ${COPADO_LOGIN}
    Input Text    //input[@id="email"]    ghana.bambale@gmail.com
    Input Text    //input[@type="password"]    Bitch@001
    Click Element    //button/span[.='LOGIN']
    Wait Until Element Is Visible    xpath=//div/img[@alt='Copado Robotic Testing']    10
    Close Browser
