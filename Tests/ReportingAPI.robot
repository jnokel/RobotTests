
*** Settings ***
Library         Collections
Library         RequestsLibrary
Library         SeleniumLibrary
Library         BuiltIn
#Library         REST

*** Variables ***
#Now local, later to common variables
${url} =  https://api-test.elisa.fi
${path} =  report/v1/expenses?INVOICEDATE=2021-08-01,2021-08-31&limit=10&Debug=ok
${url_path} =    https://api-test.elisa.fi/report/v1/expences?INVOICEDATE=2021-08-01,2021-08-31&limit=10&Debug=ok
${header} =  {"content-type": "application/json", "x-api-key" : "f956c473-9fb2-48f5-8d36-57ee27e4e88d", "authorization" : "Basic Zm9ydHVtQHNhc3B3OmZvcnR1bTEyMw=="}
${auth} =  {"Basic Zm9ydHVtQHNhc3B3OmZvcnR1bTEyMw=="}
${passwd} =  {'fortum123'}



*** Test Cases ***
#Later to be moved to Keyword files
Reporting API authenticate
    #REST.GET    ${url}  headers=${header}
    #[Teardown]    Output schema
    Create Session    mysession    ${url}  headers=${header}


Received Data for analysis
    ${response} =    GET On Session    mysession    url=${path}
  #  ${response} =  REST.GET    url=${url_path}   headers=${header}
    Status Should Be    200    ${response}
    set global variable    ${Response}    ${response}
    Log    ${response}

    #Output    ${response.json()}

Vadidate Status
#    Output    ${response.json()}
    Status Should Be    400    ${Response}
    #should be equal as strings    ${response.status}    200



Validate Response body
    ${json} =  Set Variable    ${response.json()}
    #should be equal as strings    ${json['company']}    Fortum
    should contain    ${json['company']}    Fortum
    Log    ${json}

*** Keywords ***
# No local keywords, to be move to keyword files under Resources
