*** Settings ***
Suite Setup       Open_chrome    ${URLmessengerTSEL}
Suite Teardown    Close Browser
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session
Library           SeleniumLibrary    run_on_failure=No Operation
Library           String
Library           OperatingSystem
Library           Collections
Resource          Local_path.txt
Resource          Custom_keywords/Generic_custkeyword.txt
Resource          Custom_keywords/Detailed_custkeyword.txt
Resource          Custom_keywords/Carousel_custkeyword.txt
Resource          Custom_keywords/Text_with_buttons_custkeyword.txt
Resource          Custom_keywords/SMS_web_custom_keywords.txt
Resource          Custom_keywords/Browser_custkeyword.txt
Resource          Custom_keywords/Login_logout_custkeyword.txt
Resource          Custom_keywords/Carousel_validate_custkeyword.txt
Resource          Custom_keywords/Credit_card_payment_custkeyword.txt
Resource          Custom_keywords/EBanking_payment_custkeyword.txt
Resource          Object_repository/Object_repo_FB.txt
Resource          Object_repository/Payment_pages_object_repo.txt
Resource          Test_data/URL_data.txt
Resource          Test_data/Test_data_user_input_EN.txt
Resource          Test_data/Test_data_VA_response_EN.txt
Resource          Test_data/Test_data_VA_response_carousel_TSEL_EN.txt
Resource          Test_data/Test_data_payment.txt
Resource          Test_data/Test_data_VA_response_carousel_NonTSEL_EN.txt

*** Test Cases ***
067-User wants to know how to cash in Tcash via Mobile Banking
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Sleep    3s
    User_input    How can I top up my TCASH Balance?
    Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    See instructions
    Check_VA_response_image    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

068-User wants to know how to cash in Tcash via Internet Banking
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Sleep    3s
    User_input    How can I top up my TCASH Balance?
    Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    See instructions
    Check_VA_response_image    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

069-User wants to know how to cash in Tcash via ATM Bersama
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Sleep    3s
    User_input    How can I top up my TCASH Balance?
    Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    See instructions
    Check_VA_response_image    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]070-User wants to know how to cash in Tcash via GraPARI
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Sleep    3s
    User_input    How can I top up my TCASH Balance?
    Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    4    Find GraPARI
    Check_VA_response_text    1    Please specify a location/area where you wish to find a GraPARI. You may share your location or type-in below
    User_input    Jakarta
    Check_VA_response_text    1    Which GraPARI area are you looking for ?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several GraPARI close to
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    1    Open in Google Maps
    User_input    No
    Closing_session

071-User wants to know how to cash in Tcash via Retail Store
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Sleep    3s
    User_input    How can I top up my TCASH Balance?
    Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    5    See instructions
    Check_VA_response_text    1    You can top-up your credit at the nearest retail store such as Alfamart and Indomaret
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

073-User wants to know how to Top Up Tcash Balance through Tcash FAQ
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Sleep    3s
    User_input    What is TCash?
    Check_VA_response_text    1    TCASH is an electronic money service from Telkomsel, with official license from Bank of Indonesia. You can use TCASH to pay many things; merchants, billing, purchase online, share money and more! TCASH can be used by all Telkomsel users.
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    TCASH FAQ
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    2    Do you want to know more? Go to this link https://digitalpayment.telkomsel.com/faq to get more information or type 'cancel' to see main menu.
    Click_carousel_button_on_specific_location    1    5    Show
    Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    See instructions
    Check_VA_response_image    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session
