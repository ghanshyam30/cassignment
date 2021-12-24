*** Settings ***
Library                 SeleniumLibrary

*** Variables ***
${T_SHIRT_LOCATOR}          ''
${PRICE_LOCATOR}            ''
${TOTAL_LOCATOR}            //span[text()='Total']/following-sibling::span
${Heading}                  Find your spirit animal

*** Keywords ***
Open Shop Page
        [Documentation]        Open the URL and check if main content is present
        [Arguments]            ${Base_URL}
        [Tags]                 Smoke
        Open Browser           ${Base_URL}    firefox    executable_path=/home/thebadcoder/TestWorkspace/cassignment/drivers/geckodriver
        Wait Until Element Is Visible    xpath=//*[text()='${Heading}']

Find If The Shirt Is Available
        [Documentation]        Accepts the name of Tshirt that user may wish to purchase and returns true if present
        [Arguments]            ${T_SHIRT_NAME}
        Log    ${T_SHIRT_NAME}
        Set Suite Variable    ${T_SHIRT_LOCATOR}    //li/div[@class="product-details"]/descendant::a[text()="${T_SHIRT_NAME}"]
        Wait Until Element Is Visible    xpath=${T_SHIRT_LOCATOR}

Get The Price Of Shirt
        [Documentation]        Accepts Shirt name and returns Price
        [Arguments]            ${T_SHIRT_NAME}
        Set Suite Variable    ${PRICE_LOCATOR}    //li/div[@class="product-details"]/descendant::a[text()="${T_SHIRT_NAME}"]/ancestor::div/p
        Wait Until Element Is Visible    xpath=${PRICE_LOCATOR}       20   #waits 20 seconds
        ${PRICE_OF_SHIRT}      Get Text    ${PRICE_LOCATOR}
        [Return]               ${PRICE_OF_SHIRT}

Choose The Shirt
        [Documentation]        Accepts the shirt tha user may wish to purchase and clicks it to see more details
        [Arguments]            ${T_SHIRT_NAME}
        Wait Until Element Is Visible    xpath=//*[text()='Gerald the Giraffe']        timeout=20
        ClickElement           ${T_SHIRT_LOCATOR}

Get Cart Total
        [Documentation]        This keyword will simply find the total of cart and will return it back to test
        Wait Until Element Is Visible    ${TOTAL_LOCATOR}    10
        Wait Until Element Is Visible    xpath=//span[text()='Total']/following-sibling::span[text()!='$0.00']
        ${TOTAL_VALUE}=        Get Text                ${TOTAL_LOCATOR}
        Log    ${TOTAL_VALUE}
        [Return]               ${TOTAL_VALUE}