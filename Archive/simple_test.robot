*** Settings ***
Library           Selenium2Library
Resource          Detailed_custkeyword.txt
Resource          Test_data_Indo.txt
Library           String
Resource          Object_repository.txt
Resource          Generic_custkeyword.txt
Library           OperatingSystem

*** Test Cases ***
test_carousel
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    User_input    lihat semua produk    #User_input    ${random_question_3}
	Capture Page Screenshot		input.png
    Get_carousel_items_on_specific_location    2    3
    Check_carousel_item    2    SimPATI Combo    \    Info SimPATI Combo    Perdana SimPATI
    [Teardown]    Close Browser

test_askPulsaKuota
    [Documentation]    Here registered user ask for both pulsa and kuota, without top-up.
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    #Greet_VA_Indo
    User_input    ${ask_pulsa}
    Sleep    2s
    ${result}    Run Keyword and Return Status    Check_VA_response_text    1    ${VA_validateNumber}
    Run Keyword If    ${result}    Click_Yes    1
    Check_VA_response_text    1    ${VA_answerPulsa1}
    Check_VA_response_text_with_2buttons    2    ${VA_answerPulsa2}    Ya    Tidak
    Capture Page Screenshot    response_pulsa.png
    User_input    ${ask_kuota}
    Check_VA_response_text    1    ${VA_answerKuota2}
    Check_additional_text_2buttons    1    ${VA_answerKuota3}    Ya    Tidak
    Click_additional_No
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session
    [Teardown]    Close Browser