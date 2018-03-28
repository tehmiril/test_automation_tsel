*** Settings ***
Library           AppiumLibrary
Library           String
Library           Collections
Resource          Test_data_Tel_Indo.txt
Resource          Object_repo_Tel.txt

*** Test Cases ***
Tel_askPulsaKuota
    [Setup]    Open app
    Wait Until Element is Visible    class=org.telegram.messenger.support.widget.RecyclerView    15    None
    Log Source
    Click Element    //android.view.View[@index="0"]
    #Wait Until Element is Visible    class=android.widget.EditText    10    None
    Sleep    5s
    Log Source
    ${result}    Run Keyword and Return Status    Wait Until Element is Visible    //android.widget.TextView[@text="Telkomsel Care"]    10    None
    Run Keyword If    ${result}    Click Element    //android.widget.TextView[@text="START"]
    Sleep    10s
    User_input    ${ask_pulsa}
    Capture Page Screenshot    first_response_pulsa.png
    ${result}    Run Keyword and Return Status    Check_VA_response_main    ${VA_validateNumber}
    Run Keyword If    ${result}    Click_Yes
    Sleep    10s
    Check_VA_response_main    ${VA_answerPulsa1}
    User_input    ${ask_kuota}
    Check_VA_response_main    ${VA_answerKuota1}
    Click_No
    Sleep    5s
    Check_VA_response_main    ${VA_question_1}
    User_input    ${no_answer}
    Check_VA_response_main    ${VA_question_2}
    User_input    ${user_rate}
    Check_VA_response_main    ${VA_question_3}
    User_input    ${select_Rate}
    Check_VA_response_main    ${VA_askRateReason}
    User_input    ${no_answer}
    Sleep    10s
    Check_VA_response_main    ${VA_thanksRate}
    [Teardown]    Close Application

Tel_askVAdoesnotunderstand
    [Setup]    Open app
    Wait Until Element is Visible    //*[@content-desc="Chats tab"]    10    None
    Click Element    //*[@content-desc="Chats tab"]
    Wait Until Element is Visible    //*[@text="Chats"]    5    None
    Click Element    id=jp.naver.line.android:id/chatlist_chatname
    User_input    ${random_question_1}
    Sleep    5s
    Capture Page Screenshot    first_response_notunderstand.png
    Check_VA_response_main    ${VA_notunderstand_1}
    User_input    ${random_question_2}
    Check_VA_response_main    ${VA_notunderstand_6}
    User_input    ${cancel_answer}
    Sleep    5s
    User_input    ${no_answer}
    #Click Element    //*[@text="CEK INFONYA!"]
    Check_VA_response_main    ${VA_question_2}
    User_input    ${user_rate}
    #Click Element    //*[@text="CEK INFONYA!"]
    Check_VA_response_main    ${VA_question_3}
    User_input    ${select_Rate}
    #Click Element    //*[@text="CEK INFONYA!"]
    Check_VA_response_main    ${VA_askRateReason}
    User_input    ${no_answer}
    Sleep    10s
    #Click Element    //*[@text="CEK INFONYA!"]
    Check_VA_response_main    ${VA_thanksRate}
    [Teardown]    Close Application

_test_Telegram
    Open Application    ${appiumServer_Tele}    platformName=${platformName_Tele}    platformVersion=${androidVersion_Tele}    deviceName=${deviceName_Tele}    appPackage=${appPackage_Tele}    appActivity=${appActivity_Tele}
    ...    noReset=true
    Wait Until Element is Visible    class=org.telegram.messenger.support.widget.RecyclerView    15    None
    Click Element    //android.view.View[@index="0"]
    Wait Until Element is Visible    class=android.widget.EditText    10    None
    Input Text    class=android.widget.EditText    Hi
    Click Element    //android.widget.ImageView[@index="2"]
    Wait Until Element is Visible    //*[@text="Lihat Menu Utama"]    5    None
    [Teardown]    Close Application

10-TCASH Information
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    User_input    TCASH itu apaan sih?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_carousel_exists    2
    User_input    apa sih untungnya pake tcash?
    Check_VA_response_image    1
    Check_VA_response_text_with_2buttons    2    Apa Kamu mau tahu lebih banyak tentang TCASH?    Ya    Tidak
    User_input    Apa sih bedanya tcash basic dan full service?
    Check_VA_response_image    1
    Check_VA_response_text    2    ${VA_question_1}
    User_input    Tcash ada promo apa aja ya?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Promo TCASH    \    Merchant TCASH
    Validate_carousel_items    2    Info    \    Pertanyaan Lain
    Validate_carousel_items    2    Dapatkan TCASH    \    Dapatkan di GraPARI
    Validate_carousel_items    2    Promo TCASH    Dapatkan diskon menarik di merchant mitra TCASH    Merchant TCASH
    Validate_carousel_items    2    Info    Informasi mengenai TCASH    Pertanyaan Lain
    #Validate_carousel_items    2    Dapatkan TCASH    Dapatkan TCASH di GraPARI atau dikirimkan ke rumah Kamu    Dapatkan di GraPARI
    Click_button_carousel    2    Dapatkan TCASH    Pesan Sticker
    #Click_button_carousel    2    Info    TCASH FAQ
    Cancel_and_closing_session
    [Teardown]    Close Browser

11-TCASH Information
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    User_input    cara aktifkan tcash gmn ya?
    Check_VA_response_text    1    TCASH dapat dinikmati oleh seluruh pelanggan Telkomsel baik pascabayar (kartuHalo) maupun prabayar (simPATI, Kartu As, dan Loop). Tekan *800*88*6DigitPIN# di HP Kamu. Untuk pengguna baru, tentukan 6 digit PIN Kamu sendiri.
    Check_VA_response_text    2    ${VA_question_1}
    User_input    cara isi ulang tcash gmn ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Mobile Banking    Ikuti cara berikut untuk isi saldo TCASH melalui mobile/sms    Lihat Caranya
    Validate_carousel_items    2    Internet Banking    Ikuti cara berikut untuk isi saldo TCASH melalui internet banking    Lihat Caranya
    Validate_carousel_items    2    ATM Bersama    Ikuti cara berikut untuk isi saldo TCASH melalui ATM    Lihat Caranya
    Validate_carousel_items    2    GraPARI    Kamu bisa pergi ke GraPARI untuk isi saldo TCASH    Cari GraPARI
    Validate_carousel_items    2    Retail Store    Kunjungi retail store terdekat untuk isi saldo TCASH    Lihat Caranya
    Click_button_carousel    2    Mobile Banking    Lihat Caranya
    Check_VA_response_image    1
    Check_VA_response_text    2    ${VA_question_1}
    User_input    saya lupa pin tcash
    Check_VA_response_text    1    Kamu dapat mendatangi GraPARI terdekat atau hubungi Call Centre 188 untuk mengajukan reset PIN TCASH. Pelanggan Basic Service akan diupgrade menjadi Full Service agar dapat melakukan reset PIN.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session
    [Teardown]    Close Browser

*** Keywords ***
Swipe_until_element
    [Arguments]    ${findElement}
    : FOR    ${licznik}    IN RANGE    0    10
    \    Swipe    600    600    100    600
    \    ${elementXNew}    Select_carousel    ${findElement}
    \    Run Keyword If    39.0 < ${elementXNew} < 233.0    Run Keywords    Log    "Yeah"
    \    ...    AND    Exit For Loop
    \    ${licznik}    Set Variable    ${licznik}+1

Select_carousel
    [Arguments]    ${findElement}
    ${bound}    Get Element Location    //android.view.View[@text="${findElement}"]
    ${boundString}    Convert To String    ${bound}
    ${elementsXY}    Split String    ${boundString}    ${SPACE}
    #location format, e.g. ${elementsXY} = [u"{'y':", u'702.0,', u"'x':", u'718.0}']
    ${elementX}    Get From List    ${elementsXY}    3
    ${finalelementX}    Strip String    ${elementX}    characters=}
    [Return]    ${finalelementX}

Open app
    Open Application    ${appiumServer_Tele}    platformName=${platformName_Tele}    platformVersion=${androidVersion_Tele}    deviceName=${deviceName_Tele}    appPackage=${appPackage_Tele}    appActivity=${appActivity_Tele}
    ...    noReset=true

User_input
    [Arguments]    ${input_text}
    #Click Element    //*[@content-desc="Keyboard menu"]
    #Wait Until Element is Visible    ${textbox_obj}    5    None
    Input Text    ${textbox_obj}    ${input_text}
    Press Keycode    13
    Sleep    5s
    #Click Element    //*[@content-desc="Keyboard menu"]

Check_VA_response
    [Arguments]    ${response_text}
    Click Element    id=jp.naver.line.android:id/chathistory_main_content_area
    Element Should Be Visible    //android.view.View[contains(@text,'${response_text}')]
    #Text Should Be Visible    ${response_text}    False
    #Wait Until Page Contains Element    //android.view.View[@text='${response_text}']    2s

Click_Yes
    #${totalYa}    Get Matching Xpath Count    ${Ya_button}
    Click Element    //android.widget.TextView[@text="Ya"]

Click_No
    #${totalNo}    Get Matching Xpath Count    ${Tidak_button}
    Click Element    //android.widget.TextView[@text="Tidak"]

Check_VA_response_main
    [Arguments]    ${response_text}
    #Click Element    id=jp.naver.line.android:id/chathistory_main_content_area
    Element Should Be Visible    //android.view.View[contains(@text,'${response_text}')]
