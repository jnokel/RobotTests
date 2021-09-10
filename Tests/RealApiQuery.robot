*** Settings ***
Library         REST    https://api-test.elisa.fi
Library         REST    url=https://api-test.elisa.fi

*** Variables ***
${header}    {"content-type": "application/json", "x-api-key" : "4c2d1056-fb78-4a2a-8eb9-d5e40670e717"}


*** Test Cases ***
Corporate API information
    GET    endpoint=/device/v1/billing/accounts/1_38067685115  headers=${header}
    Output    response body
