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
[x]001-Non-Telkomsel user who just started talking to VA
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    How may I assist you today
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    Kindly select one of the options below or directly type in your request    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    2    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    1    4    Telkomsel POIN
    Check_VA_response_text    1    In order to process your inquire, please type your valid Telkomsel phone number (e.g. 0811000000)
    User_input

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
    Validate_carousel_items    1    Purchase Now    Promotion Detail    See All Promotions
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
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    grapari that open on sunday in Jakarta
    Check_VA_response_text    1    Which GraPARI area are you looking for ?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several GraPARI close to Jakarta that fulfill the condition.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
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

[x]018-User explore the FAQ menu and read about voucher information
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_carousel_exists    1
    Check_VA_response_text    2    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    3    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    1    5    FAQ
    Check_VA_response_carousel_exists    1
    Click_carousel_button_on_specific_location    1    1    Voucher Info
    Check_VA_response_text    1    OK
    Check_VA_response_text_with_buttons    2    Please type your brand: simPATI, Loop or Kartu As.    SimPATI    Loop    Kartu As
    User_input    Kartu As
    Check_VA_response_text    1    Below is the information for Kartu As voucher
    Check_VA_response_image    2
    Check_VA_response_text_with_2buttons    3    Do you want to top-up your balance as well?    ${yes_answer}    ${no_answer}
    User_input    Yes
    Check_VA_response_text    1    Yes
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2

019-User perform inquire outlet location
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to buy voucher 10.000
    Check_VA_response_text    1    Currently, I can only provide voucher with the following nominals: 50.000, 100.000, 150.000, 200.000, and 300.000. If you still want to top up with your nominal, I can help you to find the nearest GraPARI or outlet in your area
    Check_VA_response_text    2    Please specify your location. You may type your location below or use the share location function
    User_input    Jakarta Barat
    Check_VA_response_text    1    Please choose outlet location that you want
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    1    Open in Google Maps
    User_input    No
    Closing_session

[x]020-User perform setting Caller ID \ for Apple, Android, Windows Phone, and Blackberry
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    5    FAQ
    Check_VA_response_carousel_exists    1
    Click_carousel_button_on_specific_location    1    1    Device Config
    Check_VA_response_text    1    Below are the device related configurations that I can help you with:
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    Caller ID Setting
    Check_VA_response_text    1    To connect to the internet, make sure you have configured the APN (Access Point Name) settings correctly. Select the type of your phone to get the configuration instruction:
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Apple
    Check_VA_response_text    1    OK, let me guide you 🙂 For Caller ID setting in Apple smartphone, you may follow these steps:
    Check_VA_response_image    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    I want to set caller ID for android device
    Check_VA_response_text    1    OK, let me guide you 🙂 For Caller ID setting in Android smartphone, you may follow these steps:
    Check_VA_response_image    2
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    I want to set Caller ID \ for Windows Phone
    Check_VA_response_text    1    OK, let me guide you 🙂 For Caller ID setting in Windows Phone smartphone, you may follow these steps:
    Check_VA_response_image    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    how to \ setting Caller ID \ for Blackberry
    Check_VA_response_text    1    OK, let me guide you 🙂 For Caller ID setting in Blackberry smartphone, you may follow these steps:
    Check_VA_response_image    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]021-User complain about his internet connection
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    can't connect to the network

[x]022-User complain about his internet service and agree to connect to agent
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I have internet problem
    Check_VA_response_text    1    Sorry for your inconvenience 🙂
    Check_VA_response_text    2    OK, Lightning Diamond. I will check the issue for you
    Check_VA_response_text_with_2buttons    3    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    In order to fix your issue, please select operating system of your phone below
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Apple

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

[x]025-User expresses harsh comment and ask random question to Veronika
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input

[x]028-User request to connect to agent direclty from main menu
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    5    Chat Customer Care
    Check_VA_response_text    1    What do you want to ask? Maybe I can help with your problem
    User_input    What is pop sms?
    Check_VA_response_text    1    My bad, I'm still learning. I don't understand what you've meant by that
    Check_VA_response_text    2    Could you please elaborate or rephrase your question?
    User_input    What is pop sms?
    Check_VA_response_text    1    Currently I'm unable to process your request
    Check_VA_response_text    2    Let me connect you to one of our customer service agents
    Check_VA_response_text    3    In the mean time, you can try one of the entertainment below
    Check_VA_response_carousel_exists    4
    Check_VA_response_text    5    You can type 'cancel' if you no longer need help from a customer service agent
    User_input    Cancel
    Check_VA_response_text    1    OK, cancelling
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]029-User Inquire Active Subscribed Offer
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Now, as often as you can buy Telkomsel packages, you have a big chance to win! For more information, click: tsel.me/racingpaketVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Purchase Now    Go To Menu    Ganti Bahasa
    User_input    what are my active packages?
    Check_VA_response_text    1    At the moment, I can only provide information on packages that you subscribed here or via MyTelkomsel Apps
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    what are my subscribed packages?
    Check_VA_response_text    1    At the moment, I can only provide information on packages that you subscribed here or via MyTelkomsel Apps
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

030-User inquire for hot offer
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    is there any promo for internet product?
    Check_VA_response_text    1    Currently, there is a couple of interesting promotions that Telkomsel offers. Here are the list of promotions that you can join
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    2    Promotion Detail
    User_input    Cancel
    Closing_session

[x]031-User perform inquire subscribed main offering, package terms & condition and subscribed offer
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    what is my current priceplan?
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK
    Check_VA_response_text    2    Is there anything else you might want to know? Please choose one of the answers below
    User_input    what is the best package for me?
    Check_VA_response_carousel_exists    1
    Click_carousel_button_on_specific_location    1    3    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Detail
    Check_VA_response_text    1    Listed below is the terms and condition for
    Check_VA_response_text    2    Paket Internet berlaku untuk
    Check_VA_response_text_with_2buttons    4    Would you like to buy this offer?    Yes    No
    User_input    No
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    User_input    Cancel
    Check_VA_response_text    1    ${cancel_answer}
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Closing_session

032-Prepaid User ask for Recharge History
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Mudik season will come soon! Now you can go back to hometown only by redeeming your Telkomsel POIN. See the details here: tsel.me/POINmudik
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    How may I assist you today    Go To Menu    Ganti Bahasa
    User_input    my payments history
    Check_VA_response_text    1    Okay
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

033-Prepaid User perform Get Invoice Date & Amount
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    have i paid the bill for this month?
    Check_VA_response_text    1    Billing and invoice inquiry is only available for kartuHalo subscribers.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

034-Prepaid user who wants to topup using credit card
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Top-up credit
    Check_VA_response_text    1    OK Lightning Diamond, you may choose one of the available top-up options below.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Credit Card
    Close Browser

035-Prepaid user who wants to topup using Mandiri ClickPay
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Top-up credit
    Check_VA_response_text    1    OK Lightning Diamond, you may choose one of the available top-up options below.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    E-Banking
    Check_VA_response_carousel_exists    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    1    1    Select
    User_input    No
    Closing_session

036-Prepaid user who wants to topup using PermataNet
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Top-up credit
    Check_VA_response_text    1    OK Lightning Diamond, you may choose one of the available top-up options below.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    2    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    E-Banking
    Check_VA_response_carousel_exists    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    1    1    Select
    User_input    No
    Closing_session

037-Prepaid user who wants top up his credit using TCASH but doesn't have a TCASH account yet
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    i want to top-up credit
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    TCASH
    Check_VA_response_text_with_2buttons    1    You do not have enough credit. Do you want to know how to top-up your TCASH credit?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]038-Prepaid user who wants top up his credit using TCASH
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    i want to top-up credit
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    TCASH

[x]039-User perform reload using TCASH but has insufficient balance
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    i want to top-up credit
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    TCASH

040-Prepaid user who wants to top up using E-Banking (Mandiri ClickPay)
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    i want to top-up credit
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    E-Banking
    Check_VA_response_carousel_exists    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    1    1    Select
    User_input    No
    Close Browser

041-Prepaid user who wants to top up using E-Banking (PermataNet)
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    i want to top-up credit
    Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
    User_input    Yes
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    E-Banking
    Check_VA_response_carousel_exists    1
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    1    2    Select
    User_input    No
    Close Browser

[x]042-Prepaid user who performs top up through TCASH
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Top-up credit
    Check_VA_response_text    1    OK Lightning Diamond, you may choose one of the available top-up options below.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    TCASH

043-Prepaid users who ask about registration status
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Is my number registrated?
    Check_VA_response_text    1    You can check your prepaid registration by dialing *444# on your phone You are able to dial this number despite your number has been blocked
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    Yes
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Quota detail
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    See Internet Quota
    Check_VA_response_text    1    Unfortunately, you do not have any active Internet quota
    Check_VA_response_text_with_2buttons    2    Do you wish to purchase additional/add-on offers?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    Yes
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Top-up credit
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    User_input    Cancel
    Check_VA_response_text    1    ${cancel_answer}
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Closing_session

[x]044-Prepaid user who wants to purchase the package that VA offers
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    2    Buy favourite package
    Check_VA_response_text    1    OK
    Check_VA_response_text_with_2buttons    2    Do you wish to spend    Yes    No

[x]045-User want to see the detail information of ongoing promotion
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Promotion Detail
    Click_carousel_button_on_specific_location    2    1    Join This Promo

046-User want to see all promotion
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    2    Browse packages
    Check_VA_response_text    1    You can purchase any of our offers listed in the five catalogues provided below:
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    You can also type 'cancel' to start over
    User_input    cancel
    Check_VA_response_text    1    OK, cancelling.
    Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Check_VA_response_text    1    Thank you for contacting me. I'm happy to help!
    Close Browser

[x]047-Prepaid user who wants to explore the loyalty card
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    4    POINTASTIC DEAL Info
    Click_carousel_button_on_specific_location    2    4    Redeem your reward

[x]048-User want to know and participate on POINTASTIC DEALS (optional)
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    4    POINTASTIC DEAL Info

[x]049-User want to know and participate on POINTASTIC DEALS (optional)
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    4    POINTASTIC DEAL Info

[x]050-User wa nts to book an appointment at GraPARI
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    I want to book an appointment
    Check_VA_response_text    1    Hi
    User_input    Jakarta Pusat
    Check_VA_response_text    1    Which GraPARI area are you looking for ?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several GraPARI close to Jakarta Pusat.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    Click_carousel_button_on_specific_location    2    1    Make an Appointment
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    Choose Service
    Check_VA_response_text    1    Speaking of information and complaint, one of Telkomsel staff can also help you with your needs.
    Check_VA_response_text_with_2buttons    2    Do you want to speak with a Telkomsel customer service agent?    Yes    No
    User_input    No
    Check_VA_response_text    1    When do you want to come to GraPARI?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    17:00-21:00 WIB
    Check_VA_response_text    1    What time do you want to come?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    18:00-18:30 WIB
    Check_VA_response_text    1    The appointment booking for mobile number
    Check_VA_response_text_with_buttons    2    Is everything correct?    Yes    No    Cancel
    User_input    Yes

[x]051-User want to know about detail information about his/her reservation
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Purchase your credit here and get 10% cashback. For more information, click: tsel.me/cashbackVA
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    Just type in your request or select a menu below 🙂    Top-up Now    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    5    Appointment Detail
    Check_VA_response_text    1    Below is your next appointment at GraPARI.
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Change Reservation
    Check_VA_response_text_with_buttons    1    Which appointment details that you wish to change?    Date & Time    Location    Cancel
    User_input    Location
    Check_VA_response_text    1    Please specify a location/area where you wish to find a GraPARI. You may share your location or type-in below
    User_input    Jakarta Pusat
    Check_VA_response_text    1    Which GraPARI area are you looking for ?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Choose
    Check_VA_response_text    1    I have found several GraPARI close to Tanah Abang.
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Make an Appointment
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    Choose Service
    Check_VA_response_text    1    Speaking of information and complaint, one of Telkomsel staff can also help you with your needs.
    Check_VA_response_text_with_2buttons    2    Do you want to speak with a Telkomsel customer service agent?    Yes    No
    User_input    No
    Check_VA_response_text    1    When do you want to come to GraPARI?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    2    17:00-21:00
    Check_VA_response_text    1    What time do you want to come?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    3    19:00-19:30
    Check_VA_response_text    1    Here is your new appointment schedule. Please check your appointment detail.
    Check_VA_response_text_with_buttons    2    Is everything correct?    Yes    No    Cancel
    User_input    Yes
    Check_VA_response_text    1    Perfect! Thank you for making the appointment. Looking forward to meeting you!
    Check_VA_response_image    2
    Check_VA_response_text    3    Please come 15 minutes before your appointment and show your appointment number to one of our Telkomsel staff.
    Check_VA_response_text_with_2buttons    4    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Check_VA_response_text    1    Thank you for chatting with me. Chat with me again anytime 🙂
    Close Browser

[x]052-Postpaid user wants to change his number (vice versa)
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Mudik season will come soon! Now you can go back to hometown only by redeeming your Telkomsel POIN. See the details here: tsel.me/POINmudik
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    How may I assist you today    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.

[x]053-Postpaid user who has outstanding bill wants to pay his bill
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Mudik season will come soon! Now you can go back to hometown only by redeeming your Telkomsel POIN. See the details here: tsel.me/POINmudik
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    How may I assist you today    Go To Menu    Ganti Bahasa
    User_input    Go To Menu

054-Postpaid user want to check quota detail information
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    Hi
    Check_VA_response_text    1    Hi
    Check_VA_response_text    2    Mudik season will come soon! Now you can go back to hometown only by redeeming your Telkomsel POIN. See the details here: tsel.me/POINmudik
    Check_VA_response_image    3
    Check_VA_response_text_with_2buttons    4    How may I assist you today    Go To Menu    Ganti Bahasa
    User_input    Go To Menu
    Check_VA_response_text    1    This is the information for your number
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    1    If you want to change your number, please type-in 'Change number'
    Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
    Click_carousel_button_on_specific_location    2    1    Quota detail
    Check_VA_response_text    1    OK
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    See Internet Quota
    Check_VA_response_text    1    Here's your remaining Internet quota:
    Check_VA_response_text_with_2buttons    2    Do you wish to purchase additional/add-on offers?    Yes    No
    User_input    No
    Check_VA_response_text_with_2buttons    1    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
    User_input    No
    Check_VA_response_text    1    Thank you for chatting with me. Chat with me again anytime 🙂
    Close Browser

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

[x]055-User want to add kartuHalo subscripton
