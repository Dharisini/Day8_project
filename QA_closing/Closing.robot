*** Settings ***
Resource    login.robot

*** Variables ***
${profile}    //a[@class='account-settings-toggle']
${CloseMyAccount}    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
${Cancel}    //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]
${CheckBox1}    //input[@class="dc-checkbox__input" and @name="financial-priorities"]/..
${CheckBox2}    //input[@class="dc-checkbox__input" and @name="stop-trading"]/..
${CheckBox3}    //input[@class="dc-checkbox__input" and @name="not-interested"]/..
${CheckBox4}    //input[@class="dc-checkbox__input" and @name="another-website"]/..
${TextArea1}    //textarea[@name="other_trading_platforms"]
${TextArea2}    //textarea[@name="do_to_improve"]
${Continue}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]    

*** Keywords ***

Click close my account
    Wait Until Page Contains Element    ${CloseMyAccount}
    Click Element    ${CloseMyAccount}   
Test case 1: Closing page is loaded 
    Login To Deriv
    Wait Until Page Contains Element    ${profile}    40
    Click Element    ${profile}   
    Wait Until Page Contains Element    //a[@id="dc_close-your-account_link"]    20
    Click Element    //a[@id="dc_close-your-account_link"]

Test case 2: test the clickability Security and Privacy
    Test case 1: Closing page is loaded
    Wait Until Page Contains Element    //a[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
    Click Element    //a[@href="https://deriv.com/tnc/security-and-privacy.pdf"]

Test case 3: test the clickability of Close my account
    Test case 1: Closing page is loaded
    Click close my account

Test case 4: test the clickability of Cancel
    Test case 1: Closing page is loaded
    Wait Until Page Contains Element    ${Cancel}
    Click Element    ${Cancel}

Test case 5: Click more than 3 checkboxes and unselect them
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${CheckBox1}
    Click Element    ${CheckBox1}
    Click Element    ${CheckBox2}
    Click Element    ${CheckBox3}
    Click Element    ${CheckBox4}
    Sleep    5
    Click Element    ${CheckBox1}
    Click Element    ${CheckBox2}
    Click Element    ${CheckBox3}
    Click Element    ${CheckBox4}

Test case 6: Click no reasons and click continue
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${CheckBox1}
    Page Should Contain Element    ${Continue}    20
    Click Element    ${Continue}        
Test case 7: Type 111 characters in one textbox and click continue
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${TextArea1}    20
    Input Text    ${TextArea1}    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. lum s    
    Wait Until Page Contains Element    ${Continue}    
    Click Element    ${Continue}
Test case 8: Type 111 characters in one textbox, type a word on the second text box
  Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${TextArea1}    20
    Input Text    ${TextArea1}    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. lum s    
    Input Text    ${TextArea2}    Lorem    
    Wait Until Page Contains Element    ${Continue}    
    Click Element    ${Continue}
Test case 9: Type special characters at text box 1 
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${TextArea1}    20
    Input Text    ${TextArea1}    ././././././././/.###################    
    Input Text    ${TextArea2}    Lorem  
    Wait Until Page Contains Element    ${Continue}    
    Click Element    ${Continue}
    Sleep    5
    Click Element    ${CheckBox1}
    Wait Until Page Contains Element    ${Continue}    
    Click Element    ${Continue}
Test case 10: Type in text box one and two
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${TextArea1}    20
    Input Text    ${TextArea1}    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo  
    Input Text    ${TextArea2}    .Lorem ipseum././  
    Wait Until Page Contains Element    ${Continue}    
    Click Element    ${Continue}
    Sleep    5
    Click Element    ${CheckBox1}
    Wait Until Page Contains Element    ${Continue}    
    Click Element    ${Continue}

Test case 11: Click 3 checkboxes and write on text box click continue and go back
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${CheckBox1}
    Click Element    ${CheckBox1}
    Click Element    ${CheckBox2}
    Click Element    ${CheckBox3}
    Wait Until Page Contains Element    ${TextArea1}    20
    Input Text    ${TextArea1}    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo
    Wait Until Page Contains Element    ${Continue}
    Click Element    ${Continue}
    Wait Until Page Contains Element    //div[@class="account-closure-warning-modal"]
    Click Element    //*[@id="modal_root"]//././/button[1]  

Test case 12: Click one checkbox and refresh the page
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${CheckBox1}
    Reload Page

*** Test Cases ***
Test case 13: Delete the account and log in back
    Test case 1: Closing page is loaded
    Click close my account
    Wait Until Page Contains Element    ${CheckBox1}
    Click Element    ${CheckBox1}
    Click Element    ${CheckBox2}  
    Input Text    ${TextArea1}    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo
    Wait Until Page Contains Element    ${Continue}
    Click Element    ${Continue}
    Wait Until Page Contains Element    //div[@class="account-closure-warning-modal"]
    Click Element    //*[@id="modal_root"]//././/button[2]
    Sleep    5
    Login To Deriv
       

  





  