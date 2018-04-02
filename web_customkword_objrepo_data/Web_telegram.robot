*** Settings ***
Suite Setup       Open_chrome_Telegram
Suite Teardown    Close Browser
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session_when_unexpected_result
Library           SeleniumLibrary    run_on_failure=SeleniumLibrary.CapturePageScreenshot
Resource          Test_data_Indo.txt
Library           String
Library           OperatingSystem
Library           Collections
Library           AppiumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Resource          SMS_custom_keywords.txt
Resource          Test_data_SMS_Indo.txt
Resource          Carousel_custkeyword.txt
Resource          Text_with_buttons_custkeyword.txt
Resource          URL_Telegram.txt
Resource          Local_path.txt
Resource          Detailed_custkeyword_Telegram.txt
Resource          Generic_custkeyword_Telegram.txt
Resource          Object_repository_Telegram.txt

*** Test Cases ***
001 - Non-Telkomsel user who just started talking to VA
    User_input    Lihat semua produk
