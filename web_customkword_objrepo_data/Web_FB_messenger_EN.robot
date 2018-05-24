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

[x]006-Non-Telkomsel user who is interested in using KartuHalo
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    what is kartu halo?
    Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    simPATI Combo    Enjoy browsing, streaming, and chatting to the fullest
    Validate_carousel_items    2    Kartu As Combo    Enjoy browsing with the best connection
    Validate_carousel_items    2    Loop Cash    Get extra cash when buying an Internet package
    Validate_carousel_items    2    Halo Kick    Earn more premium benefit using Halo Kick!
    Click_carousel_button_on_specific_location    2    4    Buy at GraPARI
    Closing_session

[x]011-User perform inquire TCASH information
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    How to activate TCash?
    Check_VA_response_text    1    All Telkomsel customers both post-paid (kartuHalo) and pre-paid (simPATI, Kartu As, dan Loop) can use TCASH service. Dial *800*88*6PINDigit# on your handphone. For new user, decide your own secret 6 digit PIN.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    how to top up tcash?
    Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Mobile Banking    Follow the instructions to top up your credit    See instructions
    Validate_carousel_items    2    Internet Banking    Follow the instructions to top up credit    See instructions
    Validate_carousel_items    2    ATM Bersama    Follow the instructions to top up credit    See instructions
    Validate_carousel_items    2    GraPARI    Find the nearest GraPARI to top up credit    Find GraPARI
    Validate_carousel_items    2    Retail Store    Follow the instructions to top up credit    See instructions
    User_input    How to recover my TCash password?
    Check_VA_response_text    1    You can visit the nearest GraPARI or contact the Telkomsel Call Centre 188 to request for a PIN reset. Basic Service customers need to upgrade their account to Full Service in order to reset the PIN.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

015-User want to buy a starter pack
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to buy a starter pack
    Check_VA_response_text    1    You can get a Telkomsel starter pack at GraPARI or the nearest outlet
    Check_VA_response_text    2    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Selatan
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    User_input    Jakarta Barat
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    5    Open in Google Maps
    User_input    No
    Closing_session

057-User perform request PIN and PUK
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    My PIN TCare
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK Lightning Diamond, the T-care pin for +628122064620 will be sent shortly via SMS.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

080-User asks about his PUK
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    what is my PUK?
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number     Yes    No
    User_input    Yes
    Check_VA_response_text    1    To ensure your security, I need to verify your Identity first before providing your PUK
    Check_VA_response_text_with_2buttons    2    Choose one from these verification methods: T-Care PIN or last 3 contacted number in the past month. If you have blocked number, use the second option    PIN T-Care    Contacted Number
    User_input    PIN T-Care
    Check_VA_response_text    1    To get T-Care PIN, please type in “PIN” send to 111 (kartuHalo) or 116 (simPATI, KARTU As, LOOP). \ After SMS reply has been received, please input your T-Care PIN
    Check_VA_response_text    2    You can type 'cancel' if you no longer need information about PUK
    User_input    858852
    Check_VA_response_text    1    Thank you for following through our verification process. Here are PUK for mobile number
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

089-User asks about current balance and PIN TCARE
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Check my current balance
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    The remaining balance for
    Check_VA_response_text_with_2buttons    2    Do you want to top-up your balance as well?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    What is my PIN TCare?
    Check_VA_response_text    1    OK Lightning Diamond, the T-care pin for
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

095-User want to know his/ her historical recharge
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    recharge history
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Ok Lightning Diamond, here are 3 last balance recharge that Veronika found for mobile number
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

098-User ask something that VA doesn’t understand and directed to FAQ
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    what is waktu sholat?
    Check_VA_response_text    1    OK, Lightning Diamond. I have several possible answers for you. Choose one of the answer below to find your solution
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Is there anything else you might want to know? Please choose one of the answers below
    Click_carousel_button_on_specific_location    2    1    See the answer here
    Closing_session

099-User ask something that VA doesn’t understand and not available in FAQ
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    What is pop call?
    Check_VA_response_text    1    OK, Lightning Diamond. I have several possible answers for you. Choose one of the answer below to find your solution
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Is there anything else you might want to know? Please choose one of the answers below
    Click_carousel_button_on_specific_location    2    1    See the answer here
    User_input    What is pop sms?
    Check_VA_response_text    1    I'm not sure I understand what you are saying, but I am continuously learning every day
    Check_VA_response_text    2    Could you please elaborate or rephrase your question?
    User_input    What is collect sms?
    Check_VA_response_text    1    OK, Lightning Diamond. I have several possible answers for you. Choose one of the answer below to find your solution
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Is there anything else you might want to know? Please choose one of the answers below
    User_input    Cancel
    Close Browser

117-User wants to perform Send Gift from Prepaid/Postpaid Number to Prepaid/Postpaid Number
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to buy credit for my friend
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK, please input a mobile number that you want to gift \ (Example: 08110000000)
    User_input    0818944239
    Check_VA_response_text    1    Sorry, I couldn’t recognize that. Please type in your Telkomsel number which correspond with given format in the chat window \ 🙂
    User_input    Cancel
    Check_VA_response_text    1    OK, cancelling.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session
