*** Settings ***
Documentation    Some basic info of test
Library    SeleniumLibrary

*** Variables ***
${pass}    ElisaIG9876!

*** Test Cases ***
Test to land frontpage
    [Documentation]    this test lands frontpage
    [Tags]    Testi
    open browser    https://preprod.marketplace.basware.com/admin/login/auth?backTo=https://preprod.marketplace.basware.com/products/    firefox
    wait until page contains    Log in
    input text    username    jarmonokelainen@lsvd001
    sleep    1s
    input text    password    ${pass}
    sleep    1s
    click button    submit
    sleep    3s
    click link    manageProducts
    sleep    2s
    input text    keywords    Apple
    sleep    2s
    click button    btn-search
    sleep    2s
    click link    name_0
    sleep    10s
    click button    cancelButton_1
    sleep    3s
    close browser




*** Keywords ***
