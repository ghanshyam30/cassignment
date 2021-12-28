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
    [Tags]             Regression
    Appstate           Open Website Page    ${COPADO_PLATFORM}
    VerifyElement      //img[@title\='Copado Robotic Testing']        timeout=10
    TypeText           email             ghana.bambale@gmail.com
    TypeSecret         password          ${my_pass}
    # TypeText           password          Something
    ClickElement       //button/span[.\='LOGIN']
    VerifyElement      //div/img[@alt\='Copado Robotic Testing']        timeout=10
    VerifyText         Projects
    ClickElement       //h4[.\='Projects']/following-sibling::a[.\='View']        timeout=10
    VerifyText         Projects
    VerifyText         Ghansham's project
    ClickElement       //td/a[.\="Ghansham's project"]/ancestor::tr/td/a[contains(@id,"Manage Ghansham's project")]
    VerifyElement      //h5/span[contains(text(),"Ghansham's project")]           timeout=10
    ClickElement       //a[@id\='robots-link']
    VerifyText         My robot
    VerifyText         Custom starter suite
    ClickElement       //a[contains(text(),'Custom starter suite')]/ancestor::div[contains(@class,'list-group-item-action')]/div[@class\='controls ng-star-inserted']/a
    VerifyText         Suite details                        timeout=20
    ${RECORDING_STATUS}=                        Get Text                        //li/p[text()\='Video recording']/following-sibling::p
    ClickElement       //button[@ngbtooltip\='Edit suite']                    # Could have used ClickIcon
    VerifyText         Edit suite
    VerifyText         Video streaming & recording
    DropDown           streamAndRecord                        [[1]]
    LogScreenshot
    # ${RECORDING_STATUS}=                        Get Text                        //select[@id\='streamAndRecord']
    ClickElement       //button[@type\='submit' and contains(text(),"Save")]
    VerifyText         Custom starter suite
    VerifyText         Advanced options                       10
    DropDown           record                        [[1]]
    LogScreenshot
    DropDown           stream                        [[1]]
    LogScreenshot
    ClickElement       //button[@id\='suite-run-btn']
    SwitchWindow       NEW
    LogScreenshot
    #SelectElement     All