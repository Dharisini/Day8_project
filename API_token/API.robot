*** Settings ***
Resource    login.robot

*** Variables ***
${profile}    //a[@class='account-settings-toggle']
${read}    //input[@type='checkbox' and @name='read']/../..   
${payments}    //input[@type='checkbox' and @name='payments']/../.. 
${Admin}    //input[@type='checkbox' and @name='admin']/../.. 
${Trade}    //input[@type='checkbox' and @name='trade']/../..
${TradingInfo}    //input[@type='checkbox' and @name='trading_information']/../..
${InputField}    //input[@class="dc-input__field"]
${CreateButton}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${Trash}    //*[@class="dc-icon dc-clipboard da-api-token__delete-icon"] 
${Delete}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]    

*** Keywords ***

Deleting
    Wait Until Page Contains Element    ${Trash}
    Click Element    ${Trash}
    Wait Until Page Contains Element    ${Delete}
    Click Element    ${Delete}
    
Test case 1: Api Token page is loaded 
    Login To Deriv
    Wait Until Page Contains Element    ${profile}    40
    Click Element    ${profile}   
    Wait Until Page Contains Element    //a[@id="dc_api-token_link"]
    Click Element    //a[@id="dc_api-token_link"]  


Test case 2: Refresh page to see if input is not there
    Test case 1: Api Token page is loaded
    Wait Until Page Contains Element    ${read}        40
    Click Element    ${read}
    Wait Until Page Contains Element    ${InputField}    10
    Input Text    ${InputField}    token1
    Reload Page

Test case 3: Tests on checking the create token button with different inputs
    Test case 1: Api Token page is loaded
    Wait Until Page Contains Element    ${InputField}    10
    Input Text    ${InputField}    tokentest
    Wait Until Page Contains Element    ${read}        40
    Click Element    ${read}
    Click Element    ${CreateButton}
    Press Keys    ${InputField}    CTRL+a+BACKSPACE
    Input Text    ${InputField}    T
    Click Element    ${read}    
    Click Element    ${Admin}      
    Click Element    ${TradingInfo}    
    Click Element    ${payments}    
    Click Element    ${Trade}    
    Press Keys    ${InputField}    CTRL+a+BACKSPACE
    Input Text    ${InputField}    Teeeeeeeeeeeeeeeeeeeessssssssssssssssssst
    Press Keys    ${InputField}    CTRL+a+BACKSPACE
    Input Text    ${InputField}    /*  

Test case 4: Testing on Copy function, check with hidden
    Test case 1: Api Token page is loaded
    Wait Until Page Contains Element    ${InputField}    10
    Input Text    ${InputField}    tokentest
    Wait Until Page Contains Element    ${read}        40
    Click Element    ${read}
    Click Element    ${CreateButton}
    Page Should Contain Element    //*[@data-testid="dt_copy_token_icon"]
    Click Element    //*[@data-testid="dt_copy_token_icon"]
    Press Keys    ${InputField}    CTRL+V
    Wait Until Page Contains Element    //*[@data-testid="dt_toggle_visibility_icon"]
    Click Element    //*[@data-testid="dt_toggle_visibility_icon"] 
    Deleting

Test case 5: Checking the creation of token with all scopes 
    Test case 1: Api Token page is loaded
    Wait Until Page Contains Element    ${InputField}    10
    Input Text    ${InputField}    tokentest
    Page Should Contain Element    ${read}        40
    Click Element    ${read}
    Page Should Contain Element    ${Admin}
    Click Element    ${Admin}
    Page Should Contain Element    ${payments}
    Click Element    ${payments}
    Page Should Contain Element    ${Trade}
    Click Element    ${Trade}
    Page Should Contain Element    ${TradingInfo}
    Click Element    ${TradingInfo}
    Wait Until Page Contains Element    ${InputField}    10
    Click Element    ${CreateButton}
    Page Should Contain Element    //table[@class='da-api-token__table']/tbody/tr[1]/td[4]/*[text()='Never']    10
    Page Should Contain Element    //table[@class='da-api-token__table']/tbody/tr[1]/td[3]//*[text()='Read']    10
    Page Should Contain Element    //table[@class='da-api-token__table']/tbody/tr[1]/td[3]//*[text()='Trade']    10
    Page Should Contain Element    //table[@class='da-api-token__table']/tbody/tr[1]/td[3]//*[text()='Payment']    10
    Page Should Contain Element    //table[@class='da-api-token__table']/tbody/tr[1]/td[3]//*[text()='Trading information']    10
    Page Should Contain Element    //table[@class='da-api-token__table']/tbody/tr[1]/td[3]//*[text()='Admin']    10
    Deleting

Test case 6: Hide and Unhide token
    Test case 1: Api Token page is loaded
    Wait Until Page Contains Element    ${InputField}    10
    Input Text    ${InputField}    tokentest
    Wait Until Page Contains Element    ${read}        40
    Click Element    ${read}
    Click Element    ${CreateButton}
    Wait Until Page Contains Element    //*[@data-testid="dt_toggle_visibility_icon"]
    Click Element    //*[@data-testid="dt_toggle_visibility_icon"]
    Sleep    10
    Click Element    //*[@data-testid="dt_toggle_visibility_icon"]
    Deleting
   
*** Test Cases ***
Test case 7: Deleting token
    Test case 1: Api Token page is loaded
    Wait Until Page Contains Element    ${InputField}    10
    Input Text    ${InputField}    tokentest
    Wait Until Page Contains Element    ${read}        40
    Click Element    ${read}
    Click Element    ${CreateButton}
    Wait Until Page Contains Element    ${Trash}
    Click Element    ${Trash}
    Wait Until Page Contains Element    //span[text()='Cancel']/..    20
    Click Element    //span[text()='Cancel']/..
    Sleep    5   
    Deleting





   

    


 



    



