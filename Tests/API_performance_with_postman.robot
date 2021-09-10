*** Settings ***
Documentation    Some basic info of test
Library    SeleniumLibrary

*** Variables ***
${pass}    Petteri1234

*** Test Cases ***
Test to land frontpage
    [Documentation]    this test uses Postman for Performance test
    [Tags]    Testi
    open browser    https://identity.getpostman.com/login?continue=https%3A%2F%2Fwww.postman.com%2F/    firefox
    wait until page contains    Sign in
    input text    username    JarmoN
    sleep    1s
    input text    password    ${pass}
    sleep    1s
    click button    sign-in-btn
    sleep    5s
    go to    https://lively-escape-135225.postman.co/workspace/My-Workspace~27425312-c576-4f4c-8f4a-fd544b2c0590/request/3906444-46670abf-f6d6-4c59-aee5-7cedfdcb8bab/
    sleep    2s
    mouse down    xpath=//html/body/div[3]/div/div/div[6]/div[1]/div[1]/div/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div[1]/div[1]/div/div[2]/div/div[2]/div/div/div/div/div[1]/span
    close browser




*** Keywords ***
