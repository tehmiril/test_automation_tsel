*** Settings ***
Suite Setup       Open_chrome_with_user_profile    ${URL_Telegram}
Suite Teardown    Close Browser
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session_when_unexpected_result
Library           SeleniumLibrary    run_on_failure=No Operation
Resource          Test_data_Indo.txt
Library           String
Library           OperatingSystem
Library           Collections
Resource          Carousel_custkeyword.txt
Resource          Telegram/Text_with_buttons_custkeyword_Telegram.txt
Resource          URL_data.txt
Resource          SMS_web_custom_keywords.txt
Resource          Local_path.txt
Resource          Telegram/Detailed_custkeyword_Telegram.txt
Resource          Telegram/Generic_custkeyword_Telegram.txt
Resource          Telegram/Object_repository_Telegram.txt
Resource          Browser_custkeyword.txt

*** Test Cases ***
001 - Non-Telkomsel user who just started talking to VA
    User_input    Lihat semua produk
    Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini :)    SimPATI    Kartu As    Loop    hhy
