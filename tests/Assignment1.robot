*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/BaseKeywords_Selenium.robot
Test Setup    Start Browser
Test Teardown    Close Browser
variables    ../resources/variables.py


*** Variables ***
# ${Base_URL}     https://qentinelqi.github.io/shop/
# ${T_SHIRT_TO_PURCHASE}    Gerald the Giraffe
# ${T_SHIRT_TO_TEST_COLOR_OPTIONS}    Bumble the Elephant
# ${SHOP_PAGE_HEADING}    //*[text()='Find your spirit animal']
# ${COPADO_TEST_PLATFORM}    https://robotic.copado.com/
# ${COPADO_LOGIN}    //img[@title='Copado Robotic Testing']

*** Test Cases ***
Purchase The Shirt 
    [Documentation]    Open shop website
    [Tags]    Smoke
    Open Website Page
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

Verify The Shirt Color Change With Given Options
    [Documentation]    Verify if the color option is clicked the color of the shirt image changes
    [Tags]    Smoke
    Open Website Page
    Verify If Page Is Opened    ${SHOP_PAGE_HEADING}
    Log    ${T_SHIRT_TO_PURCHASE}
    Find If The Shirt Is Available    ${T_SHIRT_TO_TEST_COLOR_OPTIONS}
    Choose The Shirt    ${T_SHIRT_TO_TEST_COLOR_OPTIONS}
    Click On The Color Option    Green

Login Copado 
    [Documentation]    Open Copado Testing URL
    [Tags]    Smoke
    Open Website Page    ${COPADO_TEST_PLATFORM}
    Verify If Page Is Opened    ${COPADO_LOGIN}
    Wait Until Element Is Visible    ${COPADO_LOGIN}
    Input Text    //input[@id="email"]    ghana.bambale@gmail.com
    Input Text    //input[@type="password"]    Bitch@001
    Click Element    //button/span[.='LOGIN']
    Wait Until Element Is Visible    xpath=//div/img[@alt='Copado Robotic Testing']    10