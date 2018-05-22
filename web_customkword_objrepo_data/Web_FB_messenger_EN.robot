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

023-User is bored/angry/sad/not feeling well/engage small talk but don't want to see Veronika's topic
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    i'm sad
    Check_VA_response_text    1
    Check_VA_response_text_with_2buttons    2    Are you interested?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]024-User wants to have a small talk with Veronika
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I'm not feeling well
    Check_VA_response_text    1
    Check_VA_response_text_with_2buttons    2    Are you interested?    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Here are some interesting topics that can restore your energy 🙂
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Quiz    Test your knowledge about music, celebrities and many more!    Choose
    Click_carousel_button_on_specific_location    2    5    Choose
    Check_VA_response_text    1
    Check_VA_response_text_with_buttons    2    Choose Your Answer
    Click_Button_From_Response    2    2
    Check_VA_response_text    1
    Check_VA_response_text_with_buttons    2    Do you want to try another round?    Yes    Other Topics    No
    Click_button_from_response_additional    2    Other Topics
    Check_VA_response_text    1    Here are some interesting topics that can restore your energy 🙂
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Humor    Simple jokes just for you!
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_image    1
    Check_VA_response_text_with_buttons    2    Share the joke with your friends 🙂 Do you want to see another joke?
    Click_button_from_response_additional    2    Wrap it up
    Closing session

[x]002-Non-Telkomsel who wants to explore VA
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi Vero
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    How may I assist you today
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    Kindly select one of the options below or directly type in your request    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    2    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    4    Top-up
    Check_VA_response_text    1    In order to process your inquire, please type your valid Telkomsel phone number (e.g. 0811000000)
    User_input    cancel
    Check_VA_response_text    1    OK, cancelling.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

005-Non-Telkomsel user who is wondering about Telkomsel products
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    recommendation for new simcard
    Check_VA_response_text    1    You can get a Telkomsel starter pack at GraPARI or the nearest outlet
    Check_VA_response_text    2    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Selatan
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Selatan
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Open in Google Maps
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_Session

[x]010-User perform inquire TCASH information
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    What is TCash?
    Check_VA_response_text    1    TCASH is an electronic money service from Telkomsel, with official license from Bank of Indonesia. You can use TCASH to pay many things; merchants, billing, purchase online, share money and more! TCASH can be used by all Telkomsel users.
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    Ask something else
    Check_VA_response_text    1    OK, cancelling.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    Yes
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    Please select one of the buttons above, or just type in your request.
    User_input    Benefit of TCash
    Check_VA_response_image    1
