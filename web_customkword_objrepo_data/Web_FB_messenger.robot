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
Resource          Test_data/Test_data_user_input_Indo.txt
Resource          Test_data/URL_data.txt
Resource          Test_data/Test_data_VA_response_Indo.txt
Resource          Test_data/Test_data_VA_response_carousel_TSEL_Indo.txt
Resource          Test_data/Test_data_payment.txt
Resource          Test_data/Test_data_VA_response_carousel_NonTSEL_Indo.txt

*** Test Cases ***
001 - Non-Telkomsel user who just started talking to VA
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    User_input    Beli Pulsa
    Cancel_and_closing_session

002 - Non-Telkomsel who wants to explore VA
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Click_button_carousel    1    Beli Paket dan Tukar POIN    Beli Pulsa
    Check_VA_response_text    1    Agar permintaan Kamu dapat diproses lebih lanjut, tolong tulis nomor Telkomsel Kamu yang valid ya (contoh: 08110000000)
    Cancel_and_closing_session

005 - Non-Telkomsel user who is wondering about Telkomsel products
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Saran perdana donk
    Check_VA_response_text    1    Oke, Veronika bantu carikan produk Telkomsel yang cocok buat Kamu ya
    Check_VA_response_text_with_buttons    2    Sebelumnya, tolong jawab 3 pertanyaan singkat berikut ini    Mulai    Lihat Semua Produk
    Click_Button_From_Response    2    Lihat Semua Produk
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Validate_VA_carousel_produk
    Click_button_carousel    2    Kartu As Combo    Perdana Kartu As
    Check_VA_response_image    1
    Check_VA_response_text    2    Kamu bisa cari tahu lebih lanjut di https://telkomsel.com/kartu-as
    Check_VA_response_text_with_buttons    3    Apakah Kamu ingin membeli kartu perdana Kartu As tersebut?    Ya    Tidak
    Click_Button_From_Response    3    Ya
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    jakarta selatan
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    #Click_button_carousel    2    Jakarta Selatan    Pilih
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel    #di sekitar Jakarta Selatan yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}

006 - Non-Telkomsel user who is interested in using KartuHalo
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Kartu halo itu apa?
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Validate_VA_carousel_produk
    Click_button_carousel    2    Halo Kick    Beli di GraPARI
    Check_VA_response_text    1    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    User_input    Jakarta Selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_carousel_exists    2
    #Click_button_carousel    2    Jakarta Selatan    Pilih
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Berikut info GraPARI di sekitar    #Jakarta Selatan ya
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    #Click_button_carousel    2    GraPARI SETUI    Buka di Google Maps
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session

007 - Non-Telkomsel user who wants to know about KartuAs
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Mau tau info KartuAs dong
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Validate_VA_carousel_produk
    Click_button_carousel    2    Kartu As Combo    Beli sekarang
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Jakarta Selatan
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    #Click_button_carousel    2    Jakarta Selatan    Pilih
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel    #di sekitar Jakarta Selatan yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session

008 - Non-Telkomsel user who wants to know about SimPATI
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Mau tau info SimPATI dong
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Validate_VA_carousel_produk
    Click_button_carousel    2    SimPATI Combo    Beli sekarang
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Medan
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Medan yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Click_carousel_button_on_specific_location    2    3    Buka di Google Maps
    Closing_session

009 - Non-Telkomsel user who wants to know about Loop
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Click_button_carousel    1    Jelajah Produk Telkomsel    Layanan digital
    Click_button_carousel    1    Jelajah Produk Telkomsel    Beralih ke Telkomsel
    Check_VA_response_text    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini
    Validate_VA_carousel_produk
    Click_button_carousel    2    Loop Cash    Beli sekarang
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Jakarta Selatan
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    #Click_button_carousel    2    Jakarta Selatan    Pilih
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar    #Jakarta Selatan yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session

010 - TCASH Information
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    User_input    TCASH itu apaan sih?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_carousel_exists    2
    User_input    apa sih untungnya pake tcash?
    Check_VA_response_image    1
    Check_VA_response_text_with_buttons    2    Apa Kamu mau tahu lebih banyak tentang TCASH?    Ya    Tidak
    User_input    Apa sih bedanya tcash basic dan full service?
    Check_VA_response_image    1
    Check_VA_response_text    2    ${VA_question_1}
    User_input    Tcash ada promo apa aja ya?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Promo TCASH    Dapatkan diskon menarik di merchant mitra TCASH    Merchant TCASH
    Validate_carousel_items    2    Info    Informasi mengenai TCASH    Pertanyaan Lain
    Validate_carousel_items    2    Dapatkan TCASH    Dapatkan TCASH di GraPARI atau dikirimkan ke rumah Kamu    Dapatkan di GraPARI
    Click_button_carousel    2    Dapatkan TCASH    Pesan Sticker
    Cancel_and_closing_session

011 - TCASH Information
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    User_input    cara aktifkan tcash gmn ya?
    Check_VA_response_text    1    TCASH dapat dinikmati oleh seluruh pelanggan Telkomsel baik pascabayar (kartuHalo) maupun prabayar (simPATI, Kartu As, dan Loop). Tekan *800*88*6DigitPIN# di HP Kamu. Untuk pengguna baru, tentukan 6 digit PIN Kamu sendiri.
    Check_VA_response_text    2    ${VA_question_1}
    User_input    cara isi ulang tcash gmn ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Validate_VA_carousel_tcash    2
    Click_button_carousel    2    Mobile Banking    Lihat Caranya
    Check_VA_response_image    1
    Check_VA_response_text    2    ${VA_question_1}
    User_input    saya lupa pin tcash
    Check_VA_response_text    1    Kamu dapat mendatangi GraPARI terdekat atau hubungi Call Centre 188 untuk mengajukan reset PIN TCASH. Pelanggan Basic Service akan diupgrade menjadi Full Service agar dapat melakukan reset PIN.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

012 - User want to have a 4G card and order it online
    [Tags]    Telkomsel_FB
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

013 - User perform Inquire 4G Upgrade and Find Nearest Store
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_button_carousel    2    Bantuan Lainnya    FAQ
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    FAQ    \    Info Voucher    Info Upgrade 4G    Info Konfigurasi
    Click_button_carousel    1    FAQ    Info Upgrade 4G
    Check_VA_response_text_with_buttons    1    Oke M Testaut ${\n}Sebelum menggunakan layanan 4G, pastikan Handphone & SIM card Kamu sudah mendukung 4G. ${\n}Apakah handphone Kamu sudah 4G?    Sudah    Belum
    Click_Button_From_Response    1    Sudah
    Check_VA_response_text_with_2buttons    1    Apakah Kamu sudah membeli SIM Card 4G?    Sudah    Belum
    Click_Button_From_Response    1    Belum
    Check_VA_response_text    1    Untuk upgrade ke kartu SIM 4G, ganti kartu SIM lama Kamu dengan kartu SIM 4G ya. Pergantian kartu tidak akan mengubah nomor Telkomsel Kamu. ${\n}Berikut adalah beberapa cara untuk mendapatkannya:
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    MyGraPARI Terdekat    Dapatkan SIM card 4G di GraPARI dengan membawa ID Card Kamu \ \ \ \    MyGraPARI Terdekat
    Validate_carousel_items    2    GraPARI Terdekat    Dapatkan SIM card 4G di GraPARI dengan membawa ID Card Kamu \ \ \ \    GraPARI Terdekat
    Validate_carousel_items    2    Registrasi Online    SIM card 4G akan dikirim ke rumah    Registrasi Online
    Check_VA_response_text    3    ${VA_question_1}
    Click_button_carousel    2    GraPARI Terdekat    GraPARI Terdekat
    Check_VA_response_text    1    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    User_input    jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_carousel_exists    2
    #Click_button_carousel    2    Jakarta Selatan    Pilih
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Berikut info GraPARI di sekitar    #Jakarta Selatan ya
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session

013(backup) - User perform Inquire 4G Upgrade and Find Nearest Store
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_button_carousel    2    Bantuan Lainnya    FAQ
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    FAQ    \    Info Voucher    Info Upgrade 4G    Info Konfigurasi
    Click_button_carousel    1    FAQ    Info Upgrade 4G
    Check_VA_response_text_with_buttons    1    Oke M Testaut ${\n}Sebelum menggunakan layanan 4G, pastikan Handphone & SIM card Kamu sudah mendukung 4G. ${\n}Apakah handphone Kamu sudah 4G?    Sudah    Belum
    Click_Button_From_Response    1    Sudah
    Check_VA_response_text_with_2buttons    1    Apakah Kamu sudah membeli SIM Card 4G?    Sudah    Belum
    Click_Button_From_Response    1    Belum
    Check_VA_response_text    1    Untuk upgrade ke kartu SIM 4G, ganti kartu SIM lama Kamu dengan kartu SIM 4G ya. Pergantian kartu tidak akan mengubah nomor Telkomsel Kamu. ${\n}Berikut adalah beberapa cara untuk mendapatkannya:
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    MyGraPARI Terdekat    Dapatkan SIM card 4G di GraPARI dengan membawa ID Card Kamu \ \ \ \    MyGraPARI Terdekat
    Validate_carousel_items    2    GraPARI Terdekat    Dapatkan SIM card 4G di GraPARI dengan membawa ID Card Kamu \ \ \ \    GraPARI Terdekat
    Validate_carousel_items    2    Registrasi Online    SIM card 4G akan dikirim ke rumah    Registrasi Online
    Check_VA_response_text    3    ${VA_question_1}
    Click_button_carousel    2    GraPARI Terdekat    GraPARI Terdekat
    Check_VA_response_text    1    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    User_input    jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_carousel_exists    2
    #Click_button_carousel    2    Jakarta Selatan    Pilih
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Berikut info GraPARI di sekitar    #Jakarta Selatan ya
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session

014 - User want to search a grapari that opens on a specific day
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    User_input    grapari yang buka di hari minggu di jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Berikut GraPARI di Jakarta Selatan yang sesuai dengan kondisi Kamu
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session

015 - User want to buy a starter pack
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    mau beli perdana
    Check_VA_response_text    1    Kamu bisa mendapatkan perdana Telkomsel di GraPARI maupun di outlet terdekat
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Sydney
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Mohon maaf, Veronika tidak menemukan adanya outlet Telkomsel di dekat sydney
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

016 - User want to buy voucher data
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    mau beli voucher data
    Check_VA_response_text    1    Voucher data bisa Kamu dapatkan di outlet terdekat
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Sydney
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Mohon maaf, Veronika tidak menemukan adanya outlet Telkomsel di dekat sydney
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

017 - User wants to know about voucher information
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau tau info voucher telkomsel
    Check_VA_response_text    1    Oke Lightning Diamond, Telkomsel menyediakan berbagai macam voucher isi ulang sesuai kebutuhan Kamu
    Check_VA_response_text_with_buttons    2    Kamu pake simPATI, Loop, atau Kartu As?    SimPATI    Loop    Kartu As
    Cancel_and_closing_session

018 - User explore the FAQ menu and read about voucher information
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_button_carousel    2    Bantuan Lainnya    FAQ
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    FAQ    \    Info Voucher    Info Upgrade 4G    Info Konfigurasi
    Click_button_carousel_faq    1    FAQ    Info Voucher
    Check_VA_response_text    1    Oke M Testaut, Telkomsel menyediakan berbagai macam voucher isi ulang sesuai kebutuhan Kamu
    Check_VA_response_text_with_buttons    2    Kamu pake simPATI, Loop, atau Kartu As?    SimPATI    Loop    Kartu As
    Click_Button_From_Response    2    Kartu As
    Check_VA_response_text    1    Berikut informasi voucher Kartu As untuk Kamu
    Check_VA_response_image    2
    Check_VA_response_text_with_2buttons    3    Apakah Kamu juga ingin melakukan pengisian pulsa?    Ya    Tidak
    Click_Button_From_Response    3    Ya
    Check_VA_response_text    1    Oke M Testaut, Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Rp50.000    Berlaku 45 Hari    Pilih
    Validate_carousel_items    2    Rp100.000    Berlaku 60 Hari    Pilih
    Validate_carousel_items    2    Rp150.000    Berlaku 120 Hari    Pilih
    Validate_carousel_items    2    Rp200.000    Berlaku 150 Hari    Pilih
    Validate_carousel_items    2    Rp300.000    Berlaku 180 Hari    Pilih
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_button_carousel    2    Rp50.000    Pilih
    Check_VA_response_text    1    Oke M Testaut, untuk melanjutkan pengisian pulsa sebesar Rp50000, silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_carousel_exists    2
    Validate_VA_carousel_payment    2
    Click_carousel_button_on_specific_location    2    1    Kartu Kredit
    Pay_with_credit_card    FAIL
    User_input    voucher simpati nominalnya berapa aja?
    Check_VA_response_text    1    Berikut informasi voucher simPATI.
    Check_VA_response_image    2
    Check_VA_response_text_with_2buttons    3    Apakah Kamu juga ingin melakukan pengisian pulsa?    Ya    Tidak
    Click_Button_From_Response    3    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

019 - User perform inquire outlet location
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    beli pulsa 10000
    Check_VA_response_text    1    Kamu bisa mengisi ulang pulsa dengan nominal tersebut di GraPARI maupun di outlet terdekat.
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    jakarta selatan
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Jakarta Selatan    Pilih
    Check_VA_response_text    1    Veronika menemukan beberapa outlet Telkomsel di sekitar Jakarta Selatan yang dapat Kamu kunjungi nih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Click_carousel_button_on_specific_location    2    1    Buka di Google Maps
    Closing_session

020- User perform setting Caller ID for Apple, Android, Windows Phone, and Blackberry
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_button_carousel    2    Bantuan Lainnya    FAQ
    Check_VA_response_carousel_exists    1
    Click_button_carousel    1    FAQ    Info Konfigurasi
    Check_VA_response_text    1    Berikut Veronika berikan jenis konfigurasi yang bisa Kamu pilih ya
    Validate_VA_carousel_konfigurasi    2
    Click_button_carousel    2    Konfigurasi terkait telepon    Pengaturan Caller ID
    Check_VA_response_text    1    Untuk membantu Kamu terkait hal ini, silakan pilih salah satu ya
    Validate_VA_carousel_konfigurasi_callerID    2
    Click_button_carousel    2    iOS (Apple)    Apple
    Check_VA_response_text    1    Veronika pandu ya :) ${\n}Untuk pengaturan Caller ID di handphone Apple, Kamu bisa ikuti langkah-langkah berikut:
    Check_VA_response_image    2
    Check_VA_response_text    3    ${VA_question_1}
    User_input    Mau setting caller id di android gmn ya?
    Check_VA_response_text    1    Veronika pandu ya :) ${\n}Untuk pengaturan Caller ID di handphone Android, Kamu bisa ikuti langkah-langkah berikut:
    Check_VA_response_image    2
    Check_VA_response_image    3
    Check_VA_response_text    4    ${VA_question_1}
    User_input    Mau setting caller id di windows phone gmn ya?
    Check_VA_response_text    1    Veronika pandu ya :) ${\n}Untuk pengaturan Caller ID di handphone Windows Phone, Kamu bisa ikuti langkah-langkah berikut:
    Check_VA_response_image    2
    Check_VA_response_text    3    ${VA_question_1}
    User_input    Mau setting caller id di blackberry gmn ya?
    Check_VA_response_text    1    Veronika pandu ya :) ${\n}Untuk pengaturan Caller ID di handphone Blackberry, Kamu bisa ikuti langkah-langkah berikut:
    Check_VA_response_image    2
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session

[DEPRECATED] 021- User complain about his internet connection
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}

[AGENT INVOLVED] 022 - User complain about his internet service and agree to connect to agent

023- Smalltalk
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_2buttons    2    Apakah Kamu mau?    Ya    Tidak
    Click_Button_From_Response    2    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session
    Closing_session

[Too Big Random] 024- User wants to have a small talk with Veronika
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak
    Click_Button_From_Response    2    Ya

[X] 025- User expresses harsh comment and ask random question to Veronika
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Vero jahat banget sih

[WALL POSTING INVOLVED] 026- User wrote a wallpost in the last 3 days that VA can handle
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

[AGENT INVOLVED] 027- User is VVIP and want to connect to agent
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

[AGENT INVOLVED] 028- User is VVIP and want to connect to agent
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

029- User Inquire Active Subscribed Offer
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Paket saya yang aktif apa aja ya?
    Check_VA_response_text    1    Oke M Testaut, setelah Veronika cek, berikut adalah paket aktif yang diaktifkan melalui myTelkomsel Apps dan Veronika untuk nomor handphone +6282110685202 :
    Check_VA_response_text_with_2buttons    2    Apakah Kamu mau mengetahui kuota Kamu saat ini?    Ya    Tidak
    Click_Button_From_Response    2    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    User_input    saya langganan paket apa aja ya?
    Check_VA_response_text    1    Saat ini Veronika hanya bisa menampilkan paket yang diaktifkan di MyTelkomsel apps atau Veronika
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

[X] 030- User inquire for hot offer
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

[X] 031- User perform inquire subscribed main offering, package terms & condition and subscribed offer
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    User_input    priceplan saya apaan ya?
    Check_VA_response_text_with_2buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Oke M Testaut, setelah Veronika cek, saat ini nomor +6282110685202 terdaftar menggunakan PP simPATI Go Discover yang aktif sampai dengan tanggal 22-Desember-2018.
    Check_VA_response_text    1    ${VA_question_1}
    User_input    paket terbaik buat saya apaan ya?
    Check_VA_response_carousel_exists    1
    Click_button_carousel    1    Paket Internet    Pilih
    Check_VA_response_text    1    Oke M Testaut, Veronika menyediakan pilihan paket Paket Internet yang dapat Kamu beli di bawah ini
    Check_VA_response_carousel_exists    2
    Click_button_carousel    2    Paket Internet Seharian 1 GB    Detail
    Check_VA_response_text    1    Berikut adalah syarat & ketentuan untuk Paket Internet Seharian 1 GB
    Check_VA_response_text    2    Paket Internet berlaku untuk 1 hari, dengan kuota :
    Check_VA_response_text    2    1 GB Internet untuk akses internet di jaringan 2G/3G/4G berlaku s.d pukul 23.59
    #Check_VA_response_text    3    1. Paket berlaku hanya untuk pemakaian domestik (tidak berlalu untuk Internasional Roaming yang akan dikenakan biaya terpisah).
    Check_VA_response_text_with_2buttons    4    Apakah Kamu ingin membeli paket tersebut?    Ya    Tidak
    Cancel_and_closing_session

032- Prepaid User ask for Recharge History
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    saya pernah beli pulsa berapa aja?
    Validate_prepaid_number    1
    Check_VA_response_text    1    berikut 3 pembelian pulsa terakhir yang Veronika temukan
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

033- Prepaid User perform Get Invoice Date & Amount
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    saya udah bayar tagihan belum ya bulan ini?
    Check_VA_response_text    1    Pengecekan tagihan hanya dapat dilakukan oleh pelanggan kartuHalo.
    Check_VA_response_text    2    Ada lagi yang bisa Veronika bantu?
    Closing_session

034- Prepaid user who wants to topup using credit card
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_button_carousel    2    Profil Kamu    Beli Pulsa
    Validate_prepaid_number    1
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    silakan pilih salah satu opsi pembayaran di bawah ini.
    Validate_VA_carousel_payment    2
    Click_carousel_button_on_specific_location    2    1    Kartu Kredit
    Pay_with_credit_card    FAIL
    Cancel_and_closing_session

[MANDIRI RELATED] 035- Prepaid user who wants to topup using Mandiri ClickPay
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 036- Prepaid user who wants to topup using PermataNet
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_button_carousel    2    Profil Kamu    Beli Pulsa
    Validate_prepaid_number    1
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    silakan pilih salah satu opsi pembayaran di bawah ini.
    Validate_VA_carousel_payment    2
    Click_button_carousel    2    E-Banking    E-Banking
    Validate_VA_carousel_ebanking    1
    Check_VA_response_text    2    ${VA_question_1}
    Click_button_carousel    1    Bank Permata    Pilih
    #Pay_with_PermataNet    FAIL
    Closing_session

037- Prepaid user who wants top up his credit using TCASH but doesn't have a TCASH account yet
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${email}    ${password}
    User_input    Mau isi pulsa dong
    Check_VA_response_text_with_2buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Oke M Testaut, Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Rp50.000    Berlaku 45 Hari    Pilih
    Validate_carousel_items    2    Rp100.000    Berlaku 60 Hari    Pilih
    Validate_carousel_items    2    Rp150.000    Berlaku 120 Hari    Pilih
    Validate_carousel_items    2    Rp200.000    Berlaku 150 Hari    Pilih
    Validate_carousel_items    2    Rp300.000    Berlaku 180 Hari    Pilih
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_button_carousel    2    Rp50.000    Pilih
    Check_VA_response_text    1    Oke M Testaut, untuk melanjutkan pengisian pulsa sebesar Rp50000, silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_carousel_exists    2
    Validate_VA_carousel_payment    2
    Click_carousel_button_on_specific_location    2    3    TCASH
    Check_VA_response_text    1    Saat ini, Kamu belum terdaftar sebagai pelanggan TCASH. Untuk melanjutkan transaksi ini, silakan pilih cara pembayaran lain di atas
    Check_VA_response_text    2    Ada lagi yang bisa Veronika bantu?
    Closing_session

[TCASH RELATED] 038- Prepaid user who wants top up his credit using TCASH
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[TCASH RELATED] 039- User perform reload using TCASH but has insufficient balance
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[MANDIRI RELATED] 040- Prepaid user who wants to top up using E-Banking (Mandiri ClickPay)
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[MANDIRI RELATED] 041- Prepaid user who wants to top up using E-Banking (PermataNet)
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[TCASH RELATED] 042- Prepaid user who performs top up through TCASH
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 043- Prepaid users who ask about registration status
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 044- Prepaid user who wants to purchase the package that VA offers
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_carousel_button_on_specific_location    2    2    Beli Paket Favorit
    Validate_prepaid_number    1
    Closing_session

[X] 045- User want to see the detail information of ongoing promotion
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 046- User want to see all promotion
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_carousel_button_on_specific_location    2    3    Lihat Semua Promo
    Check_VA_response_text    1    Berikut adalah promosi-promosi menarik dari Telkomsel.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session

[X] 047- Prepaid user who wants to explore the loyalty card
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[POINTASTIC DEALS] 048- User want to know and participate on POINTASTIC DEALS (optional)
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[POINTASTIC DEALS] 049- User want to know and participate on POINTASTIC DEALS (optional)
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 050- User wants to book an appointment at GraPARI
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    User_input    mau bikin janji di grapari
    Check_VA_response_text    1    Kamu sekarang berada dimana? Silakan share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu atau ketik langsung lokasi yang Kamu maksud
    User_input    jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Berikut info GraPARI di sekitar    #Jakarta Selatan ya
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Click_carousel_button_on_specific_location    2    1    Buat Reservasi
    Validate_prepaid_number    1
    Check_VA_response_text    1    Silahkan pilih kebutuhan Kamu
    Validate_VA_carousel_appointment    2
    Click_button_carousel    2    Keluhan dan Informasi    Pilih Layanan
    Check_VA_response_text    1    Teman Veronika, dari agen Telkomsel juga bisa membantu memenuhi kebutuhan Kamu mengenai informasi atau keluhan.
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau disambungkan dengan agen Telkomsel?    Ya    Tidak
    Click_Button_From_Response    2    Tidak
    Check_VA_response_text    1    Kamu mau reservasi untuk kapan?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    4    17:00-21:00 WIB
    Check_VA_response_text    1    Berikut waktu yang bisa Kamu pilih
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    4    20:30-21:00 WIB
    Check_VA_response_text    1    20:30 WIB Layanan: Keluhan dan Informasi Segera konfirmasi detail berikut untuk mendapatkan jadwal yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Apakah detail di atas sudah benar    Ya Benar    Bukan Itu    Batal
    #Click_Button_From_Response    2    Ya Benar

[X] 051- User want to know about detail information about his/her reservation
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 052- Postpaid user wants to change his number (vice versa)
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 053- Postpaid user who has outstanding bill wants to pay his bill
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

054- Postpaid user want to check quota detail information
    [Tags]    Telkomsel_FB_postpaid
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    Greet_VA_Indo    ${VA_GreetPostPaid}
    Click_button_carousel    2    Profil Kamu    Detail Kuota
    Validate_postpaid_number    1
    Check_VA_response_text    1    silakan pilih jenis sisa kuota yang ingin Kamu ketahui
    Validate_VA_carousel_kuota_postpaid    2
    Click_button_carousel    2    SMS    Lihat Kuota SMS
    Check_VA_response_text    1    Berikut sisa kuota SMS Kamu: 1. SMS Tsel
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau membeli paket tambahan?    Ya    Tidak
    Click_Button_From_Response    2    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

[KARTUHALO REGISTRATION] 055- User want to add kartuHalo subscripton
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

056- Postpaid User ask his credit limit
    [Tags]    Telkomsel_FB_postpaid
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    Credit limit saya berapa?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, batas pemakaian domestik Kamu sebesar Rp300.000 perbulan dan roaming sebesar Rp0 perbulan.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[X] 057- Postpaid User ask his credit limit
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[TCARE PIN-PUK] 058- User perform request PIN and PUK
    [Tags]    Telkomsel_FB_postpaid
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}

[X] 059- Postpaid User who has no outstanding bill try to perform pay bill directly on VA and get told that he or she has no bill to pay
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 060- User want to pay his bill but the payment failed for three times
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[MANDIRI RELATED] 061- User perform pay bill using Mandiri ClickPay (2)
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[TCASH RELATED] 062- User perform pay bill using TCASH
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[MANDIRI RELATED] 063- User perform pay bill using PermataNet (2)
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 064- User perform pay bill using credit card
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 065- User perform pay bill using Mandiri ClickPay
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 066- User perform pay bill using PermataNet
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[TCASH RELATED] 067- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

068- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    cara isi ulang tcash gmn ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Validate_VA_carousel_tcash    2
    Click_button_carousel    2    Internet Banking    Lihat Caranya
    Check_VA_response_image    1
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[X] 069- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

070- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    cara isi saldo tcash gimana ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Validate_VA_carousel_tcash    2
    Click_button_carousel    2    GraPARI    Cari GraPARI
    Check_VA_response_text    1    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    User_input    jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Berikut info GraPARI di sekitar    #Jakarta Selatan ya
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session

[X] 071- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[TCASH RELATED] 072- Prepaid Telkomsel User failed to recharge using Tcash and informed how to top up tcash balance
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[X] 073- User wants to know how to Top Up Tcash Balance through Tcash FAQ
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

074- User wants to participate CES in VA - finished
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    Beli Pulsa
    Cancel_and_closing_session
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Closing_session

[AGENT RELATED] 075- User wants to participate CES in Agent - finished
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[AGENT RELATED] 076- User wants to participate CES in Agent - finished
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[AGENT RELATED] 077- User wants to participate CES in Agent - not finished
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[AGENT RELATED] 078- User wants to participate CES in Agent
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}

[x] 084- User want to check his or her last invoice date and amount
    [Tags]    Telkomsel_FB_postpaid
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    Invoice terakhir saya
    Validate_postpaid_number    1
    Check_VA_response_text_with_buttons    1    Veronika perlu tau nih, apakah yang Kamu maksud adalah penggunaan saat ini atau tagihan ?    Penggunaan    Tagihan
    Click_Button_From_Response    1    Tagihan
    Check_VA_response_text    1    Kamu sudah melunasi tagihan Kamu sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

086- User asks for his credit limit
    [Tags]    Telkomsel_FB_postpaid
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    kredit limit saya berapa?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, batas pemakaian domestik Kamu sebesar Rp300.000 perbulan dan roaming sebesar Rp0 perbulan.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[x] 088- User asks about his usage
    [Tags]    Telkomsel_FB_postpaid
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    User_input    berapa usage saya?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, Kamu memiliki pemakaian sementara sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[x] 090- Prepaid user who wants to explore the loyalty card
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_carousel_button_on_specific_location    2    4    Info POINTASTIC DEAL

[x] 092- User Inquire Active Subscribed Offer -- error 503 backend fetch error
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Paket saya yang aktif apa aja ya?
    Validate_prepaid_number    1
    Check_VA_response_text    1    setelah Veronika cek, berikut adalah paket aktif yang diaktifkan melalui myTelkomsel Apps dan Veronika untuk nomor handphone +6282110685202 :
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau mengetahui kuota Kamu saat ini?    Ya    Tidak
    Click_Button_From_Response    2    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    User_input    Saya langganan paket apa aja ya?
    Check_VA_response_text    1    Saat ini Veronika hanya bisa menampilkan paket yang diaktifkan di MyTelkomsel apps atau Veronika
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

094- User want to reload but cancel in the middle of conversation
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    Click_button_carousel    2    Profil Kamu    Beli Pulsa
    Validate_prepaid_number    1
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    silakan pilih salah satu opsi pembayaran di bawah ini.
    Validate_VA_carousel_payment    2
    Click_button_carousel    2    E-Banking    E-Banking
    Validate_VA_carousel_ebanking    1
    Check_VA_response_text    2    ${VA_question_1}
    Click_button_carousel    1    Bank Mandiri    Pilih
    Pay_with_Mandiri_CP    FAIL
    Closing_session

098- User ask something that VA doesn’t understand and directed to FAQ
    [Tags]    Non-Telkomsel_FB
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    ${random_question_sholat}
    Check_VA_response_text    1    ${VA_gives_FAQ}
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    1    Lihat
    Closing_session

110- User wants to perform Send Gift Reload Balance from Prepaid or Postpaid Number to Prepaid Number
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    Validate_prepaid_number    1
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    ${other_prepaid_number}
    Check_VA_response_text_with_buttons    1    Berikut adalah bentuk hadiah yang bisa Kamu berikan ke nomor tujuan Kamu    Beli Pulsa    Beli Paket
    Click_Button_From_Response    1    Beli Pulsa
    Check_VA_response_text    1    berikut adalah nominal pulsa yang bisa Kamu belikan untuk nomor ${other_prepaid_number}
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    silakan pilih salah satu opsi pembayaran di bawah ini.
    Validate_VA_carousel_payment    2
    Click_carousel_button_on_specific_location    2    1    Kartu Kredit
    #This needs to be updated with PASS once credit card details are correct
    Pay_with_credit_card    FAIL
    Closing_session

[x] 114- User wants to perform Send Gift Pay Bill from Postpaid or Prepaid Number to Postpaid Number (Block 3 Status - Voluntary Block)
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau bayar tagihan untuk orang lain
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    ${postpaid_dest_number}
    Check_VA_response_text_with_buttons    1    Berikut adalah bentuk hadiah yang bisa Kamu berikan ke nomor tujuan Kamu    Beli Pulsa    Beli Paket
    Click_Button_From_Response    1    Beli Pulsa
    Check_VA_response_text    1    berikut adalah nominal pulsa yang bisa Kamu belikan untuk nomor ${postpaid_dest_number}
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    silakan pilih salah satu opsi pembayaran di bawah ini.
    Validate_VA_carousel_payment    2

116- User wants to perform Send Gift from Prepaid or Postpaid Number to Prepaid Number
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    Validate_prepaid_number    1
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    0812ABCDEFG
    Check_VA_response_text    1    Maaf, Veronika belum mengerti apa yang Kamu tulis karena masih dalam proses belajar.
    Check_VA_response_text    2    Maaf, yang Kamu tulis tidak dapat Veronika proses. Tolong tulis hanya nomor Telkomsel Kamu saja sesuai format ya (contoh: 08110000000)
    User_input    ${other_prepaid_number}
    Check_VA_response_text_with_buttons    1    Berikut adalah bentuk hadiah yang bisa Kamu berikan ke nomor tujuan Kamu    Beli Pulsa    Beli Paket
    Click_Button_From_Response    1    Beli Pulsa
    Check_VA_response_text    1    berikut adalah nominal pulsa yang bisa Kamu belikan untuk nomor ${other_prepaid_number}
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    silakan pilih salah satu opsi pembayaran di bawah ini.
    Validate_VA_carousel_payment    2
    Click_button_carousel    2    E-Banking    E-Banking
    Validate_VA_carousel_ebanking    1
    Check_VA_response_text    2    ${VA_question_1}
    Click_button_carousel    1    Bank Mandiri    Pilih
    Pay_with_Mandiri_CP    FAIL
    Closing_session

118- User wants to perform Send Gift from Prepaid or Postpaid Number to Prepaid or Postpaid Number
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    Validate_prepaid_number    1
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    ${inactive_number}
    Check_VA_response_text    1    Nomor yang Kamu masukan sudah tidak aktif. Silakan masukan nomor Telkomsel
    Cancel_and_closing_session

126- Prepaid user want to purchase Mobile Legend voucher games
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau beli voucher games
    Check_VA_response_text    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Validate_VA_carousel_voucher_games    2
    Click_button_carousel    2    Mobile Legend    Pilih
    Check_VA_response_text    1    Veronika menyediakan beberapa pilihan Mobile Legend yang bisa Kamu pilih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_button_carousel    2    Diamond ML 5500 19 Diamond    Beli
    Check_VA_response_image    1
    Check_VA_response_text_additional    2    Untuk mengetahui User ID Anda, Silakan Klik menu profile dibagian kiri atas pada menu utama game. Dan user ID akan terlihat dibagian bawah Nama Karakter Game Anda. Silakan masukan User ID dan Zona ID Anda untuk menyelesaikan transaksi. Contoh: Untuk 12345678(1234), maka User ID adalah 12345678 dan Zona ID adalah 1234.
    Check_VA_response_text_additional    3    Tolong ketik User ID Kamu ya
    User_input    57343536
    Check_VA_response_text    1    Tolong ketik Zone ID Kamu ya
    User_input    2090
    Check_VA_response_text_with_buttons    1    Veronika pastikan lagi ya. Kamu ingin membeli Mobile Legend dengan harga Rp5,5k untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Sebentar lagi akan ada SMS dari 99433 yang akan masuk ke nomor handphone Kamu. Ikuti instruksinya ya
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

128- Postpaid user want to purchase Mobile Legend voucher games
    [Tags]    Telkomsel_FB_postpaid
    Login_messenger    ${emailPostpaid}    ${passwordPostpaid}
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    mau beli voucher games
    Check_VA_response_text    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Check_VA_response_carousel_exists    2
    Cancel_and_closing_session

[AGENT RELATED] 130- Block 3 postpaid user want to purchase Mobile Legend voucher games

[x] 132- Prepaid user who has insufficient prepaid balance purchase mobile legend voucher
    [Tags]    Telkomsel_FB
    Login_messenger    ${email}    ${password}
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau beli voucher games
    Check_VA_response_text    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Validate_VA_carousel_voucher_games    2
    Click_button_carousel    2    Mobile Legend    Pilih
    Check_VA_response_text    1    Veronika menyediakan beberapa pilihan Mobile Legend yang bisa Kamu pilih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_button_carousel    2    Diamond ML 5500 19 Diamond    Beli
    Check_VA_response_image    1
    Check_VA_response_text_additional    2    Untuk mengetahui User ID Anda, Silakan Klik menu profile dibagian kiri atas pada menu utama game. Dan user ID akan terlihat dibagian bawah Nama Karakter Game Anda. Silakan masukan User ID dan Zona ID Anda untuk menyelesaikan transaksi. Contoh: Untuk 12345678(1234), maka User ID adalah 12345678 dan Zona ID adalah 1234.
    Check_VA_response_text_additional    3    Tolong ketik User ID Kamu ya
    User_input    57343536
    Check_VA_response_text    1    Tolong ketik Zone ID Kamu ya
    User_input    2090
    Check_VA_response_text_with_buttons    1    Veronika pastikan lagi ya. Kamu ingin membeli Mobile Legend dengan harga Rp5,5k untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Sebentar lagi akan ada SMS dari 99433 yang akan masuk ke nomor handphone Kamu. Ikuti instruksinya ya
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session
