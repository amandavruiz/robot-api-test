*** Settings ***
Library    RequestsLibrary
Library    String
Library    DateTime
Resource    ../resources/global_variables.robot

*** Keywords ***
Criar Sessão API
    Create Session    newsession    ${BASE_URL}

Registrar Usuário
    [Arguments]     ${name}    ${password}    ${role}

    ${uuid}    Generate Random String    8
    ${now}   Get Current Date    result_format=%Y-%m-%dT%H:%M:%S.000Z

    ${Random}    Generate Random String    5
    ${email}    Set Variable    ${random}@teste.com


    ${body}    Create Dictionary
    ...    id=${uuid}
    ...    name=${name}
    ...    email=${email}
    ...    password=${password}
    ...    role=${role}
    ...    lastAccess=${now}
    ...    createAt=${now}
        
    Log    ${body}    level=INFO
    
    ${response}=    POST On Session    newsession    ${REGISTER_USER}    json=${body}
    Log    ${response.json()}    level=INFO

    Should Be Equal As Integers    ${response.status_code}    201

    RETURN    ${response.json()}