
*** Settings ***
Library         Collections
Library         RequestsLibrary
Library         SeleniumLibrary
Library         BuiltIn


*** Variables ***


*** Keywords ***
Vadidate Status
#    Output    ${response.json()}
    set log level    DEBUG
    Status Should Be    400    ${Response}
    #should be equal as strings    ${response.status}    200



Validate Response body
    ${json} =  Set Variable    ${Response.json()}
    #should be equal as strings    ${json['company']}    Fortum
    should contain    ${json['company']}    Fortum
    Log    ${json}





