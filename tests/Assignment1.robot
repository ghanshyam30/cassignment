*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/BaseKeywords_Selenium.robot

*** Variables ***
${Base_URL}     https://qentinelqi.github.io/shop/
${T_SHIRT_TO_PURCHASE}    Gerald the Giraffe

*** Test Cases ***
Purchase The Shirt
    [Documentation]    Open shop website
    Open Shop Page    ${Base_URL}
    Log    ${T_SHIRT_TO_PURCHASE}
    Find If The Shirt Is Available    ${T_SHIRT_TO_PURCHASE}
    ${ITEM_PRICE}=    Get The Price Of Shirt    ${T_SHIRT_TO_PURCHASE}
    Log    ${T_SHIRT_TO_PURCHASE}
    Choose The Shirt    ${T_SHIRT_TO_PURCHASE}
    Click Element    //button
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Cart summary')]    10
    ${CART_TOTOAL}=    Get Cart Total
    Should Be Equal    ${CART_TOTOAL}    ${ITEM_PRICE} 
