*** Settings ***
Suite Setup       Open_chrome    ${URLmessengerTSEL}
Suite Teardown    Close Browser
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session
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
Library           SeleniumLibrary

*** Test Cases ***
001-Non-Telkomsel user who is wondering about Telkomsel products
	Login_messenger    ${email}    ${password}
	User_input    starter pack recommendation
	Check_VA_response_text    1    I'm more than happy to help you find the most suitable Telkomsel product
	Check_VA_response_text_with_2buttons    2    All you need to do is answer these three short questions 🙂    Start    See All Products
	Click_Button_From_Response    2    See All Products
	Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    2    Kartu As Starter
	Check_VA_response_image    1
	Check_VA_response_text    2    For further info click https://telkomsel.com/kartu-as/
	Check_VA_response_text_with_2buttons    3    Do you want to use Kartu As?    Yes    No
	Click_Button_From_Response    3    Yes
	Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
	User_input    Jakarta Barat
	Check_VA_response_text    1    Please choose outlet location that you want
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    1    Choose
	Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
	Check_VA_response_carousel_exists    2
	Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	Click_Button_From_Response    3    No
	Closing_session

002-Non-Telkomsel user who wants to know about KartuAs
	Login_messenger    ${email}    ${password}
	User_input    I want to know about Kartu As
	Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    1    Buy Now
	Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
	User_input    Jakarta Barat
	Check_VA_response_text    1    Please choose outlet location that you want
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    1    Choose
	Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
	Check_VA_response_carousel_exists    2
	Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	Click_carousel_button_on_specific_location    2    1    Open in Google Maps
	Click_Button_From_Response    3    No
	Closing_session

003-Non-Telkomsel user who wants to know about Loop
	Login_messenger    ${email}    ${password}
	User_input    Hi
	Check_VA_response_text    1    Hi
	Check_VA_response_text    2    How may I assist you today
	Check_VA_response_image    3
	Check_VA_response_text_with_2buttons    4    Kindly select one of the options below or directly type in your request    Go To Menu    Ganti Bahasa
	Click_Button_From_Response    4    Go To Menu
	Check_VA_response_carousel_exists    1
	Check_VA_response_text    1    Please select one of the buttons above, or just type in your request.
	Click_carousel_button_on_specific_location    1    2    Digital Life Style
	Validate_carousel_items    1    Discover Telkomsel Product    Browse and purchase your favorite Telkomsel products here    Switch to Telkomsel    Find Your Product    Digital Life Style
	Validate_carousel_items    1    Your Profile    Information about your Telkomsel number    My Quota    My Bill/Balance    My PUK
	Validate_carousel_items    1    Purchase Package and Redeem POIN    Browse and purchase your favorite Telkomsel products here    Top-up    Purchase Package    Telkomsel POIN
	Validate_carousel_items    1    Further Support    Any questions? Find your answer here    Prepaid Registration    Nearest GraPARI    Chat Customer Care
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
	Click_Button_From_Response    3    No
	Closing_session

004-Non-Telkomsel user who wants to know about SimPATI
	Login_messenger    ${email}    ${password}
	User_input    I want to know about Simpati
	Check_VA_response_text    1    Great choice! Here are some Telkomsel products that you can choose from
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    1    Buy Now
	Check_VA_response_text    1    Please specify your location. You may type your location below or use the share location function
	User_input    Jakarta Barat
	Check_VA_response_text    1    Please choose outlet location that you want
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    1    Choose
	Check_VA_response_text    1    I have found several outlets close to Jakarta Barat
	Check_VA_response_carousel_exists    2
	Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	Click_carousel_button_on_specific_location    2    1    Open in Google Maps
	Click_Button_From_Response    3    No
	Closing_session

005-User perform inquire TCASH information
	Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
	User_input    What is TCash?
	Check_VA_response_text    1    TCASH is an electronic money service from Telkomsel, with official license from Bank of Indonesia. You can use TCASH to pay many things; merchants, billing, purchase online, share money and more! TCASH can be used by all Telkomsel users.
	Check_VA_response_carousel_exists    2
	User_input    What are benefits of tcash?
	Check_VA_response_image    1
	Check_VA_response_text_with_2buttons    2    Do you want to learn more about TCASH?    Yes    No
	User_input    the differences between basic and full service tcash?
	Check_VA_response_image    1
	Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	User_input    What are tcash promo?
	Check_VA_response_text    1    Currently, there is a couple of interesting promotions that Telkomsel offers. Here are the list of promotions that you can join
	Check_VA_response_carousel_exists    2
	Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	User_input    where to get tcash sticker
	Check_VA_response_text    1    TCASH is an electronic money service from Telkomsel, with official license from Bank of Indonesia. You can use TCASH to pay many things; merchants, billing, purchase online, share money and more! TCASH can be used by all Telkomsel users.
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    1    Order Sticker
	Closing_session

006-User want to have a 4G card and order it online
	Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
	User_input    How to get 4G sim card?
	Check_VA_response_text    1    To upgrade your SIM card to 4G, change your old SIM card to 4G SIM card ready. Your Telkomsel number will not change during the process. Here are some ways to get a 4G SIM card:
	Check_VA_response_carousel_exists    2
	Check_VA_response_text_with_2buttons    3    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	Click_carousel_button_on_specific_location    2    1    Nearest MyGraPARI
	Click_carousel_button_on_specific_location    2    3    Online Registration
	Click_Button_From_Response    3    No
	Closing_session

007-User wants to know about voucher information
	Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
	User_input    Hi
	Check_VA_response_text    1    Hi
	Check_VA_response_text    2    Hai, kawan simPATI! Do you need any help?
	Check_VA_response_image    3
	Check_VA_response_text_with_2buttons    4    Just type in your request or select a menu below 🙂    Go To Menu    Ganti Bahasa
	User_input    i want to know about telkomsel voucher
	Check_VA_response_text    1    OK
	Check_VA_response_text_with_2buttons    2    Please type your brand: simPATI, Loop or Kartu As.    SimPATI    Loop
	User_input    Cancel
	Check_VA_response_text    1    OK, cancelling.
	Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	Click_Button_From_Response    2    No
	Closing_session

008-User perform request PIN and PUK
	Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
	User_input    My PIN Tcare
	Check_VA_response_text_with_2buttons    1    Before I proceed further, do you want me to continue your inquiry with this phone number    Yes    No
	Click_Button_From_Response    1    Yes
	Check_VA_response_text    1    OK Lightning Diamond, the T-care pin for +628122064620 will be sent shortly via SMS.
	Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	Click_Button_From_Response    2    No
	Closing_session

009-User wants to know how to cash in Tcash
	Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
	User_input    How can I top up my TCASH Balance?
	Check_VA_response_text    1    You can top-up your TCASH balance by following the steps below
	Check_VA_response_carousel_exists    2
	Click_carousel_button_on_specific_location    2    1    See instructions
	Check_VA_response_image    1
	Check_VA_response_text_with_2buttons    2    Is there anything else you might want to know? Please choose one of the answers below    Yes    No
	Click_Button_From_Response    2    No
	Closing_session

010-User ask something that Veronika understand
	Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
	User_input    Hi
	Check_VA_response_text    1    Hi
	Check_VA_response_text    2    Hai, kawan simPATI! Do you need any help?
	Check_VA_response_image    3
	Check_VA_response_text_with_2buttons    4    Just type in your request or select a menu below 🙂    Go To Menu    Ganti Bahasa
	Click_Button_From_Response    4    Go To Menu
	Check_VA_response_text    1    This is the information for your number
	Check_VA_response_carousel_exists    2
	Check_VA_response_text    3    If you want to change your number, please type-in 'Change number'
	Check_VA_response_text    4    Please select one of the buttons above, or just type in your request.
	User_input    What is pop call?
	Check_VA_response_text    1    OK
	Check_VA_response_carousel_exists    2
	Check_VA_response_text    3    Is there anything else you might want to know? Please choose one of the answers below
	User_input    What is waktu shalat?
	Check_VA_response_text    1    OK
	Check_VA_response_carousel_exists    2
	Check_VA_response_text    3    Is there anything else you might want to know? Please choose one of the answers below
	User_input    No
	Closing_session
