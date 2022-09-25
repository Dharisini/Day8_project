*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button'

*** Keywords ***
Ensure Loaded
    Wait Until Page Does Not Contain Element    //*[contains(@aria-label,'Loading')]


Login To Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //button[@id='dt_login_button']    30   
    Wait Until Element Contains    dt_login_button    Log in
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']   aaa
    Input Text    //input[@type='password']   aaa
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //*[@id="dt_core_account-info_acc-info"]   30
    Ensure Loaded


    
    