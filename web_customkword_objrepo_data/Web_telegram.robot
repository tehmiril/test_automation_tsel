*** Settings ***
Suite Setup       Set_init_browser_variable
Suite Teardown    Close Browser
Test Setup        Check_tags
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session
Library           SeleniumLibrary    run_on_failure=No Operation
Library           String
Library           OperatingSystem
Library           Collections
Resource          Local_path.txt
Resource          Custom_keywords/Browser_custkeyword.txt
Resource          Custom_keywords/SMS_web_custom_keywords.txt
Resource          Telegram/Test_data_user_input_Telegram_Indo.txt
Resource          Telegram/Text_with_buttons_custkeyword_Telegram.txt
Resource          Telegram/Detailed_custkeyword_Telegram.txt
Resource          Telegram/Generic_custkeyword_Telegram.txt
Resource          Telegram/Object_repository_Telegram.txt
Resource          Telegram/Test_data_VA_response_Telegram_Indo.txt
Resource          Test_data/URL_data.txt

*** Test Cases ***
001 - Non-Telkomsel user who just started talking to VA
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    User_input    Beli Pulsa
    Cancel_and_closing_session

tester2
    Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini :)    SimPATI    Kartu As    Loop    kartuHaloSimPATI
    ...    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    1    Kartu As    Kartu As
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk Kartu As    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Click_Button_From_Response    1    Perdana Kartu As    NONE
    Check_VA_response_image    2
    Check_VA_response_text    3    Kamu bisa cari tahu lebih lanjut di https://telkomsel.com/kartu-as
    Check_VA_response_text_with_buttons    4    Apakah Kamu ingin membeli kartu perdana Kartu As tersebut?    Ya    Tidak
    Cancel_and_closing_session

002 - Non-Telkomsel who wants to explore VA
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Click_Button_From_Response    1    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia: :)    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Beli Pulsa    Beli Pulsa
    Check_VA_response_text    1    Agar permintaan Kamu dapat diproses lebih lanjut, tolong tulis nomor Telkomsel Kamu yang valid ya (contoh: 08110000000)
    Cancel_and_closing_session

005 - Non-Telkomsel user who is wondering about Telkomsel products
    [Tags]    Non-Telkomsel_Telegram
    User_input    Saran perdana donk
    Check_VA_response_text    1    Oke, Veronika bantu carikan produk Telkomsel yang cocok buat Kamu ya
    Check_VA_response_text_with_buttons    2    Sebelumnya, tolong jawab 3 pertanyaan singkat berikut ini    Mulai    Lihat Semua Produk
    Click_Button_From_Response    2    Lihat Semua Produk    Lihat Semua Produk
    Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    1    Kartu As    Kartu As
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk Kartu As    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Click_Button_From_Response    1    Perdana Kartu As    NONE
    Check_VA_response_image    2
    Check_VA_response_text    3    Kamu bisa cari tahu lebih lanjut di https://telkomsel.com/kartu-as
    Check_VA_response_text_with_buttons    4    Apakah Kamu ingin membeli kartu perdana Kartu As tersebut?    Ya    Tidak
    Click_Button_From_Response    4    Ya    Ya
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu
    User_input    jakarta    #banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Timur    NONE    #Police Banda Aceh    NONE
    Check_VA_response_text    3    Veronika menemukan beberapa outlet Telkomsel di sekitar Jakarta Timur yang dapat Kamu kunjungi nih
    Check_VA_response_text_with_buttons    4    Berikut GraPARI dan outlet terdekat di sekitarmu
    Check_VA_response_text    5    Ada lagi yang bisa Veronika bantu?
    Cancel_and_closing_session

006 - Non-Telkomsel user who is interested in using KartuHalo
    [Tags]    Non-Telkomsel_Telegram
    User_input    Kartu halo itu apa
    Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    1    kartuHalo    kartuHalo
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk kartuHalo    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    Click_Button_From_Response    1    Beli di GraPARI    NONE
    Check_VA_response_text    2    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    User_input    jakarta    #banda aceh
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Timur    NONE    #Police Banda Aceh    NONE
    Check_VA_response_text    3    Berikut info GraPARI di sekitar Police Banda Aceh ya
    Check_VA_response_text_with_buttons    4    Show GraPARI
    Click_Button_From_Response    4    GraPARI PONDOK BAMBU    NONE    #SETUI    NONE
    Check_VA_response_text_with_buttons    5    Apa lagi yang kamu butuhkan?    Lihat di Google Maps    Buat Reservasi
    Check_VA_response_text    6    Ada lagi yang bisa Veronika bantu?
    Click_Button_From_Response    5    Lihat di Google Maps    NONE
    Closing_session

007 - Non-Telkomsel user who wants to know about KartuAs
    [Tags]    Non-Telkomsel_Telegram
    User_input    Mau tau info KartuAs dong
    Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    1    Kartu As    Kartu As
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk Kartu As    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Click_Button_From_Response    1    Beli sekarang    NONE
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu
    User_input    jakarta
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Timur    NONE
    Check_VA_response_text    3    Veronika menemukan beberapa outlet Telkomsel di sekitar Jakarta Timur yang dapat Kamu kunjungi nih
    Check_VA_response_text_with_buttons    4    Berikut GraPARI dan outlet terdekat di sekitarmu
    Check_VA_response_text    5    Ada lagi yang bisa Veronika bantu?
    Click_Button_From_Response    4    NAZWA CELL SELASA    NONE
    Closing_session

008 - Non-Telkomsel user who wants to know about SimPATI
    [Tags]    Non-Telkomsel_Telegram
    User_input    Mau tau info SimPATI dong
    Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    1    SimPATI    SimPATI
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk SimPATI    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Click_Button_From_Response    1    Beli sekarang    NONE
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu
    User_input    jakarta
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Timur    NONE
    Check_VA_response_text    3    Veronika menemukan beberapa outlet Telkomsel di sekitar Jakarta Timur yang dapat Kamu kunjungi nih
    Check_VA_response_text_with_buttons    4    Berikut GraPARI dan outlet terdekat di sekitarmu
    Check_VA_response_text    5    Ada lagi yang bisa Veronika bantu?
    Click_Button_From_Response    4    NAZWA CELL SELASA    NONE
    Closing_session

009 - Non-Telkomsel user who wants to know about Loop
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Click_Button_From_Response    1    Jelajahi Produk Telkomsel    Jelajahi Produk Telkomsel
    Check_VA_response_text_with_buttons    1    Berikut jenis informasi yang bisa Veronika berikan untuk Kamu    Beralih ke Telkomsel    Produk untuk Kamu    Layanan digital
    Click_Button_From_Response    1    Layanan digital    NONE
    Click_Button_From_Response    1    Beralih ke Telkomsel    NONE
    Check_VA_response_text_with_buttons    2    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    2    Loop    Loop
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk Loop    Info Loop Cash    Perdana Loop    Beli sekarang
    Click_Button_From_Response    1    Beli sekarang    NONE
    User_input    jakarta
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Timur    NONE
    Check_VA_response_text    3    Veronika menemukan beberapa outlet Telkomsel di sekitar Jakarta Timur yang dapat Kamu kunjungi nih
    Check_VA_response_text_with_buttons    4    Berikut GraPARI dan outlet terdekat di sekitarmu
    Check_VA_response_text    5    Ada lagi yang bisa Veronika bantu?
    Click_Button_From_Response    4    NAZWA CELL SELASA    NONE
    Closing_session

[x] 010 - TCASH Information
    [Tags]    Telkomsel_Telegram
    User_input    TCASH itu apaan sih?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_text_with_buttons    2    TCASH info    Dapatkan di GraPARI    Pesan Sticker    Promo TCASH    Merchant TCASH
    ...    TCASH FAQ    Pertanyaan Lain
    User_input    apa sih untungnya pake tcash?
    Check_VA_response_image    1
    Check_VA_response_text_with_buttons    2    Apa Kamu mau tahu lebih banyak tentang TCASH?    Ya    Tidak
    User_input    Apa sih bedanya tcash basic dan full service?
    Check_VA_response_image    1
    Check_VA_response_text    2    ${VA_question_1}
    User_input    Tcash ada promo apa aja ya?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Validate_carousel_items    2    Promo TCASH    \    Merchant TCASH
    Validate_carousel_items    2    Info    \    Pertanyaan Lain
    Validate_carousel_items    2    Dapatkan TCASH    \    Dapatkan di GraPARI
    Validate_carousel_items    2    Promo TCASH    Dapatkan diskon menarik di merchant mitra TCASH    Merchant TCASH
    Validate_carousel_items    2    Info    Informasi mengenai TCASH    Pertanyaan Lain
    #Validate_carousel_items    2    Dapatkan TCASH    Dapatkan TCASH di GraPARI atau dikirimkan ke rumah Kamu    Dapatkan di GraPARI
    Click_button_carousel    2    Dapatkan TCASH    Pesan Sticker
    #Click_button_carousel    2    Info    TCASH FAQ
    Cancel_and_closing_session

011 - TCASH Information
    [Tags]    Telkomsel_Telegram
    User_input    cara aktifkan tcash gmn ya?
    Check_VA_response_text    1    TCASH dapat dinikmati oleh seluruh pelanggan Telkomsel baik pascabayar (kartuHalo) maupun prabayar (simPATI, Kartu As, dan Loop). Tekan *800*88*6DigitPIN# di HP Kamu. Untuk pengguna baru, tentukan 6 digit PIN Kamu sendiri.
    Check_VA_response_text    2    ${VA_question_1}
    User_input    cara isi ulang tcash gmn ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    2    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    Click_Button_From_Response    2    Mobile Banking    NONE
    Check_VA_response_image    3
    Check_VA_response_text    4    ${VA_question_1}
    User_input    saya lupa pin tcash
    Check_VA_response_text    1    Kamu dapat mendatangi GraPARI terdekat atau hubungi Call Centre 188 untuk mengajukan reset PIN TCASH. Pelanggan Basic Service akan diupgrade menjadi Full Service agar dapat melakukan reset PIN.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

012 - User want to have a 4G card and order it online
    [Tags]    Telkomsel_Telegram
    User_input    gimana caranya dapat sim card 4g
    Check_VA_response_text_with_buttons    1    Untuk upgrade ke kartu SIM 4G, ganti kartu SIM lama Kamu dengan kartu SIM 4G ya. Pergantian kartu tidak akan mengubah nomor Telkomsel Kamu. Berikut adalah beberapa cara untuk mendapatkannya:    MyGraPARI Terdekat    GraPARI Terdekat    Registrasi Online
    Click_Button_From_Response    1    MyGraPARI Terdekat    NONE
    Closing_session

[x] 052 - Postpaid user wants to change his number (vice versa)
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Ganti Nomor
    Check_VA_response_text    1    Agar permintaan Kamu dapat diproses lebih lanjut, tolong tulis nomor Telkomsel Kamu yang valid ya (contoh: 08110000000)
    User_input    082110685202
    Check_VA_response_text    1    Terima kasih untuk informasinya.
    Check_VA_response_text    2    Veronika akan mengirim password melalui SMS dari TELKOMSEL ke nomor +6282110685202. Silakan tulis password tersebut ya.
    Check_VA_response_text    2    Password hanya berlaku 3 menit. Kamu bisa ketik 'Password Baru' untuk dikirimkan password baru.
    Get_OTP
    Check_VA_response_text    1    Oke, Veronika sudah berhasil memverifikasi nomor telepon Kamu ya.
    Check_VA_response_text    2    ${VA_Greet1}
    Closing_session
