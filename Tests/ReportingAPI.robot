
*** Settings ***
#Resource    ../Resources/ReportAPIlogin.robot
#Resource    ../Resources/ReportAPIbodyvalidation.robot
Library         Collections
Library         RequestsLibrary
Library         SeleniumLibrary
Library         BuiltIn
Library         JSONLibrary





*** Variables ***
${url} =  https://api-test.elisa.fi
${path} =  report/v1/expenses?INVOICEDATE=2021-08-01,2021-08-31&limit=10
${url_path} =    https://api-test.elisa.fi/report/v1/expences?INVOICEDATE=2021-08-01,2021-08-31&limit=10&MOBILENUMBER=+358400251237
${header} =  {"content-type": "application/json", "x-api-key" : "f956c473-9fb2-48f5-8d36-57ee27e4e88d", "authorization" : "Basic Zm9ydHVtQHNhc3B3OmZvcnR1bTEyMw=="}
# ${header} =  {"content-type": "application/json", "x-api-key" : "f956c473-9fb2-48f5-8d36-57ee27e4e88d", "authorization" : "Basic Zm9ydHVtQHNhc3B3OmZvcnR1bTEyMw==", "Debug" : "ok"} Use this for Debugging
${auth} =  {"Basic Zm9ydHVtQHNhc3B3OmZvcnR1bTEyMw=="}
${passwd} =  {'fortum123'}


*** Test Cases ***
Reporting API authenticate
        [Tags]  Authenticate Report API
    #REST.GET    ${url}  headers=${header}
    #[Teardown]    Output schema
    Create Session    mysession    ${url}  headers=${header}


Received Data for analysis
        [Tags]  Data response
    ${response} =    GET On Session    mysession    url=${path}
  #  ${response} =  REST.GET    url=${url_path}   headers=${header}
    set log level    DEBUG
    set global variable    ${Response}    ${response}
    set global variable    ${DATA}    ${response.json()}
    Log    ${response.json()}


Vadidate Status
        [Tags]  Check response = 200
#    Output    ${response.json()}
    set log level    DEBUG
    Status Should Be    200    ${Response}
    #should be equal as strings    ${response.status}    200
    Log    ${Response}


Validate Response body
        [Tags]    Validate json fields
    set log level    DEBUG
    Log    ${DATA}
    #${company} =    Get Value From Json    ${DATA}    MOBILENUMBER
    Convert and verify json data     ${DATA}
    #${json} =  Set Variable    ${DATA.json()}
    #Log ${json_data}
    #${json_data}=  Evaluate  json.load(open(${json}))  json
    #Should Be Equal    ${the data['interfaces'][0]['ipv4']}    ${your predefined dictionary}
    #Log    ${json}


*** Keywords ***
Convert and verify json data
    [arguments]    ${DATA}
    ${DATA_S}    Convert JSON To String    ${DATA}
    #set global variable  ${DATA_JSON}   ${DATA_S}
    should contain    ${DATA_S}    MOBILENUMBER
    should contain    ${DATA_S}    INVOICEDATE
    should contain    ${DATA_S}    Currency
    should contain    ${DATA_S}    AMOUNT_NET
    should contain    ${DATA_S}    VAT
    should contain    ${DATA_S}    CompanyGroup
    should contain    ${DATA_S}    UPDATEDATE
    should contain    ${DATA_S}    CountryCode
    should contain    ${DATA_S}    Operator
    should contain    ${DATA_S}    CompanyName

# No local keywords, to be move to keyword files under Resources
