*** Settings ***
Resource    ../resources/users_resources.robot

Suite Setup    Criar Sessão API 

*** Test Cases ***
Registrar um usuário com sucesso
    ${res}=    Registrar Usuário    Amanda    SenhaForte@123    user
    Should Be Equal    ${res['name']}    Amanda
    Should Be Equal    ${res['role']}    user