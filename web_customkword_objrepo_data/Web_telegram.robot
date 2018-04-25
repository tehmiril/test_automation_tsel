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
Resource          Custom_keywords/Credit_card_payment_custkeyword.txt
Resource          Telegram/Test_data_user_input_Telegram_Indo.txt
Resource          Telegram/Text_with_buttons_custkeyword_Telegram.txt
Resource          Telegram/Detailed_custkeyword_Telegram.txt
Resource          Telegram/Generic_custkeyword_Telegram.txt
Resource          Telegram/Object_repository_Telegram.txt
Resource          Telegram/Test_data_VA_response_Telegram_Indo.txt
Resource          Telegram/EBanking_payment_custkeyword_Telegram.txt
Resource          Test_data/URL_data.txt
Resource          Object_repository/Payment_pages_object_repo.txt
Resource          Test_data/Test_data_payment.txt

*** Test Cases ***
001 - Non-Telkomsel user who just started talking to VA
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    User_input    Beli Pulsa
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
    Check_VA_response_text    5    ${VA_question_1}
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
    Check_VA_response_text    3    Berikut info GraPARI di sekitar Jakarta Timur ya
    Check_VA_response_text_with_buttons    4    Show GraPARI
    Click_Button_From_Response    4    GraPARI PONDOK BAMBU    NONE    #SETUI    NONE
    Check_VA_response_text_with_buttons    5    Apa lagi yang kamu butuhkan?    Lihat di Google Maps    Buat Reservasi
    Check_VA_response_text    6    ${VA_question_1}
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
    Check_VA_response_text    5    ${VA_question_1}
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
    Check_VA_response_text    5    ${VA_question_1}
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
    Check_VA_response_text    5    ${VA_question_1}
    Click_Button_From_Response    4    NAZWA CELL SELASA    NONE
    Closing_session

[x] 010 - User perform inquire TCASH information
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

[x] 011 - User perform inquire TCASH information
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

[NO FAQ button] 013 - User perform Inquire 4G Upgrade and Find Nearest Store
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_Button_From_Response    2    Bantuan Lainnya    Bantuan Lainnya

014 - User want to search a grapari that opens on a specific day
    [Tags]    Non-Telkomsel_Telegram
    User_input    grapari yang buka di hari minggu di jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Selatan    NONE
    Check_VA_response_text    1    Berikut GraPARI di Jakarta Selatan yang sesuai dengan kondisi Kamu
    Check_VA_response_text_with_buttons    2    Show GraPARI
    Cancel_and_closing_session

015 - User want to buy a starter pack
    [Tags]    Non-Telkomsel_Telegram
    User_input    mau beli perdana
    Check_VA_response_text    1    Kamu bisa mendapatkan perdana Telkomsel di GraPARI maupun di outlet terdekat
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Sydney
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Sydney    NONE
    Check_VA_response_text    3    Mohon maaf, Veronika tidak menemukan adanya outlet Telkomsel di dekat sydney
    Check_VA_response_text    4    ${VA_question_1}
    Closing_session

016 - User want to buy voucher data
    [Tags]    Non-Telkomsel_Telegram
    User_input    mau beli voucher data
    Check_VA_response_text    1    Voucher data bisa Kamu dapatkan di outlet terdekat
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    Sydney
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Sydney    NONE
    Check_VA_response_text    3    Mohon maaf, Veronika tidak menemukan adanya outlet Telkomsel di dekat sydney
    Check_VA_response_text    4    ${VA_question_1}
    Closing_session

017 - User wants to know about voucher information
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau tau info voucher telkomsel
    Check_VA_response_text    1    Telkomsel menyediakan berbagai macam voucher isi ulang sesuai kebutuhan Kamu
    Check_VA_response_text_with_buttons    2    Kamu pake simPATI, Loop, atau Kartu As?    SimPATI    Loop    Kartu As
    Cancel_and_closing_session

[NO FAQ button] 018 - User explore the FAQ menu and read about voucher information
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}

019 - User perform inquire outlet location
    [Tags]    Non-Telkomsel_Telegram
    User_input    beli pulsa 10000
    Check_VA_response_text    1    Saat ini Veronika hanya menyediakan nominal pulsa: 50.000, 100.000, 150.000, 200.000, dan 300.000. Jika Kamu tetap ingin mengisi ulang pulsa dengan nominal yang Kamu mau, Veronika bisa membantu menemukan lokasi GraPARI atau outlet terdekat di tempat Kamu berada#Kamu bisa mengisi ulang pulsa dengan nominal tersebut di GraPARI maupun di outlet terdekat.
    Check_VA_response_text    2    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu facebook yang terletak di daerah bawah layar Kamu
    User_input    jakarta timur
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Timur    NONE
    Check_VA_response_text    3    Veronika menemukan beberapa outlet Telkomsel di sekitar Jakarta Timur yang dapat Kamu kunjungi nih
    Check_VA_response_text_with_buttons    4    Berikut GraPARI dan outlet terdekat di sekitarmu
    Check_VA_response_text    5    ${VA_question_1}
    Click_Button_From_Response    4    NAZWA CELL SELASA    NONE
    Closing_session

[NO FAQ button] 020- User perform setting Caller ID for Apple, Android, Windows Phone, and Blackberry
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}

[DEPRECATED] 021- User complain about his internet connection
    [Tags]    Non-Telkomsel_Telegram

[AGENT INVOLVED] 022 - User complain about his internet service and agree to connect to agent

023- Smalltalk
    [Tags]    Non-Telkomsel_Telegram
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

024- User wants to have a small talk with Veronika
    [Tags]    Non-Telkomsel_Telegram
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak
    Click_Button_From_Response    2    Ya    Ya
    Check_VA_response_text    1    Berikut obrolan menarik yang dapat dipilih untuk mengatasi kebosanan Kamu :)
    Check_VA_response_text_with_buttons    2    Ngobrol dengan Veronika
    Click_Button_From_Response    2    Kuis    NONE
    User_input    ${cancel_answer}
    User_input    aku sedih nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak
    Click_Button_From_Response    2    Ya    Ya
    Click_Button_From_Response    2    Humor    NONE
    Check_VA_response_text_with_buttons    2    Gimana lucu kan humor Veronika? Lihat yang lain lagi yuk    Mau Lihat Lagi    Topik Lain    Sudah Cukup
    Click_Button_From_Response    2    Topik Lain    Topik Lain
    Check_VA_response_text    1    Berikut obrolan menarik yang dapat dipilih agar Kamu tidak sedih lagi :)
    Check_VA_response_text_with_buttons    2    Ngobrol dengan Veronika
    Click_Button_From_Response    2    Travel    NONE
    Check_VA_response_text    2    Apakah Kamu mau lihat yang lain?
    Closing_session

[X] 025- User expresses harsh comment and ask random question to Veronika
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Vero jahat banget sih

[WALL POSTING INVOLVED] 026- User wrote a wallpost in the last 3 days that VA can handle
    [Tags]    Non-Telkomsel_Telegram
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

[AGENT INVOLVED] 027- User is VVIP and want to connect to agent
    [Tags]    Non-Telkomsel_Telegram
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

[AGENT INVOLVED] 028- User is VVIP and want to connect to agent
    [Tags]    Non-Telkomsel_Telegram
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

029- User Inquire Active Subscribed Offer
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Paket saya yang aktif apa aja ya?
    Check_VA_response_text    1    setelah Veronika cek, berikut adalah paket aktif yang diaktifkan melalui myTelkomsel Apps dan Veronika untuk nomor handphone +6282110685202 :
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau mengetahui kuota Kamu saat ini?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    User_input    saya langganan paket apa aja ya?
    Check_VA_response_text    1    Saat ini Veronika hanya bisa menampilkan paket yang diaktifkan di MyTelkomsel apps atau Veronika
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[X] 030- User inquire for hot offer
    [Tags]    Telkomsel_Telegram
    Login_messenger    ${emailNonTsel}    ${passwordNonTsel}
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

031- User perform inquire subscribed main offering, package terms & condition and subscribed offer
    [Tags]    Telkomsel_Telegram
    User_input    priceplan saya apaan ya?
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya    Ya
    Check_VA_response_text    1    setelah Veronika cek, saat ini nomor +6282110685202 terdaftar menggunakan PP simPATI Go Discover yang aktif sampai dengan tanggal 22-Desember-2018.
    Check_VA_response_text    2    ${VA_question_1}
    User_input    paket terbaik buat saya apaan ya?
    Check_VA_response_text_with_buttons    1    Pengelompokkan Paket    BestDeal    Paket Internet
    Click_Button_From_Response    1    Paket Internet    NONE
    Check_VA_response_text    2    Veronika menyediakan pilihan paket Paket Internet yang dapat Kamu beli di bawah ini
    Check_VA_response_text_with_buttons    3    Pilihan Paket
    Check_VA_response_text    4    Silakan lihat keyboard untuk tombol navigasi
    Check_VA_response_text    5    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_Button_From_Response    3    Paket Internet Seharian 1 GB - Rp10Rb    NONE
    Check_VA_response_text    6    Paket Internet berlaku untuk 1 hari, dengan kuota : 1 GB Internet untuk akses internet di jaringan 2G/3G/4G berlaku s.d pukul 23.59
    Check_VA_response_text    7    Harga: Rp10Rb Berlaku: 1 hari
    Check_VA_response_text_with_buttons    8    Paket Pilihan:    Beli    Detail    Lihat Daftar Paket
    Cancel_and_closing_session

032- Prepaid User ask for Recharge History
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    saya pernah beli pulsa berapa aja?
    Check_VA_response_text    1    berikut 3 pembelian pulsa terakhir yang Veronika temukan
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[X] 033- Prepaid User perform Get Invoice Date & Amount
    [Tags]    Telkomsel_Telegram

034- Prepaid user who wants to topup using credit card
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_Button_From_Response    2    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia:    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Beli Pulsa    Beli Pulsa
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_text_with_buttons    2    Voucher Nominal    Rp50.000    Rp100.000    Rp150.000    Rp200.000
    ...    Rp300.000
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_Button_From_Response    2    Rp50.000    NONE
    Check_VA_response_text    4    silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_text_with_buttons    5    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Click_Button_From_Response    5    Kartu Kredit    NONE
    Pay_with_credit_card    FAIL
    Click_Button_From_Response    5    Batalkan    NONE
    Check_VA_response_text    6    Adakah hal lain yang bisa dibantu?
    Check_VA_response_text    7    Silakan pilih salah satu pilihan dibawah ini atau ketik layanan lain yang dibutuhkan
    Closing_session

[MANDIRI RELATED] 035- Prepaid user who wants to topup using Mandiri ClickPay
    [Tags]    Telkomsel_Telegram

[x] 036- Prepaid user who wants to topup using PermataNet
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_Button_From_Response    2    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia:    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Beli Pulsa    Beli Pulsa
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_text_with_buttons    2    Voucher Nominal    Rp50.000    Rp100.000    Rp150.000    Rp200.000
    ...    Rp300.000
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_Button_From_Response    2    Rp50.000    NONE
    Check_VA_response_text    4    silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_text_with_buttons    5    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Click_Button_From_Response    5    E-Banking    NONE
    Check_VA_response_text_with_buttons    6    Pilihan Metode Pembayaran    Bank Mandiri    Bank Permata    Bank Danamon
    Check_VA_response_text    7    ${VA_question_1}
    Click_Button_From_Response    6    Bank Permata    NONE
    #Pay_with_PermataNet    FAIL
    User_input    Tidak
    Closing_session

[X] 037- Prepaid user who wants top up his credit using TCASH but doesn't have a TCASH account yet
    [Tags]    Telkomsel_Telegram

[TCASH RELATED] 038- Prepaid user who wants top up his credit using TCASH
    [Tags]    Telkomsel_Telegram

[TCASH RELATED] 039- User perform reload using TCASH but has insufficient balance
    [Tags]    Telkomsel_Telegram

[MANDIRI RELATED] 040- Prepaid user who wants to top up using E-Banking (Mandiri ClickPay)
    [Tags]    Telkomsel_Telegram

[MANDIRI RELATED] 041- Prepaid user who wants to top up using E-Banking (PermataNet)
    [Tags]    Telkomsel_Telegram

[TCASH RELATED] 042- Prepaid user who performs top up through TCASH
    [Tags]    Telkomsel_Telegram

[X] 043- Prepaid users who ask about registration status
    [Tags]    Non-Telkomsel_Telegram

[X] 044- Prepaid user who wants to purchase the package that VA offers
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_carousel_button_on_specific_location    2    2    Beli Paket Favorit
    Validate_prepaid_number    1
    Closing_session

[X] 045- User want to see the detail information of ongoing promotion
    [Tags]    Non-Telkomsel_Telegram

[X] 046- User want to see all promotion
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_carousel_button_on_specific_location    2    3    Lihat Semua Promo
    Check_VA_response_text    1    Berikut adalah promosi-promosi menarik dari Telkomsel.
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session

[X] 047- Prepaid user who wants to explore the loyalty card
    [Tags]    Non-Telkomsel_Telegram

[POINTASTIC DEALS] 048- User want to know and participate on POINTASTIC DEALS (optional)
    [Tags]    Non-Telkomsel_Telegram

[POINTASTIC DEALS] 049- User want to know and participate on POINTASTIC DEALS (optional)
    [Tags]    Non-Telkomsel_Telegram

[TOO MANY DYNAMIC CONTENTS] 050- User wants to book an appointment at GraPARI
    [Tags]    Telkomsel_Telegram
    User_input    mau bikin janji di grapari
    Check_VA_response_text    1    Kamu sekarang berada dimana? Silakan share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu atau ketik langsung lokasi yang Kamu maksud
    User_input    jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Selatan    NONE
    Check_VA_response_text    3    Berikut GraPARI di Jakarta Selatan yang sesuai dengan kondisi Kamu
    Check_VA_response_text_with_buttons    4    Show GraPARI
    Click_Button_From_Response    4    LOOP STATION MAHAKAM    NONE
    Check_VA_response_text_with_buttons    5    ${VA_question_1}    Lihat di Google Maps    Buat Reservasi
    Check_VA_response_text    6    ${VA_question_1}
    Click_Button_From_Response    5    Buat Reservasi    NONE
    Validate_prepaid_number    7
    Check_VA_response_text    7    Silahkan pilih kebutuhan Kamu
    Check_VA_response_text    8    Pilihan Layanan    Cashier    Keluhan dan Informasi    Aktivasi layanan dan Pasang baru    Batal
    Click_Button_From_Response    8    Keluhan dan Informasi    NONE
    #Validate_prepaid_number    1
    Check_VA_response_text    9    Teman Veronika, dari agen Telkomsel juga bisa membantu memenuhi kebutuhan Kamu mengenai informasi atau keluhan.
    Check_VA_response_text_with_buttons    10    Apakah Kamu mau disambungkan dengan agen Telkomsel?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    Kamu mau reservasi untuk kapan?
    Check_VA_response_text_with_buttons    2    Pilihan Tanggal
    Check_VA_response_text_with_buttons    3    Silakan lihat keyboard untuk tombol navigasi    Berikutnya    Ganti Lokasi    Batal
    Click_button_on_specific_location    2    5    NONE
    Check_VA_response_text    4    Berikut waktu yang bisa Kamu pilih
    Check_VA_response_carousel_exists    2
    Click_carousel_button_on_specific_location    2    4    20:30-21:00 WIB
    Check_VA_response_text    1    20:30 WIB Layanan: Keluhan dan Informasi Segera konfirmasi detail berikut untuk mendapatkan jadwal yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Apakah detail di atas sudah benar    Ya Benar    Bukan Itu    Batal
    #Click_Button_From_Response    2    Ya Benar

[X] 051- User want to know about detail information about his/her reservation
    [Tags]    Non-Telkomsel_Telegram

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

[X] 053- Postpaid user who has outstanding bill wants to pay his bill
    [Tags]    Telkomsel_Telegram_Postpaid

054- Postpaid user want to check quota detail information
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    Click_Button_From_Response    2    Profil Kamu    Profil Kamu
    Check_VA_response_text_with_buttons    1    Berikut informasi yang dapat Veronika berikan terkait dengan Profile Kamu    Sisa Kuota    Tagihan/Pulsa    Info PUK
    Click_Button_From_Response    1    Sisa Kuota    Sisa Kuota
    #Validate_postpaid_number    1
    Check_VA_response_text    1    silakan pilih jenis sisa kuota yang ingin Kamu ketahui
    Check_VA_response_text_with_buttons    2    Jenis Kuota    Internet    SMS    Telepon    Ekstra Pulsa
    Click_Button_From_Response    2    SMS    SMS
    Check_VA_response_text    1    Berikut sisa kuota SMS Kamu: 1. SMS Tsel
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau membeli paket tambahan?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

[KARTUHALO REGISTRATION] 055- User want to add kartuHalo subscripton
    [Tags]    Telkomsel_Telegram_Postpaid

056- Postpaid User ask his credit limit
    [Tags]    Telkomsel_Telegram_Postpaid
    User_input    Credit limit saya berapa?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, batas pemakaian domestik Kamu sebesar Rp300.000 perbulan dan roaming sebesar Rp0 perbulan.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[X] 057- Postpaid User ask his credit limit
    [Tags]    Telkomsel_Telegram_Postpaid

[TCARE PIN-PUK] 058- User perform request PIN and PUK
    [Tags]    Telkomsel_Telegram_Postpaid

[X] 059- Postpaid User who has no outstanding bill try to perform pay bill directly on VA and get told that he or she has no bill to pay
    [Tags]    Telkomsel_Telegram_Postpaid

[X] 060- User want to pay his bill but the payment failed for three times
    [Tags]    Telkomsel_Telegram_Postpaid

[MANDIRI RELATED] 061- User perform pay bill using Mandiri ClickPay (2)
    [Tags]    Telkomsel_Telegram_Postpaid

[TCASH RELATED] 062- User perform pay bill using TCASH
    [Tags]    Telkomsel_Telegram_Postpaid

[MANDIRI RELATED] 063- User perform pay bill using PermataNet (2)
    [Tags]    Telkomsel_Telegram_Postpaid

[X] 064- User perform pay bill using credit card
    [Tags]    Telkomsel_Telegram_Postpaid

[X] 065- User perform pay bill using Mandiri ClickPay
    [Tags]    Telkomsel_Telegram_Postpaid

[X] 066- User perform pay bill using PermataNet
    [Tags]    Telkomsel_Telegram_Postpaid

[TCASH RELATED] 067- User wants to know how to cash in Tcash
    [Tags]    Telkomsel_Telegram_Postpaid

068- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_Telegram
    User_input    cara isi ulang tcash gmn ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    2    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    Click_Button_From_Response    2    Internet Banking    NONE
    Check_VA_response_image    3
    Check_VA_response_text    4    ${VA_question_1}
    Closing_session

[X] 069- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_Telegram

070- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_Telegram
    User_input    cara isi saldo tcash gimana ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    2    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    Click_Button_From_Response    2    GraPARI    NONE
    Check_VA_response_text    3    Tuliskan lokasi yang Kamu cari atau share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu untuk mendapatkan GraPARI terdekat
    User_input    jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_button_on_specific_location    2    1    NONE
    Check_VA_response_text    3    Berikut info GraPARI di sekitar    #Jakarta Selatan ya
    Check_VA_response_text_with_buttons    4    Show GraPARI
    #Check_VA_response_text    5    ${VA_question_1}
    Cancel_and_closing_session

[X] 071- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_Telegram

[TCASH RELATED] 072- Prepaid Telkomsel User failed to recharge using Tcash and informed how to top up tcash balance
    [Tags]    Non-Telkomsel_Telegram

[X] 073- User wants to know how to Top Up Tcash Balance through Tcash FAQ
    [Tags]    Non-Telkomsel_Telegram

074- User wants to participate CES in VA - finished
    [Tags]    Non-Telkomsel_Telegram
    User_input    Beli Pulsa
    Cancel_and_closing_session
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Closing_session

[AGENT RELATED] 075- User wants to participate CES in Agent - finished
    [Tags]    Non-Telkomsel_Telegram

[AGENT RELATED] 076- User wants to participate CES in Agent - finished
    [Tags]    Non-Telkomsel_Telegram

[AGENT RELATED] 077- User wants to participate CES in Agent - not finished
    [Tags]    Non-Telkomsel_Telegram

[AGENT RELATED] 078- User wants to participate CES in Agent
    [Tags]    Non-Telkomsel_Telegram

084- User want to check his or her last invoice date and amount
    [Tags]    Telkomsel_Telegram_Postpaid
    User_input    Invoice terakhir saya
    Validate_postpaid_number    1
    Check_VA_response_text_with_buttons    1    Veronika perlu tau nih, apakah yang Kamu maksud adalah penggunaan saat ini atau tagihan ?    Penggunaan    Tagihan
    Click_Button_From_Response    1    Tagihan    Tagihan
    Check_VA_response_text    1    Kamu sudah melunasi tagihan Kamu sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

086- User asks for his credit limit
    [Tags]    Telkomsel_Telegram_Postpaid
    User_input    kredit limit saya berapa?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, batas pemakaian domestik Kamu sebesar Rp300.000 perbulan dan roaming sebesar Rp0 perbulan.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[x] 088- User asks about his usage
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    berapa usage saya?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, Kamu memiliki pemakaian sementara sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[x] 090- Prepaid user who wants to explore the loyalty card
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_Button_From_Response    2    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia:    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Telkomsel POIN    Telkomsel POIN
    Check_VA_response_text    1    yang berlaku sampai 31 Desember 2018. Poin tersebut bisa langsung Kamu tukarkan dengan penawaran-penawaran berikut:
    Check_VA_response_text_with_buttons    2    Penawaran
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Check_VA_response_text_with_buttons    4    Silakan lihat keyboard untuk tombol navigasi    Semua Penawaran    Pertanyaan Lain
    Click_Button_From_Response    4    Semua Penawaran    Semua Penawaran
    Check_VA_response_text    1    Kamu bisa menukarkan POIN Kamu untuk kategori-kategori berikut:
    Check_VA_response_text_with_buttons    2    Kategori Penukaran
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_Button_From_Response    2    Ecommerce    NONE
    Check_VA_response_text    4    Berikut penawaran Ecommerce yang bisa Kamu tukarkan
    Check_VA_response_text_with_buttons    5    Penawaran
    #Check_VA_response_text_with_buttons    6    Silakan lihat keyboard untuk tombol navigasi    Berikutnya    Kategori Lain
    Click_button_on_specific_location    5    1    NONE
    Check_VA_response_text    7    Silakan pilih opsi di bawah ini    Tukar POIN    Detail    Kembali
    Click_Button_From_Response    7    Tukar POIN    Tukar POIN
    Check_VA_response_text_with_buttons    1    Veronika konfirmasi ya, Kamu akan tukar    Ya    Tidak    Sebelumnya
    Click_Button_From_Response    1    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

[x] 092- User Inquire Active Subscribed Offer
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Paket saya yang aktif apa aja ya?
    Validate_prepaid_number    1
    Check_VA_response_text    1    setelah Veronika cek, berikut adalah paket aktif yang diaktifkan melalui myTelkomsel Apps dan Veronika untuk nomor handphone +6281314415099 :
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau mengetahui kuota Kamu saat ini?    Ya    Tidak
    Click_Button_From_Response    2    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    User_input    Saya langganan paket apa aja ya?
    Check_VA_response_text    1    setelah Veronika cek, berikut adalah paket aktif yang diaktifkan melalui myTelkomsel Apps dan Veronika untuk nomor handphone +6281314415099
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau mengetahui kuota Kamu saat ini?    Ya    Tidak
    Click_Button_From_Response    2    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

094- User want to reload but cancel in the middle of conversation
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_Button_From_Response    2    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia:    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Beli Pulsa    Beli Pulsa
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_text_with_buttons    2    Voucher Nominal    Rp50.000    Rp100.000    Rp150.000    Rp200.000
    ...    Rp300.000
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_Button_From_Response    2    Rp50.000    NONE
    Check_VA_response_text    4    silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_text_with_buttons    5    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Click_Button_From_Response    5    E-Banking    NONE
    Check_VA_response_text_with_buttons    6    Pilihan Metode Pembayaran    Bank Mandiri    Bank Permata    Bank Danamon
    Check_VA_response_text    7    ${VA_question_1}
    Click_Button_From_Response    6    Bank Mandiri    NONE
    Pay_with_Mandiri_CP    FAIL
    Closing_session

098- User ask something that VA doesn’t understand and directed to FAQ
    [Tags]    Non-Telkomsel_Telegram
    User_input    ${random_question_sholat}
    Check_VA_response_text    1    ${VA_gives_FAQ}
    Check_VA_response_text_with_buttons    2    Alternatif Jawaban
    Check_VA_response_text    3    ${VA_question_1}
    Click_button_on_specific_location    2    1    NONE
    Closing_session

[x] 110- User wants to perform Send Gift Reload Balance from Prepaid or Postpaid Number to Prepaid Number
    [Tags]    Telkomsel_Telegram
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

[x] 112- User wants to perform Send Gift Purchase Package from Postpaid (Consumer with Block 1 or Block 2 Status) to Prepaid Number
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    Mau beliin paket buat orang lain
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    ${other_prepaid_number}
    Check_VA_response_text_with_buttons    1    Berikut adalah bentuk hadiah yang bisa Kamu berikan ke nomor tujuan Kamu    Beli Pulsa    Beli Paket
    Cancel_and_closing_session

[x] 114- User wants to perform Send Gift Pay Bill from Postpaid or Prepaid Number to Postpaid Number (Block 3 Status - Voluntary Block)
    [Tags]    Telkomsel_Telegram
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
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    #Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    #Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    0812ABCDEFG
    Check_VA_response_text    1    Maaf, Veronika belum mengerti apa yang Kamu tulis karena masih dalam proses belajar.
    Check_VA_response_text    2    Maaf, yang Kamu tulis tidak dapat Veronika proses. Tolong tulis hanya nomor Telkomsel Kamu saja sesuai format ya (contoh: 08110000000)
    User_input    ${other_prepaid_number}
    Check_VA_response_text_with_buttons    1    Berikut adalah bentuk hadiah yang bisa Kamu berikan ke nomor tujuan Kamu    Beli Pulsa    Beli Paket
    Click_Button_From_Response    1    Beli Pulsa    Beli Pulsa
    Check_VA_response_text    1    berikut adalah nominal pulsa yang bisa Kamu belikan untuk nomor ${other_prepaid_number}
    Check_VA_response_text_with_buttons    2    Voucher Nominal    Rp50.000    Rp100.000    Rp150.000    Rp200.000
    ...    Rp300.000
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_Button_From_Response    2    ${pulsa_amount}    NONE
    Check_VA_response_text    4    untuk melanjutkan pengisian pulsa sebesar Rp50000, silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_text_with_buttons    5    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Click_Button_From_Response    5    E-Banking    NONE
    Check_VA_response_text_with_buttons    6    Pilihan Metode Pembayaran    Bank Mandiri    Bank Permata    Bank Danamon
    Check_VA_response_text    7    ${VA_question_1}
    Click_Button_From_Response    6    Bank Mandiri    NONE
    Pay_with_Mandiri_CP    FAIL
    Closing_session

118- User wants to perform Send Gift from Prepaid or Postpaid Number to Prepaid or Postpaid Number
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    #Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    #Click_Button_From_Response    1    Ya    Ya
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    ${inactive_number}
    Check_VA_response_text    1    Nomor yang Kamu masukan sudah tidak aktif. Silakan masukan nomor Telkomsel
    Cancel_and_closing_session

126- Prepaid user want to purchase Mobile Legend voucher games
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau beli voucher games
    Check_VA_response_text_with_buttons    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Click_Button_From_Response    1    Mobile Legend    Mobile Legend
    Check_VA_response_text    1    Veronika menyediakan beberapa pilihan Mobile Legend yang bisa Kamu pilih
    Check_VA_response_text_with_buttons    2    Pilih Kategori
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    #Check_VA_response_text_with_buttons    4    Silakan lihat keyboard untuk tombol navigasi    Berikutnya    Kategori Lain
    #Click_Button_From_Response    2    Diamond ML 5500 19 Diamond    NONE
    Click_button_on_specific_location    2    4    NONE
    Check_VA_response_text    5    19 Diamond Mobile Legends seharga Rp 5,500 (sudah termasuk PPN). Diamond bisa digunakan untuk membeli Hero atau Skin favorit kamu.
    Check_VA_response_text    6    Harga: 5500
    Check_VA_response_text_with_buttons    7    Paket Pilihan:    Beli    Detail    Lihat Daftar Voucher
    Click_Button_From_Response    7    Beli    Beli
    Check_VA_response_image    1
    Check_VA_response_text    2    Untuk mengetahui User ID Anda, Silakan Klik menu profile dibagian kiri atas pada menu utama game. Dan user ID akan terlihat dibagian bawah Nama Karakter Game Anda. Silakan masukan User ID dan Zona ID Anda untuk menyelesaikan transaksi. Contoh: Untuk 12345678(1234), maka User ID adalah 12345678 dan Zona ID adalah 1234.
    Check_VA_response_text    3    Tolong ketik User ID Kamu ya
    User_input    57343536
    Check_VA_response_text    1    Tolong ketik Zone ID Kamu ya
    User_input    2090
    Check_VA_response_text_with_buttons    1    Veronika pastikan lagi ya. Kamu ingin membeli Mobile Legend dengan harga Rp5,5k untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya    Ya
    Check_VA_response_text    1    Sebentar lagi akan ada SMS dari 99433 yang akan masuk ke nomor handphone Kamu. Ikuti instruksinya ya
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

128- Postpaid user want to purchase Mobile Legend voucher games
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    mau beli voucher games
    Check_VA_response_text_with_buttons    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Cancel_and_closing_session

[AGENT RELATED] 130- Block 3 postpaid user want to purchase Mobile Legend voucher games

[x] 132- Prepaid user who has insufficient prepaid balance purchase mobile legend voucher
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau beli voucher games
    Check_VA_response_text    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Validate_VA_carousel_voucher_games    2
    Click_button_carousel    2    Mobile Legend    Pilih
    Check_VA_response_text    1    Veronika menyediakan beberapa pilihan Mobile Legend yang bisa Kamu pilih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_button_carousel    2    Diamond ML 82500 275 Diamond    Beli
    Check_VA_response_text_with_buttons    1    Setelah Veronika cek, pulsa Kamu tidak mencukupi untuk pembelian voucher ini. Apakah kamu mau mengisi pulsa atau memilih paket lainnya?    Isi Pulsa    Pilih Voucher Lainnya
    Click_Button_From_Response    1    Pilih Voucher Lainnya
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

[x] 134- Prepaid user who wants to topup using E-Banking (Danamon)
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
    Click_button_carousel    1    Bank Danamon    Pilih
    #Pay_with_Danamon    FAIL
    Closing_session
