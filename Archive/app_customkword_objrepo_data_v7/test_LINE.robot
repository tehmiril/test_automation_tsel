*** Settings ***
Library           AppiumLibrary
Resource          Test_data_LINE_Indo.txt
Library           String
Library           Collections
Resource          Object_repo_LINE.txt
Resource          Detailed_app_custom_keywords.txt
Resource          Generic_app_custom_keywords.txt

*** Test Cases ***
LINE_10_TCASH
    [Setup]    Open app
    Wait Until Element is Visible    //android.widget.FrameLayout[contains(@content-desc,"Chats tab")]    10    None
    Click Element    //android.widget.FrameLayout[contains(@content-desc,"Chats tab")]
    Wait Until Element is Visible    //*[@text="Chats"]    5    None
    Click Element    //*[@resource-id="jp.naver.line.android:id/chatlist_chatname" and contains(@text,"Telkomsel")]    #id=jp.naver.line.android:id/chatlist_chatname
    #Click Element    //*[@text="CEK INFONYA!"]
    #Swipe_up_until_element    Lihat Menu Utama
    Sleep    2s
    User_input    TCASH itu apaan sih?
    #Sleep    5s
    #Count_messages    TCASH itu apaan sih?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    #Check_VA_response_carousel_exists    2
    #Show_carousel_items_on_specific_location    2    1
    #Show_carousel_items_on_specific_location    2    3
    Validate_carousel_items    2    Info    \    Pertanyaan Lain
    #Click_carousel_button_on_specific_location    2    2    Merchant TCASH
    Sleep    5s
    Cancel_and_closing_session
    #[Teardown]    Close Application

LINE_simple
    [Setup]    Open app
    Wait Until Element is Visible    //android.widget.FrameLayout[contains(@content-desc,"Chats tab")]    10    None
    Click Element    //android.widget.FrameLayout[contains(@content-desc,"Chats tab")]
    Wait Until Element is Visible    //*[@text="Chats"]    5    None
    Click Element    //*[@resource-id="jp.naver.line.android:id/chatlist_chatname" and contains(@text,"Telkomsel")]    #id=jp.naver.line.android:id/chatlist_chatname
    Sleep    2s
    User_input    Halo Vero
    Sleep    7s
    Check_VA_response_text    1    selamat datang
    Check_VA_response_text    2    Apa yang bisa Veronika bantu hari ini?
    Check_VA_response_image    3
    Check_VA_response_text_with_buttons    4    pilih salah satu pilihan    Lihat Menu Utama    Chat in English
    Click_Button_From_Response    4    Lihat Menu Utama
    Sleep    2s
    [Teardown]    Close Application
