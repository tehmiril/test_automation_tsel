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
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    Jelajah Produk Telkomsel    Temukan produk terbaik Telkomsel di sini    Beralih ke Telkomsel    Produk untuk Kamu    Layanan Digital
    Validate_carousel_items    1    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Sisa Kuota    Tagihan/Sisa Pulsa    Info PUK
    Validate_carousel_items    1    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    Validate_carousel_items    1    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    2    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
    User_input    Beli Pulsa
    User_input    Batal
    Closing_session
    [Teardown]    Close Browser

002 - Non-Telkomsel who wants to explore VA
    [Setup]    Open_chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    Jelajah Produk Telkomsel    Temukan produk terbaik Telkomsel di sini    Beralih ke Telkomsel    Produk untuk Kamu    Layanan digital
    Validate_carousel_items    1    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Sisa Kuota    Tagihan/Sisa Pulsa    Info PUK
    Validate_carousel_items    1    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    Validate_carousel_items    1    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    2    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
    Click_button_carousel    1    Beli Paket dan Tukar POIN    Beli Pulsa
    Check_VA_response_text    1    Agar permintaan Kamu dapat diproses lebih lanjut, tolong tulis nomor Telkomsel Kamu yang valid ya (contoh: 08110000000)
    User_input    Batal
    Check_VA_response_text    1    Baiklah, Veronika batalkan.
    Check_VA_response_text    2    Ada lagi yang bisa Veronika bantu?
    Closing_session
    [Teardown]    Close Browser

005 - Non-Telkomsel user who is wondering about Telkomsel products
    [Setup]    Open Chrome
    Login_messenger    ${email}    ${password}
    User_input    Saran perdana donk
    Check_VA_response_text    1    Oke, Veronika bantu carikan produk Telkomsel yang cocok buat Kamu ya
    Check_VA_response_text_with_2buttons    2    Sebelumnya, tolong jawab 3 pertanyaan singkat berikut ini    Mulai    Lihat Semua Produk
    Click_Button_From_Response    2    Lihat Semua Produk
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    SimPATI Combo    Aktifkan paket internet kualitas jaringan terbaik    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Validate_carousel_items    2    Kartu As Combo    internetan asik dengan jaringan terbaik    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Validate_carousel_items    2    Loop Cash    Beli paket internetan bisa nambah uang jajan    Info Loop Cash    Perdana Loop    Beli sekarang
    Validate_carousel_items    2    Halo Kick    Dapatkan lebih banyak benefit premium dengan Halo Kick!    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    Click_button_carousel    2    Kartu As Combo    Perdana Kartu As
    Check_VA_response_image    1
    Check_VA_response_text    2    Kamu bisa cari tahu lebih lanjut di https://telkomsel.com/kartu-as
    Check_VA_response_text_with_2buttons    3    Apakah Kamu ingin membeli kartu perdana Kartu As tersebut?    Ya    Tidak
    Click_Button_From_Response    3    Ya
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    [Teardown]    Close Browser

006 - Non-Telkomsel user who is interested in using KartuHalo
    [Setup]    Open Chrome
    Login_messenger    ${email}    ${password}
    User_input    Kartu halo itu apa?
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    SimPATI Combo    Aktifkan paket internet kualitas jaringan terbaik    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Validate_carousel_items    2    Kartu As Combo    internetan asik dengan jaringan terbaik    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Validate_carousel_items    2    Loop Cash    Beli paket internetan bisa nambah uang jajan    Info Loop Cash    Perdana Loop    Beli sekarang
    Validate_carousel_items    2    Halo Kick    Dapatkan lebih banyak benefit premium dengan Halo Kick!    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    Click_button_carousel    2    Halo Kick    Beli di GraPARI
    Check_VA_response_text    1    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    User_input    banda aceh
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Berikut info GraPARI di sekitar Police Banda Aceh ya
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_button_carousel    2    GraPARI SETUI    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

007 - Non-Telkomsel user who wants to know about KartuAs
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Mau tau info KartuAs dong
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    SimPATI Combo    Aktifkan paket internet kualitas jaringan terbaik    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Validate_carousel_items    2    Kartu As Combo    internetan asik dengan jaringan terbaik    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Validate_carousel_items    2    Loop Cash    Beli paket internetan bisa nambah uang jajan    Info Loop Cash    Perdana Loop    Beli sekarang
    Validate_carousel_items    2    Halo Kick    Dapatkan lebih banyak benefit premium dengan Halo Kick!    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    Click_button_carousel    2    Kartu As Combo    Beli sekarang
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

008 - Non-Telkomsel user who wants to know about SimPATI
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Mau tau info SimPATI dong
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    SimPATI Combo    Aktifkan paket internet kualitas jaringan terbaik    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Validate_carousel_items    2    Kartu As Combo    internetan asik dengan jaringan terbaik    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Validate_carousel_items    2    Loop Cash    Beli paket internetan bisa nambah uang jajan    Info Loop Cash    Perdana Loop    Beli sekarang
    Validate_carousel_items    2    Halo Kick    Dapatkan lebih banyak benefit premium dengan Halo Kick!    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    Click_button_carousel    2    SimPATI Combo    Beli sekarang
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Medan
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

[X] 009 - Non-Telkomsel user who wants to know about Loop
    [Setup]    Open_chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    Jelajah Produk Telkomsel    Temukan produk terbaik Telkomsel di sini    Beralih ke Telkomsel    Produk untuk Kamu    Layanan digital
    Validate_carousel_items    1    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Sisa Kuota    Tagihan/Sisa Pulsa    Info PUK
    Validate_carousel_items    1    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    Validate_carousel_items    1    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    2    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
    #Click_button_carousel    1    Jelajah Produk Telkomsel    Layanan digital
    Click_button_carousel    1    Jelajah Produk Telkomsel    Beralih ke Telkomsel
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    SimPATI Combo    Aktifkan paket internet kualitas jaringan terbaik    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Validate_carousel_items    2    Kartu As Combo    internetan asik dengan jaringan terbaik    Info Kartu As Combo    Perdana Kartu As    Beli sekarang
    Validate_carousel_items    2    Loop Cash    Beli paket internetan bisa nambah uang jajan    Info Loop Cash    Perdana Loop    Beli sekarang
    Validate_carousel_items    2    Halo Kick    Dapatkan lebih banyak benefit premium dengan Halo Kick!    Info Halo Kick    Daftar kartuHalo    Beli di GraPARI
    Click_button_carousel    2    Loop Cash    Beli sekarang
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

010 - TCASH Information
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

011 - TCASH Information
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

012 - User want to have a 4G card and order it online
    [Setup]    Open Chrome
    Login_messenger    ${email}    ${password}
    User_input    gimana caranya dapat sim card 4g
    Check_VA_response_text    1    Untuk upgrade ke kartu SIM 4G, Kamu harus mengganti kartu SIM lama dengan kartu SIM 4G. Berikut adalah beberapa cara untuk mendapatkannya:
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    MyGraPARI Terdekat    Dapatkan SIM card 4G di GraPARI dengan membawa ID Card Kamu    MyGraPARI Terdekat
    Validate_carousel_items    2    GraPARI Terdekat    Dapatkan SIM card 4G di GraPARI dengan membawa ID Card Kamu    GraPARI Terdekat
    Validate_carousel_items    2    Registrasi Online    SIM card 4G akan dikirim ke rumah    Registrasi Online
    Click_button_carousel    2    MyGraPARI Terdekat    MyGraPARI Terdekat
    #Click_button_carousel    2    Registrasi Online    Registrasi Online
    Closing_session
    [Teardown]    Close Browser

[DEPRECATED] 013 - User perform Inquire 4G Upgrade and Find Nearest Store

[X] 014 - User want to search a grapari that opens on a specific day
    [Setup]    Open Chrome
    Login_messenger    ${email}    ${password}
    User_input    grapari yang buka di hari minggu di jakarta selatan
    [Teardown]    Close Browser

[X] 015 - User want to buy a starter pack
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    mau beli perdana
    Check_VA_response_text    1    Kamu bisa mendapatkan perdana Telkomsel di GraPARI maupun di outlet terdekat
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Sydney
    Click_carousel_button_on_specific_location    1    1    Pilih
    Check_VA_response_text    1    Mohon maaf, Veronika tidak menemukan adanya outlet Telkomsel di dekat sydney
    Check_VA_response_text    2    Ada lagi yang bisa Veronika bantu?
    Closing_session
    [Teardown]    Close Browser

[X] 016 - User want to buy voucher data
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    mau beli voucher data
    Check_VA_response_text    1    Voucher data bisa Kamu dapatkan di outlet terdekat
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Sydney
    Check_VA_response_carousel_exists    1
    Closing_session
    [Teardown]    Close Browser

[X] 017 - User wants to know about voucher information
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    Jelajah Produk Telkomsel    Temukan produk terbaik Telkomsel di sini    Beralih ke Telkomsel    Produk untuk Kamu    Layanan digital
    Validate_carousel_items    1    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Sisa Kuota    Tagihan/Sisa Pulsa    Info PUK
    Validate_carousel_items    1    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    Validate_carousel_items    1    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    2    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
    User_input    mau tau info voucher telkomsel
    Check_VA_response_text    1    Oke Lightning Diamond, Telkomsel menyediakan berbagai macam voucher isi ulang sesuai kebutuhan Kamu
    Check_VA_response_text_with_2buttons    2    Kamu pake simPATI, Loop, atau Kartu As?    SimPATI    Loop
    User_input    batal
    Closing_session
    [Teardown]    Close Browser

[DEPRECATED] 018 - User explore the FAQ menu and read about voucher information
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    Jelajah Produk Telkomsel    Temukan produk terbaik Telkomsel di sini    Beralih ke Telkomsel    Produk untuk Kamu    Layanan digital
    Validate_carousel_items    1    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Sisa Kuota    Tagihan/Sisa Pulsa    Info PUK
    Validate_carousel_items    1    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    Validate_carousel_items    1    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    2    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
    User_input    mau tau info voucher telkomsel
    Check_VA_response_text    1    Oke Lightning Diamond, Telkomsel menyediakan berbagai macam voucher isi ulang sesuai kebutuhan Kamu
    Check_VA_response_text_with_2buttons    2    Kamu pake simPATI, Loop, atau Kartu As?    SimPATI    Loop
    User_input    batal
    Closing_session
    [Teardown]    Close Browser

019 - User perform inquire outlet location
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    beli pulsa 10000
    Check_VA_response_text    1    Kamu bisa mengisi ulang pulsa dengan nominal tersebut di GraPARI maupun di outlet terdekat.
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

[DEPRECATED] 020- User perform setting Caller ID \ for Apple, Android, Windows Phone, and Blackberry
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    beli pulsa 10000
    Check_VA_response_text    1    Kamu bisa mengisi ulang pulsa dengan nominal tersebut di GraPARI maupun di outlet terdekat.
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

[DEPRECATED] 021- User complain about his internet connection
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    beli pulsa 10000
    Check_VA_response_text    1    Kamu bisa mengisi ulang pulsa dengan nominal tersebut di GraPARI maupun di outlet terdekat.
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

[X] 023- No Title
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    Kamu bisa mengisi ulang pulsa dengan nominal tersebut di GraPARI maupun di outlet terdekat.
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser

[X] 024- User wants to have a small talk with Veronika
    [Setup]    Open Chrome
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    Kamu bisa mengisi ulang pulsa dengan nominal tersebut di GraPARI maupun di outlet terdekat.
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    banda aceh
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Police Banda Aceh    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Police Banda Aceh yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Ada lagi yang bisa Veronika bantu?
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session
    [Teardown]    Close Browser
