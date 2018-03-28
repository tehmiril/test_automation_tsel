*** Settings ***
Library           AppiumLibrary
Resource          Test_data_LINE_Indo.txt
Library           String
Library           Collections
Resource          Object_repo_LINE.txt
Resource          Detailed_app_custom_keywords.txt
Resource          Generic_app_custom_keywords.txt
Resource          SMS_custom_keywords.txt
Resource          Test_data_SMS_Indo.txt
Resource          Text_validation_app_custom_keywords.txt
Resource          Image_validation_app_custom_keywords.txt
Resource          Carousel_validation_app_custom_keywords.txt

*** Test Cases ***
LINE_10_TCASH
    [Setup]    Open app
    Sleep    2s
    User_input    Lihat semua produk
    Check_VA_response_text    1    Pilihan yang tepat!
    Click_carousel_button_on_specific_location    2    3    Perdana Loop
    Sleep    5s
    User_input    cara aktifkan tcash gmn ya?
    Check_VA_response_text    1    TCASH dapat dinikmati oleh seluruh pelanggan Telkomsel baik pascabayar (kartuHalo) maupun prabayar (simPATI, Kartu As, dan Loop). Tekan *800*88*6DigitPIN# di HP Kamu. Untuk pengguna baru, tentukan 6 digit PIN Kamu sendiri.
    Check_VA_response_text    2    ${VA_question_1}
    User_input    TCASH itu apaan sih?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    #Show_carousel_items_on_specific_location    2    2
    #Show_carousel_items_on_specific_location    2    3
    #Validate_carousel_items    2    Dapatkan TCASH    a    Pesan Sticker
    Click_carousel_button_on_specific_location    2    2    Merchant TCASH
    Sleep    5s
    Cancel_and_closing_session
    [Teardown]    Close Application

LINE_simple
    [Setup]    Open app
    Sleep    2s
    User_input    Lihat semua produk
    Check_VA_response_text    1    Pilihan yang tepat!
    Click_carousel_button_on_specific_location    2    3    Beli sekarang
    Sleep    5s
    User_input    TCASH itu apaan sih?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Show_carousel_items_on_specific_location    2    2
    #Show_carousel_items_on_specific_location    2    3
    #Validate_carousel_items    2    Dapatkan TCASH    ha    Pesan Sticker
    Click_carousel_button_on_specific_location    2    3    Pertanyaan Lain
    #User_input_longer    Halo Vero
    #Sleep    7s
    #Check_VA_response_text    1    selamat datang
    #Check_VA_response_text    2    Apa yang bisa Veronika bantu hari ini?
    #Check_VA_response_image    3
    #Check_VA_response_text_with_buttons    4    pilih salah satu pilihan    Lihat Menu Utama    Chat in English
    #Click_Button_From_Response    4    Lihat Menu Utama
    Cancel_and_closing_session
    [Teardown]    Close Application

LINE_SMS_test
    Open app
    User_input    Ganti nomor
    Check_VA_response_text    1    Tolong tulis nomor handphone Kamu ya :) (contoh: 0811000000)
    User_input    081314415099
    Check_VA_response_text    1    Terima kasih untuk informasinya.
    #Check_VA_response_text    2    Veronika akan mengirim
    Open SMS
    Select_TSEL_SMS
    Close Application
    Sleep    1s
    Switch Application    ${LINE_app}
    User_input_longer    ${current_finalelement_pin}
    Check_VA_response_text    1    Oke, Veronika sudah berhasil memverifikasi nomor telepon Kamu ya.
    Sleep    2s
    [Teardown]    Close Application

LINE_check_Ylocation
    Open app
    Sleep    2s
    User_input    TCASH itu apaan sih?
    #Click_carousel_button_on_specific_location    2    2    Merchant TCASH
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_carousel_exists    2
    [Teardown]    Close Application

TEST_text_buttons
    [Setup]    Open app
    Sleep    2s
    Greet_VA
    Click_Button_From_Response    4    Lihat Menu Utama
    User_input    sisa pulsa saya berapa?
    ${result}    Run Keyword and Return Status    Check_VA_response_text_with_buttons    1    ${VA_validateNumber}
    Run Keyword If    ${result}    Click_Button_From_Response    1    Ya
    Sleep    5s
    Check_VA_response_text    1    Setelah Veronika cek,
    #Check_VA_response_text_with_buttons    2    Apakah Kamu juga ingin    Tidak
    Click_Button_From_Response    2    Tidak
    Sleep    5s
    User_input    cara aktifkan tcash gmn ya?
    Check_VA_response_text    1    TCASH dapat dinikmati oleh seluruh pelanggan Telkomsel baik pascabayar (kartuHalo) maupun prabayar (simPATI, Kartu As, dan Loop). Tekan *800*88*6DigitPIN# di HP Kamu. Untuk pengguna baru, tentukan 6 digit PIN Kamu sendiri.
    Check_VA_response_text    2    ${VA_question_1}
    Sleep    1s
    Closing_session
    [Teardown]    Close Application

get date time
    [Setup]    Open app
    Sleep    2s
    Count_messages
    ${count_carousel_date_time}    Get Matching Xpath Count    //android.widget.ListView/child::android.widget.LinearLayout[${total_messages_on_screen}]/descendant::*[@resource-id="jp.naver.line.android:id/chathistory_row_date"]
    #Set Suite Variable    ${current_carousel_date_time}    ${count_carousel_date_time}
    #Run Keyword If    ${count_carousel_date_time}<1    Log    Ha!
    ${date_time}    Get Text    //android.widget.ListView/child::android.widget.LinearLayout[${total_messages_on_screen}]/descendant::*[@resource-id="jp.naver.line.android:id/chathistory_row_date"]
