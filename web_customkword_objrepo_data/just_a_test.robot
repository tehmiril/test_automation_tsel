*** Settings ***
Library           Selenium2Library    run_on_failure=Selenium2Library.CapturePageScreenshot
Resource          Detailed_custkeyword.txt
Resource          Test_data_Indo.txt
Library           String
Resource          Object_repository.txt
Resource          Generic_custkeyword.txt
Library           OperatingSystem
Library           Collections
Library           AppiumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Resource          SMS_custom_keywords.txt
Resource          Test_data_SMS_Indo.txt

*** Test Cases ***
test_carousel
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    User_input    lihat semua produk    #User_input    ${random_question_3}
    Get_carousel_items    2
    Show_carousel_items_on_specific_location    2    3
    Validate_carousel_items    2    SimPATI Combo    \    Info SimPATI Combo    Perdana SimPATI
    Click_carousel_button_on_specific_location    2    4    Info Halo Kick
    [Teardown]    Close Browser

test_askPulsaKuota
    [Documentation]    Here registered user ask for both pulsa and kuota, without top-up.
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    #Greet_VA_Indo
    User_input    ${ask_pulsa}
    Sleep    2s
    ${result}    Run Keyword and Return Status    Check_VA_response_text    1    ${VA_validateNumber}
    Run Keyword If    ${result}    Click_Yes    1
    Check_VA_response_text    1    ${VA_answerPulsa1}
    Check_VA_response_text_with_2buttons    2    ${VA_answerPulsa2}    Ya    Tidak
    Capture Page Screenshot    response_pulsa.png
    User_input    ${ask_kuota}
    Check_VA_response_text    1    ${VA_answerKuota2}
    Check_additional_text_2buttons    1    ${VA_answerKuota3}    Ya    Tidak
    Click_additional_No
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session
    [Teardown]    Close Browser

test_askPulsa
    [Documentation]    Here registered user ask for pulsa, without top-up.
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    #Greet_VA_Indo
    User_input    ${ask_pulsa}
    ${result}    Run Keyword and Return Status    Check_VA_response_text    1    ${VA_validateNumber}
    Run Keyword If    ${result}    Click_Yes    1
    Check_VA_response_text    1    ${VA_answerPulsa1}
    Check_VA_response_text_with_2buttons    2    ${VA_answerPulsa2}    Ya    Tidak
    Click_No    2
    #Sleep    2s
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session
    [Teardown]    Close Browser

test_interaction
    [Documentation]    Here registered user ask for pulsa, without top-up.
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo
    Click_Button_From_Response    4    Lihat Menu Utama
    [Teardown]    Close Browser

test_simple_input_response
    [Setup]    Open_chrome
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo
    User_input    ${random_question_3}
    Check_VA_response_text    1    ${VA_gives_FAQ}
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Capture Page Screenshot    response_qa.png
    User_input    Lihat semua produk
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Capture Page Screenshot    response_produk.png
    Cancel_and_closing_session
    [Teardown]    Close Browser

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

test_web_sms
    Open_chrome
    Login_messenger    ${email}    ${password}
    User_input    Ganti nomor
    Check_VA_response_text    1    Tolong tulis nomor handphone Kamu ya :) (contoh: 0811000000)
    User_input    082113088651
    Check_VA_response_text    1    Terima kasih untuk informasinya.
    Check_VA_response_text    2    Veronika akan mengirim
    Open SMS
    Select_TSEL_SMS
    Close Application
    #Sleep    1s
    #Switch Application    ${LINE_app}
    User_input    ${current_finalelement_pin}
    Check_VA_response_text    1    Oke, Veronika sudah berhasil memverifikasi nomor telepon Kamu ya.
    Sleep    2s
    [Teardown]    Close Browser

001 - Non-Telkomsel user who just started talking to VA
