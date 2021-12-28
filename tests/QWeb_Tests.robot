*** Settings ***
Documentation           Open the shop website purchase something and validate its price
Library                 QWeb
Resource                ../resources/BaseKeywords.robot
Suite Setup             Open Browser    about:blank    ${BROWSER}
Suite Teardown          Close All Browsers

# Tip: The Settings section is where you define test suite level configuration.
#      Suite Setup and Teardown are actions that happen before and after a test suite run.
#      For first time users, we don't recommend to change them.

*** Variables ***
${T_SHIRT_TO_PURCHASE}        Gerald the Giraffe
${COPADO_PLATFORM}            https://robotic.copado.com/

# TIP: You could also use "Firefox" (without quotes) below.
${BROWSER}            Chrome

*** Test Cases ***
Purchase The Shirt
    [Documentation]     Open shop website
    [Tags]              Regression
    Appstate            Open Shop Page
    Find If The Shirt Is Available        ${T_SHIRT_TO_PURCHASE}
    ${ITEM_PRICE}=      Get The Price Of Shirt                ${T_SHIRT_TO_PURCHASE}
    Choose The Shirt    ${T_SHIRT_TO_PURCHASE}
    ClickElement        button
    VerifyText          Cart summary
    ${CART_TOTOAL}=     Get Cart Total
    Should Be Equal     ${CART_TOTOAL}                        ${ITEM_PRICE}

Test Copado Platform
    [Documentation]    Test the copado platform like enable the recording and run the tests
    [Tags]             smoke
    Appstate           Open Website Page    ${COPADO_PLATFORM}
    VerifyElement      //img[@title\='Copado Robotic Testing']        timeout=10
    TypeText          email             ghana.bambale@gmail.com
    # TypeSecret        password          ${my_pass}
    TypeText          password          Bitch@001
    ClickElement      LOGIN
    VerifyElement     //div/img[@alt\='Copado Robotic Testing']        timeout=10
    VerifyText        Projects
    ClickElement      //h4[.\='Projects']/following-sibling::a[.\='View']        timeout=10
    VerifyText        Projects
    VerifyText        Ghansham's project
