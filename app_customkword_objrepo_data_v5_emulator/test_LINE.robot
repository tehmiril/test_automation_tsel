*** Settings ***
Suite Setup       Open app
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session_when_unexpected_result
Library           AppiumLibrary    run_on_failure=No Operation
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
005
    User_input    Saran perdana donk
    Check_VA_response_text    1    Oke, Veronika bantu carikan produk Telkomsel yang cocok buat Kamu ya
    Check_VA_response_text_with_buttons    2    Sebelumnya, tolong jawab 3 pertanyaan singkat berikut ini    Mulai    Lihat Semua Produk
    Click_Button_From_Response    2    Lihat Semua Produk
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    SimPATI Combo    Aktifkan paket internet kualitas jaringan terbaik    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Validate_carousel_items    2    Kartu As Combo    internetan asik dengan jaringan terbaik    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Validate_carousel_items    2    Loop Cash    Beli paket internetan bisa nambah uang jajan    Info Loop Cash    Perdana Loop    Beli sekarang
    Validate_carousel_items    2    Halo Kick    Dapatkan lebih banyak benefit premium dengan Halo Kick!    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    Click_button_carousel    2    Kartu As Combo    Perdana Kartu As    kartuas info    3
    Check_VA_response_image    1
    Check_VA_response_text    2    Kamu bisa cari tahu lebih lanjut di https://telkomsel.com/kartu-as
    Check_VA_response_text_with_buttons    3    Apakah Kamu ingin membeli kartu perdana Kartu As tersebut?    Ya    Tidak
    Click_Button_From_Response    3    Ya
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu line yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih    Option 5    1
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?

006
    User_input    Kartu halo itu apa?
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    SimPATI Combo    Aktifkan paket internet kualitas jaringan terbaik    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Validate_carousel_items    2    Kartu As Combo    internetan asik dengan jaringan terbaik    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Validate_carousel_items    2    Loop Cash    Beli paket internetan bisa nambah uang jajan    Info Loop Cash    Perdana Loop    Beli sekarang
    Validate_carousel_items    2    Halo Kick    Dapatkan lebih banyak benefit premium dengan Halo Kick!    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    #Click_button_carousel    2    Halo Kick    Beli di GraPARI
    #Check_VA_response_text    1    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    #User_input    banda aceh
    #Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    #Check_VA_response_carousel_exists    2
    #Click_button_carousel    2    Police Banda Aceh    Pilih
    #Check_VA_response_text    1    Berikut info GraPARI di sekitar Police Banda Aceh ya
    #Check_VA_response_carousel_exists    2
    #Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    #Click_button_carousel    2    GraPARI SETUI    Buka di Google Maps
    #Closing_session
    Cancel_and_closing_session

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
