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
002-Non-Telkomsel who wants to explore VA
    Login_messenger    ${email}    ${password}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    How may I assist you today
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    Kindly select one of the options below or directly type in your request    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    2    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    1    4    Top-up
    Check_VA_response_text    1    In order to process your inquire, please type your valid Telkomsel phone number (e.g. 0811000000)
    User_input    cancel
    Check_VA_response_text    1    OK, cancelling.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]004-Non-Telkomsel user who greets VA for the first time and explore VA
    Login_messenger    ${email}    ${password}
    User_input    Hi
    Check_VA_response_text    1    Hi M Testaut, welcome to Telkomsel Virtual GraPARI
    Check_VA_response_text    2    How may I assist you today
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    Kindly select one of the options below or directly type in your request    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    2    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    1    2    Switch to Telkomsel
    Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    simPATI Combo    Enjoy browsing, streaming, and chatting to the fullest    SimPATI Combo Info    SimPATI Starter Pack    Buy Now
    Validate_carousel_items    2    Kartu As Combo    Enjoy browsing with the best connection    Kartu As Combo Info    Kartu As Starter    Buy now
    Validate_carousel_items    2    Loop Cash    Get extra cash when buying an Internet package    Loop Cash Info    Loop Starter Pack    Buy now
    Validate_carousel_items    2    Halo Kick    Earn more premium benefit using Halo Kick!    Halo Kick Info    Register kartuHalo    Buy at GraPARI
    Click_carousel_button_on_specific_location    2    1    SimPATI Combo Info
    Click_carousel_button_on_specific_location    2    1    SimPATI Starter Pack
    Check_VA_response_image    1
    Check_VA_response_text    2    For further info click https://telkomsel.com/simpati
    Check_VA_response_text_with_2buttons    3    Do you want to use simPATI?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    starter pack that suits me
    Check_VA_response_text    1    I'm more than happy to help you find the most suitable Telkomsel product
    Check_VA_response_text_with_2buttons    2    All you need to do is answer these three short questions 🙂    Start    See All Products
    User_input    Start
    Check_VA_response_text_with_buttons    1    What do you use your handphone for?    A. Chatting & socmed    B. Video games music    C. All the above
    User_input    B. Video games music
    Check_VA_response_text    1    Interesting 🙂
    Check_VA_response_text_with_buttons    2    On average, how much money (in Rupiah) you usually spend for your phone?    A. < 50.000    B. 50.000 - 150.000    C. > 150.000
    User_input    B. 50.000 - 150.000
    Check_VA_response_text    1    Well noted 🙂
    Check_VA_response_text_with_2buttons    2    Speaking about payment method, which one do you prefer, monthly bill or pay-as-you-go?    A. Pay-as-you-go    B. Monthly Bill
    User_input    A. Pay-as-you-go
    Check_VA_response_text    1    All done! Here's the Telkomsel product that suits you the most. Enjoy 🙂
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    1    Loop Cash Info
    Click_carousel_button_on_specific_location    2    1    Loop Starter Pack
    Check_VA_response_image    1
    Check_VA_response_text    2    For further info click https://telkomsel.com/loop/
    Check_VA_response_text_with_2buttons    3    Do you want to use Loop?    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Pusat
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Pusat
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

005-Non-Telkomsel user who is wondering about Telkomsel products
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    recommend starter pack sim card
    Check_VA_response_text    1    I'm more than happy to help you find the most suitable Telkomsel product
    Check_VA_response_text_with_2buttons    2    All you need to do is answer these three short questions 🙂    Start    See All Products
    User_input    See All Products
    Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    Kartu As Starter
    Check_VA_response_image    1
    Check_VA_response_text    2    For further info click https://telkomsel.com/kartu-as/
    Check_VA_response_text_with_2buttons    3    Do you want to use Kartu As?    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Barat
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Close Browser

[x]006-Non-Telkomsel user who is interested in using KartuHalo
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    what is kartu halo?
    Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    simPATI Combo    Enjoy browsing, streaming, and chatting to the fullest    SimPATI Combo Info    SimPATI Starter Pack    Buy Now
    Validate_carousel_items    2    Kartu As Combo    Enjoy browsing with the best connection    Kartu As Combo Info    Kartu As Starter    Buy Now
    Validate_carousel_items    2    Loop Cash    Get extra cash when buying an Internet package    Loop Cash Info    Loop Starter Pack    Buy Now
    Validate_carousel_items    2    Halo Kick    Earn more premium benefit using Halo Kick!    Halo Kick Info    Register kartuHALO    Buy at GraPARI
    Click_carousel_button_on_specific_location    2    4    Buy at GraPARI
    Closing_session

007-Non-Telkomsel user who wants to know about KartuAs
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to know about Kartu As
    Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Buy Now
    Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Barat
    Check_VA_response_text    1    Please choose outlet location that you want
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Open in Google Maps
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Close Browser

008-Non-Telkomsel user who wants to know about SimPATI
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to know about Simpati
    Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Buy Now
    Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Barat
    Check_VA_response_text    1    Please choose outlet location that you want
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Open in Google Maps
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Close Browser

[x]009-Non-Telkomsel user who wants to know about Loop
    Login_messenger    ${email}    ${password}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    How may I assist you today
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    Kindly select one of the options below or directly type in your request    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    2    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    1    2    Digital Life Style
    Validate_carousel_items    1              Purchase Now    Promotion Detail    See All Promotions
    Validate_carousel_items    1    Discover Telkomsel Product    Browse and purchase your favorite Telkomsel products here    Switch to Telkomsel    Find Your Product    Digital Life Style
    Validate_carousel_items    1    Your Profile    Information about your Telkomsel number    My Quota    My Bill/Balance    My PUK
    Validate_carousel_items    1    Purchase Package and Redeem POIN    Browse and purchase your favorite Telkomsel products here    Top-up    Purchase Package    Telkomsel POIN
    Validate_carousel_items    1    Further Support    Any questions? Find your answer here    Prepaid Registration    Nearest GraPARI    Talk to Our Agent
    Click_carousel_button_on_specific_location    1    2    Switch to Telkomsel
    Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    Buy now
    Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
    User_input    Bandung
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Bandung
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    1    Open in Google Maps
    User_input    No
    Closing_session

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

011-User perform inquire TCASH information
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

012-User want to have a 4G card and order it online
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    How to get 4G sim card?
    Check_VA_response_text    1    To upgrade your SIM card to 4G, change your old SIM card to 4G SIM card ready. Your Telkomsel number will not change during the process. Here are some ways to get a 4G SIM card:
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    1    Nearest MyGraPARI
    Click_carousel_button_on_specific_location    2    3    Online Registration
    User_input    No
    Closing_session

013-User perform Inquire 4G Upgrade and Find Nearest Store
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi Lightning Diamond, welcome to Telkomsel Virtual GraPARI
    Check_VA_response_text    2    Now, as often as you can buy Telkomsel packages, you have a big chance to win! For more information, click: tsel.me/racingpaketVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Purchase Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    5    FAQ
    Check_VA_response_carousel_exists    1
    Click_button_carousel_faq    1    FAQ    Upgrade to 4G
    Check_VA_response_text_with_2buttons    1    OK Lightning Diamond To use 4G services, make sure your smartphone & SIM card are 4G ready. Does your smartphone support 4G network ?    Yes    Not Yet
    User_input    Yes
    Check_VA_response_text_with_2buttons    1    Have you swapped your old SIM card to the new 4G SIM card?    Yes    Not yet
    User_input    Not yet
    Check_VA_response_text    1    To upgrade your SIM card to 4G, change your old SIM card to 4G SIM card ready. Your Telkomsel number will not change during the process. Here are some ways to get a 4G SIM card:
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    2    Nearest GraPARI
    Check_VA_response_text    1    Please specify a location/area where you wish to find a GraPARI. You may share your location or type-in below
    User_input    Jakarta Pusat
    Check_VA_response_text    1    Which GraPARI area are you looking for ?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    C
    Check_VA_response_text    1    I have found several GraPARI close to
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]014-User want to search a grapari that opens on a specific day
    Login_messenger

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

016-User want to buy voucher data
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to buy voucher data
    Check_VA_response_text    1    You can get internet voucher at the nearest outlet
    Check_VA_response_text    2    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Pusat
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Pusat
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]017-User wants to know about voucher information
    Login_messenger    ${email}    ${password}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Now, as often as you can buy Telkomsel packages, you have a big chance to win! For more information, click: tsel.me/racingpaketVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Purchase Now    Go To Menu    Ganti Bahasa
    User_input    Info voucher telkomsel
    Check_VA_response_text    1    OK
    Check_VA_response_text_with_buttons    2    Please type your brand: simPATI, Loop or Kartu As.    simPATI    Loop    Kartu As
    User_input    Cancel
    Check_VA_response_text    1    OK, cancelling.
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

056-Postpaid User ask his credit limit
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    My credit's limit
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Your Domestic credit limit is
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Close Browser

057-User perform request PIN and PUK
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    My PIN TCare
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK Lightning Diamond, the T-care pin for +628122064620 will be sent shortly via SMS.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

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

080-User asks about his PUK
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    what is my PUK?
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
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

084-User want to check his/ her last invoice date and amount
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    My last invoice
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Your total invoice is
    Check_VA_response_text_with_2buttons    2    Do you want to process the payment?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Close Browser

086-User asks for his credit limit
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    My credit's limit
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Your Domestic credit limit is
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Check_VA_response_text    1    Thank you for contacting me. I'm happy to help!
    Close Browser

088-User asks about his usage
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    Check my usage
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Currently, you've used
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Close Browser

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

092-User Inquire Active Subscribed Offer
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    my active package information
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK Lightning Gold, below are active packages for
    Check_VA_response_text_with_2buttons    2    Do you want to check your quota as well?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    what is my subscribed package?
    Check_VA_response_text    1    OK Lightning Gold, below are packages subscribed by
    Check_VA_response_text_with_2buttons    2    Do you want to check your quota as well?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    no
    Check_VA_response_text    1    Thank you for chatting with me. Chat with me again anytime 🙂
    Close Browser

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

[x]112-User wants to perform Send Gift Purchase Package from Postpaid (Consumer with Block 1 or Block 2 Status) to Prepaid Number
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    I want to buy package for my friend
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK, please input a mobile number that you want to gift \ (Example: 08110000000)
    User_input    08122064620
    Check_VA_response_text_with_2buttons    1    Below are the gifts you can give to your destination number    Buy Credit Balance    Buy Packages
    User_input    Cancel
    Check_VA_response_text    1    OK, cancelling.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

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

[x]133-Prepaid user who has insufficient prepaid balance purchase Mobile Legend voucher games
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to buy voucher game
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    Here are some categories of games voucher you might choose
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Buy
    Check_VA_response_text_with_2buttons    1    It seems like you do not have sufficient balance. Do you want to top up your balance or browse other vouchers?    Top Up    See Other Vouchers
    User_input    Top Up
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    User_input    Cancel
    Close Browser
