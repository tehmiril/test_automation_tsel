*** Settings ***
Suite Setup       Open_chrome_with_user_profile    ${URL_Telegram}
Suite Teardown    Close Browser
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session_when_unexpected_result
Library           SeleniumLibrary    run_on_failure=No Operation
Resource          Test_data_Indo.txt
Library           String
Library           OperatingSystem
Library           Collections
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
    #Greet_VA_Indo    selamat datang di GraPARI Virtual Telkomsel!
    User_input    Lihat semua produk
    #Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini :)    SimPATI    Kartu As    Loop    kartuHalo
    Check_VA_response_text_with_buttons    1    \    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    1    Kartu As    Kartu As
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk Kartu As    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Click_Button_From_Response    1    Perdana Kartu As    NONE
    Check_VA_response_image    2
    Check_VA_response_text    3    Kamu bisa cari tahu lebih lanjut di https://telkomsel.com/kartu-as
    Check_VA_response_text_with_buttons    4    Apakah Kamu ingin membeli kartu perdana Kartu As tersebut?    Ya    Tidak
    Cancel_and_closing_session_when_unexpected_result
