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
Resource          Telegram/Credit_card_payment_custkeyword.txt
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
001- Non-Telkomsel user who just started talking to VA
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    User_input    Beli Pulsa
    Cancel_and_closing_session

002- Non-Telkomsel who wants to explore VA
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Click_Button_From_Response    1    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia: :)    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Beli Pulsa    Beli Pulsa
    Check_VA_response_text    1    Agar permintaan Kamu dapat diproses lebih lanjut, tolong tulis nomor Telkomsel Kamu yang valid ya (contoh: 08110000000)
    Cancel_and_closing_session

003- Telegram user wants to explore VA
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Click_Button_From_Response    1    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia: :)    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Telkomsel POIN    Telkomsel POIN
    Check_VA_response_text    1    Agar permintaan Kamu dapat diproses lebih lanjut, tolong tulis nomor Telkomsel Kamu yang valid ya (contoh: 08110000000)
    Cancel_and_closing_session

004- Non-Telkomsel user who greets VA for the first time and explore VA
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Click_Button_From_Response    1    Jelajahi Produk Telkomsel    Jelajahi Produk Telkomsel
    Check_VA_response_text_with_buttons    1    Berikut jenis informasi yang bisa Veronika berikan untuk Kamu    Beralih ke Telkomsel    Produk untuk Kamu    Layanan digital
    Click_Button_From_Response    1    Beralih ke Telkomsel    NONE
    Check_VA_response_text_with_buttons    2    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    2    SimPATI    SimPATI
    Check_VA_response_text_with_buttons    1    Berikut adalah informasi tentang produk SimPATI    Info SimPATI Combo    Perdana SimPATI    Beli sekarang
    Click_Button_From_Response    1    Info SimPATI Combo    NONE
    User_input    ${cancel_answer}
    Check_VA_response_text    1    ${VA_cancel}
    Check_VA_response_text    2    ${VA_question_1}
    User_input    perdana yang cocok buat saya
    Check_VA_response_text    1    Oke, Veronika bantu carikan produk Telkomsel yang cocok buat Kamu ya
    Check_VA_response_text_with_buttons    2    Sebelumnya, tolong jawab 3 pertanyaan singkat berikut ini    Mulai    Lihat Semua Produk
    Click_Button_From_Response    2    Lihat Semua Produk    Lihat Semua Produk
    Check_VA_response_text_with_buttons    1    Pilihan yang tepat! Kamu bisa beralih ke produk Telkomsel di bawah ini    SimPATI    Kartu As    Loop    kartuHalo
    Click_Button_From_Response    1    Loop    Loop
    Click_Button_From_Response    1    Info Loop Cash    NONE
    Click_Button_From_Response    1    Perdana Loop    NONE
    Check_VA_response_image    2
    Check_VA_response_text    3    Kamu bisa cari tahu lebih lanjut di
    Check_VA_response_text_with_buttons    4    Apakah Kamu ingin membeli kartu perdana Loop tersebut?    Ya    Tidak
    Click_Button_From_Response    4    Ya    Ya
    Check_VA_response_text    1    Silakan tulis lokasi Kamu saat ini, atau share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu
    User_input    jakarta selatan
    Check_VA_response_text    1    Silakan pilih lokasi yang Kamu inginkan
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_button_on_specific_location    1    1    NONE
    Check_VA_response_text    3    Veronika menemukan beberapa outlet Telkomsel di sekitar Jakarta Selatan yang dapat Kamu kunjungi nih
    Check_VA_response_text_with_buttons    4    Berikut GraPARI dan outlet terdekat di sekitarmu
    Check_VA_response_text    5    ${VA_question_1}
    Closing_session

005- Non-Telkomsel user who is wondering about Telkomsel products
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

006- Non-Telkomsel user who is interested in using KartuHalo
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

007- Non-Telkomsel user who wants to know about KartuAs
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

008- Non-Telkomsel user who wants to know about SimPATI
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

009- Non-Telkomsel user who wants to know about Loop
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

010- User perform inquire TCASH information
    [Tags]    Telkomsel_Telegram
    User_input    TCASH itu apaan sih?
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_text_with_buttons    2    TCASH info    Dapatkan di GraPARI    Pesan Sticker    Promo TCASH    Merchant TCASH
    ...    TCASH FAQ    Pertanyaan Lain
    User_input    keuntungan tcash
    Check_VA_response_image    1
    Check_VA_response_text_with_buttons    2    Apa Kamu mau tahu lebih banyak tentang TCASH?    Ya    Tidak
    User_input    bedanya tcash basic sama full service
    Check_VA_response_image    1
    Check_VA_response_text    2    ${VA_question_1}
    User_input    tcash info
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_text_with_buttons    2    TCASH info    Dapatkan di GraPARI    Pesan Sticker    Promo TCASH    Merchant TCASH
    ...    TCASH FAQ    Pertanyaan Lain
    Click_Button_From_Response    2    Promo TCASH    NONE
    Click_Button_From_Response    2    Pesan Sticker    NONE
    Cancel_and_closing_session

011- User perform inquire TCASH information
    [Tags]    Telkomsel_Telegram
    User_input    cara aktifkan tcash
    Check_VA_response_text    1    TCASH dapat dinikmati oleh seluruh pelanggan Telkomsel baik pascabayar (kartuHalo) maupun prabayar (simPATI, Kartu As, dan Loop). Tekan *800*88*6DigitPIN# di HP Kamu. Untuk pengguna baru, tentukan 6 digit PIN Kamu sendiri.
    Check_VA_response_text    2    ${VA_question_1}
    User_input    cara isi ulang tcash
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    2    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    User_input    saya lupa pin tcash
    Check_VA_response_text    1    Kamu dapat mendatangi GraPARI terdekat atau hubungi Call Centre 188 untuk mengajukan reset PIN TCASH. Pelanggan Basic Service akan diupgrade menjadi Full Service agar dapat melakukan reset PIN.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

012- User want to have a 4G card and order it online
    [Tags]    Telkomsel_Telegram
    User_input    gimana caranya dapat sim card 4g
    Check_VA_response_text_with_buttons    1    Untuk upgrade ke kartu SIM 4G, ganti kartu SIM lama Kamu dengan kartu SIM 4G ya. Pergantian kartu tidak akan mengubah nomor Telkomsel Kamu. Berikut adalah beberapa cara untuk mendapatkannya:    MyGraPARI Terdekat    GraPARI Terdekat    Registrasi Online
    Click_Button_From_Response    1    MyGraPARI Terdekat    NONE
    Closing_session

[NO FAQ button] 013- User perform Inquire 4G Upgrade and Find Nearest Store
    [Tags]    NA
    Greet_VA_Indo    ${VA_Greet1}
    Click_Button_From_Response    2    Bantuan Lainnya    Bantuan Lainnya

014- User want to search a grapari that opens on a specific day
    [Tags]    Non-Telkomsel_Telegram
    User_input    grapari yang buka di hari minggu di jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_Button_From_Response    2    Jakarta Selatan    NONE
    Check_VA_response_text    1    Berikut GraPARI di Jakarta Selatan yang sesuai dengan kondisi Kamu
    Check_VA_response_text_with_buttons    2    Show GraPARI
    Cancel_and_closing_session

015- User want to buy a starter pack
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

016- User want to buy voucher data
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

017- User wants to know about voucher information
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau tau info voucher telkomsel
    Check_VA_response_text    1    Telkomsel menyediakan berbagai macam voucher isi ulang sesuai kebutuhan Kamu
    Check_VA_response_text_with_buttons    2    Kamu pake simPATI, Loop, atau Kartu As?    SimPATI    Loop    Kartu As
    Cancel_and_closing_session

[NO FAQ button] 018- User explore the FAQ menu and read about voucher information
    [Tags]    NA
    Greet_VA_Indo    ${VA_Greet1}

019- User perform inquire outlet location
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

020- User perform setting Caller ID for Apple, Android, Windows Phone, and Blackberry
    [Tags]    Telkomsel_Telegram
    User_input    info konfigurasi
    Check_VA_response_text_with_buttons    1    Berikut Veronika berikan jenis konfigurasi yang bisa Kamu pilih ya    Refresh Jaringan    Setting APN    Pengaturan Pusat SMS    Pengaturan Caller ID
    ...    Pengalihan Panggilan    Fixed Dial Number
    Click_Button_From_Response    1    Pengaturan Caller ID    Pengaturan Caller ID
    Check_VA_response_text_with_buttons    1    Untuk membantu Kamu terkait hal ini, silakan pilih salah satu ya    Apple    Android    Windows Phone    Blackberry
    Click_Button_From_Response    1    Apple    Apple
    Check_VA_response_text    1    Veronika pandu ya Untuk pengaturan Caller ID di handphone Apple, Kamu bisa ikuti langkah-langkah berikut:
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
    [Tags]    NA

[AGENT INVOLVED] 022- User complain about his internet service and agree to connect to agent
    [Tags]    NA

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
    #Check_VA_response_text_with_buttons    2    Gimana lucu kan humor Veronika? Lihat yang lain lagi yuk    Mau Lihat Lagi    Topik Lain    Sudah Cukup
    Click_Button_From_Response    2    Topik Lain    Topik Lain
    Check_VA_response_text    1    Berikut obrolan menarik yang dapat dipilih agar Kamu tidak sedih lagi :)
    Check_VA_response_text_with_buttons    2    Ngobrol dengan Veronika
    Click_Button_From_Response    2    Travel    NONE
    Sleep    3s
    Click_Button_From_Response    2    Sudah Cukup    Sudah Cukup
    Closing_session

[X] 025- User expresses harsh comment and ask random question to Veronika
    [Tags]    NA
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Vero jahat banget sih

[WALL POSTING INVOLVED] 026- User wrote a wallpost in the last 3 days that VA can handle
    [Tags]    NA
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

[AGENT INVOLVED] 027- User is VVIP and want to connect to agent
    [Tags]    NA
    User_input    aku bosan nih
    Check_VA_response_text    1    @{randomBoredIndo}
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau?    Ya    Tidak

[AGENT INVOLVED] 028- User is VVIP and want to connect to agent
    [Tags]    NA
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

030- User inquire for hot offer
    [Tags]    Telkomsel_Telegram
    User_input    mau lihat internet promo
    Check_VA_response_text    1    Berikut adalah promosi-promosi menarik dari Telkomsel.
    Check_VA_response_text_with_buttons    2    Promosi Saat Ini
    Click_button_on_specific_location    2    1    NONE
    Check_VA_response_text    4    ${VA_question_1}
    Click_Button_From_Response    3    Detail Promosi    NONE
    Closing_session

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

033- Prepaid User perform Get Invoice Date & Amount
    [Tags]    Telkomsel_Telegram
    User_input    Saya udah bayar tagihan belum ya bulan ini?
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya    Ya
    Check_VA_response_text    1    Pengecekan tagihan hanya dapat dilakukan oleh pelanggan kartuHalo.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

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
    Click_Button_From_Response    2    Rp150.000    NONE
    Check_VA_response_text    4    silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_text_with_buttons    5    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Click_Button_From_Response    5    Kartu Kredit    NONE
    Pay_with_credit_card    FAIL    details
    Click_Button_From_Response    5    Batalkan    NONE
    Check_VA_response_text    6    Adakah hal lain yang bisa dibantu?
    Check_VA_response_text    7    Silakan pilih salah satu pilihan dibawah ini atau ketik layanan lain yang dibutuhkan
    Closing_session

035- Prepaid user who wants to topup using Mandiri ClickPay
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
    Pay_with_Mandiri_CP    PREPAID    FAIL
    Closing_session

[USE CAPTCHA] 036- Prepaid user who wants to topup using PermataNet
    [Tags]    NA
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

037- Prepaid user who wants top up his credit using TCASH but doesn't have a TCASH account yet
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau isi pulsa dong
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_text_with_buttons    2    Voucher Nominal    Rp50.000    Rp100.000    Rp150.000    Rp200.000
    ...    Rp300.000
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_Button_From_Response    2    Rp50.000    NONE
    Check_VA_response_text    4    silakan pilih salah satu opsi pembayaran di bawah ini.
    Check_VA_response_text_with_buttons    5    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Click_Button_From_Response    5    TCASH    NONE
    Check_VA_response_text    1    Saat ini, Kamu belum terdaftar sebagai pelanggan TCASH. Untuk melanjutkan transaksi ini, silakan pilih cara pembayaran lain di atas
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[TCASH RELATED] 038- Prepaid user who wants top up his credit using TCASH
    [Tags]    NA

[TCASH RELATED] 039- User perform reload using TCASH but has insufficient balance
    [Tags]    NA

[MANDIRI RELATED] 040- Prepaid user who wants to top up using E-Banking (Mandiri ClickPay)
    [Tags]    NA

[USE CAPTCHA] 041- Prepaid user who wants to top up using E-Banking (PermataNet)
    [Tags]    NA

[TCASH RELATED] 042- Prepaid user who performs top up through TCASH
    [Tags]    NA

043- Prepaid users who ask about registration status
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    apa aku udah registrasi?
    Check_VA_response_text    1    Kamu bisa melihat status registrasi kartu prabayar dengan menghubungi *444# Kamu tetap bisa menghubungi nomor tersebut meskipun nomor Kamu sudah terblokir
    Check_VA_response_text    2    ${VA_question_1}
    #Click_URL    check_prepaid
    User_input    Ya
    #Check_VA_response_text    1    selamat datang di GraPARI Virtual Telkomsel. Ada yang bisa Veronika bantu hari ini?
    Check_VA_response_text_with_buttons    1    Silakan pilih salah satu pilihan dibawah ini atau ketik layanan lain yang dibutuhkan
    Click_Button_From_Response    1    Profil Kamu    Profil Kamu
    Check_VA_response_text_with_buttons    1    Berikut informasi yang dapat Veronika berikan terkait dengan Profile Kamu
    Click_Button_From_Response    1    Sisa Kuota    Sisa Kuota
    Check_VA_response_text    1    silakan pilih jenis sisa kuota yang ingin Kamu ketahui untuk +6282110685202
    Check_VA_response_text_with_buttons    2    Jenis Kuota    Internet    SMS    Telepon    Ekstra Pulsa
    Click_Button_From_Response    2    Internet    Internet
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau membeli paket tambahan?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    User_input    Lihat Menu Utama
    Check_VA_response_text    1    selamat datang di GraPARI Virtual Telkomsel. Ada yang bisa Veronika bantu hari ini?
    Check_VA_response_text_with_buttons    2    Silakan pilih salah satu pilihan dibawah ini atau ketik layanan lain yang dibutuhkan
    Click_Button_From_Response    2    Beli Paket dan Tukar POIN    Beli Paket dan Tukar POIN
    Check_VA_response_text_with_buttons    1    Berikut pilihan layanan yang tersedia:    Beli Pulsa    Beli Paket    Telkomsel POIN
    Click_Button_From_Response    1    Beli Pulsa    Beli Pulsa
    Check_VA_response_text    1    Kamu bisa memilih nominal pulsa dibawah ini.
    Check_VA_response_text_with_buttons    2    Voucher Nominal    Rp50.000    Rp100.000    Rp150.000    Rp200.000
    ...    Rp300.000
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Cancel_and_closing_session

[X] 044- Prepaid user who wants to purchase the package that VA offers
    [Tags]    IP
    Greet_VA_Indo    ${VA_Greet1}
    Click_carousel_button_on_specific_location    2    2    Beli Paket Favorit
    Validate_prepaid_number    1
    Closing_session

[X] 045- User want to see the detail information of ongoing promotion
    [Tags]    IP

046- User want to see all promotion
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    Click_Button_From_Response    1    Promosi    Promosi
    Check_VA_response_text    1    Berikut adalah promosi-promosi menarik dari Telkomsel.
    Check_VA_response_text_with_buttons    2    Promosi Saat Ini
    Cancel_and_closing_session

[X] 047- Prepaid user who wants to explore the loyalty card
    [Tags]    IP

[POINTASTIC DEALS] 048- User want to know and participate on POINTASTIC DEALS (optional)
    [Tags]    IP

[POINTASTIC DEALS] 049- User want to know and participate on POINTASTIC DEALS (optional)
    [Tags]    IP

[x] 050- User wants to book an appointment at GraPARI
    [Tags]    IP
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau bikin janji di grapari
    Check_VA_response_text    1    Kamu sekarang berada dimana? Silakan share location Kamu menggunakan tombol menu telegram yang terletak di daerah bawah layar Kamu atau ketik langsung lokasi yang Kamu maksud
    User_input    jakarta selatan
    Check_VA_response_text    1    Lokasi GraPARI sekitar mana yang Kamu maksud?
    Check_VA_response_text_with_buttons    2    Lokasi yang Veronika temukan:
    Click_button_on_specific_location    2    1    NONE
    Check_VA_response_text    3    Berikut GraPARI di Jakarta Selatan yang sesuai dengan kondisi Kamu
    Check_VA_response_text_with_buttons    4    Show GraPARI
    Click_button_on_specific_location    4    1    NONE
    Check_VA_response_text_with_buttons    5    ${VA_question_1}    Lihat di Google Maps    Buat Reservasi
    Check_VA_response_text    6    ${VA_question_1}
    Click_Button_From_Response    5    Buat Reservasi    NONE
    Check_VA_response_text    7    Silahkan pilih kebutuhan Kamu
    Check_VA_response_text_with_buttons    8    Pilihan Layanan    Cashier    Keluhan dan Informasi    Aktivasi layanan dan Pasang Baru    Batal
    Click_Button_From_Response    8    Keluhan dan Informasi    NONE
    Check_VA_response_text    9    Teman Veronika, dari agen Telkomsel juga bisa membantu memenuhi kebutuhan Kamu mengenai informasi atau keluhan.
    Check_VA_response_text_with_buttons    10    Apakah Kamu mau disambungkan dengan agen Telkomsel?    Ya    Tidak
    Click_Button_From_Response    10    Tidak    Tidak
    Check_VA_response_text    1    Kamu mau reservasi untuk kapan?
    Check_VA_response_text_with_buttons    2    Pilihan Tanggal
    #Check_VA_response_text_with_buttons    3    Silakan lihat keyboard untuk tombol navigasi    Berikutnya    Ganti Lokasi    Batal
    Click_button_on_specific_location    2    5    NONE
    Check_VA_response_text_with_buttons    4    Pilihan Slot Waktu
    Click_button_on_specific_location    4    3    NONE
    Check_VA_response_text    5    Berikut waktu yang bisa Kamu pilih
    Check_VA_response_text_with_buttons    6    Pilihan Waktu
    Click_button_on_specific_location    6    8    NONE
    Check_VA_response_text    8    Layanan: Keluhan dan Informasi Segera konfirmasi detail berikut untuk mendapatkan jadwal yang Kamu inginkan
    Check_VA_response_text_with_buttons    9    Apakah detail di atas sudah benar    Ya Benar    Bukan Itu    Batal
    #Click_Button_From_Response    2    Ya Benar

[X] 051- User want to know about detail information about his/her reservation
    [Tags]    IP

052- Postpaid user wants to change his number (vice versa)
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

053- Postpaid user who has outstanding bill wants to pay his bill
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    Click_Button_From_Response    2    Profil Kamu    Profil Kamu
    Check_VA_response_text_with_buttons    1    Berikut informasi yang dapat Veronika berikan terkait dengan Profile Kamu    Sisa Kuota    Tagihan/Pulsa    Info PUK
    Click_Button_From_Response    1    Tagihan/Pulsa    Tagihan/Pulsa
    Check_VA_response_text_with_buttons    1    Berikut jenis informasi yang bisa Veronika berikan untuk Kamu.    Info Tagihan    Info Sisa Pulsa
    Click_Button_From_Response    1    Info Tagihan    Info Tagihan
    Check_VA_response_text_with_buttons    1    Veronika perlu tau nih, apakah yang Kamu maksud adalah penggunaan saat ini atau tagihan ?    Penggunaan    Tagihan
    Click_Button_From_Response    1    Tagihan    Tagihan
    Check_VA_response_text    1    Total tagihan Kamu adalah sebesar
    Check_VA_response_text_with_buttons    2    Apakah Kamu ingin melanjutkan ke pembayaran?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    User_input    pemakaian saya
    Check_VA_response_text    1    Setelah Veronika cek, Kamu memiliki pemakaian sementara sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

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
    [Tags]    IP

056- Postpaid User ask his credit limit
    [Tags]    Telkomsel_Telegram_Postpaid
    User_input    Credit limit saya berapa?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, batas pemakaian domestik Kamu sebesar Rp300.000 perbulan dan roaming sebesar Rp0 perbulan.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

057- User perform request PIN and PUK
    [Tags]    Telkomsel_Telegram
    User_input    pin tcare aku berapa?
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya    Ya
    Check_VA_response_text    1    PIN T-care untuk nomor handphone +6282110685202 akan Veronika kirimkan melalui SMS
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

058- User perform request PIN and PUK
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    riwayat pembayaran
    Check_VA_response_text    1    berikut 3 pembayaran terakhir yang Veronika temukan untuk nomor +6281314415099 :
    Check_VA_response_text    2    ${VA_question_1}
    User_input    lihat menu utama
    Check_VA_response_text_with_buttons    2    Silakan pilih salah satu pilihan dibawah ini atau ketik layanan lain yang dibutuhkan
    Click_Button_From_Response    2    Profil Kamu    Profil Kamu
    Check_VA_response_text_with_buttons    1    Berikut informasi yang dapat Veronika berikan terkait dengan Profile Kamu    Sisa Kuota    Tagihan/Pulsa    Info PUK
    Click_Button_From_Response    1    Info PUK    Info PUK
    Check_VA_response_text    1    Untuk mendapatkan PUK untuk nomor handphone Kamu, Veronika membutuhkan verifikasi lebih lanjut.
    Check_VA_response_text_with_buttons    2    Pilih verifikasi menggunakan PIN T-Care atau 3 nomor yang dihubungi satu bulan terakhir. Jika nomor Kamu terblokir, verifikasi pilihan kedua sangat disarankan    PIN T-Care    Nomor Telepon
    Click_Button_From_Response    2    PIN T-Care    PIN T-Care
    Check_VA_response_text    1    Silakan masukkan PIN T-Care Kamu ya. Jika kamu belum memiliki PIN T-Care silakan ketik "PIN" kirim SMS ke 111 (kartuHalo) atau 116 (simPATI, KARTU As, LOOP)
    Check_VA_response_text    2    Kamu bisa ketik 'batal' jika Kamu tidak lagi membutuhkan informasi PUK
    User_input    ${PIN_TCARE_postpaid}
    Check_VA_response_text    1    ${VA_verify_PUK_postpaid}
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

059- Postpaid User who has no outstanding bill try to perform pay bill directly on VA and get told that he or she has no bill to pay
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    mau bayar tagihan
    Check_VA_response_text    1    Kamu sudah melunasi tagihan Kamu sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

060- User want to pay his bill but the payment failed for three times
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    mau bayar tagihan
    Check_VA_response_text    1    Total tagihan Kamu adalah sebesar
    Check_VA_response_text_with_buttons    2    Apakah Kamu ingin melanjutkan ke pembayaran?    Ya    Tidak
    Click_Button_From_Response    2    Ya    Ya
    Check_VA_response_text_with_buttons    1    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Check_VA_response_text    2    Sebagai alternatif, Kamu juga dapat membayar tagihan melalui MyTelkomsel, MyGraPARI, ATM, GraPARI, dan Kantor POS.
    Click_Button_From_Response    1    Kartu Kredit    NONE
    Pay_with_credit_card    FAIL    NONE
    Check_VA_response_text    3    Maaf, pembayaran Kamu gagal, apakah Kamu ingin mencoba kembali?
    User_input    Ya
    Check_VA_response_text_with_buttons    1    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Check_VA_response_text    2    Sebagai alternatif, Kamu juga dapat membayar tagihan melalui MyTelkomsel, MyGraPARI, ATM, GraPARI, dan Kantor POS.
    Click_Button_From_Response    1    Kartu Kredit    NONE
    Pay_with_credit_card    FAIL    NONE
    Check_VA_response_text    3    Maaf, pembayaran Kamu gagal, apakah Kamu ingin mencoba kembali?
    User_input    Ya
    Check_VA_response_text_with_buttons    1    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Check_VA_response_text    2    Sebagai alternatif, Kamu juga dapat membayar tagihan melalui MyTelkomsel, MyGraPARI, ATM, GraPARI, dan Kantor POS.
    Click_Button_From_Response    1    Kartu Kredit    NONE
    Pay_with_credit_card    FAIL    NONE
    Check_VA_response_text    3    Kamu sudah 3 kali gagal melakukan pembayaran. Kamu juga bisa melakukan pembayaran kartuHalo melalui MyTelkomsel, MyGrapari, ATM, GraPARI, atau Kantor POS.
    Check_VA_response_text    4    ${VA_question_1}
    Closing_session

061- User perform pay bill using Mandiri ClickPay (2)
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    Click_Button_From_Response    2    Profil Kamu    Profil Kamu
    Check_VA_response_text_with_buttons    1    Berikut informasi yang dapat Veronika berikan terkait dengan Profile Kamu    Sisa Kuota    Tagihan/Pulsa    Info PUK
    Click_Button_From_Response    1    Tagihan/Pulsa    Tagihan/Pulsa
    Check_VA_response_text_with_buttons    1    Berikut jenis informasi yang bisa Veronika berikan untuk Kamu.    Info Tagihan    Info Sisa Pulsa
    Click_Button_From_Response    1    Info Tagihan    Info Tagihan
    Check_VA_response_text_with_buttons    1    Veronika perlu tau nih, apakah yang Kamu maksud adalah penggunaan saat ini atau tagihan ?    Penggunaan    Tagihan
    Click_Button_From_Response    1    Tagihan    Tagihan
    Check_VA_response_text    1    Total tagihan Kamu adalah sebesar
    Check_VA_response_text_with_buttons    2    Apakah Kamu ingin melanjutkan ke pembayaran?    Ya    Tidak
    Click_Button_From_Response    2    Ya    Ya
    Check_VA_response_text_with_buttons    1    Pilihan Metode Pembayaran    Kartu Kredit    E-Banking    TCASH    Batalkan
    Check_VA_response_text    2    Sebagai alternatif, Kamu juga dapat membayar tagihan melalui MyTelkomsel, MyGraPARI, ATM, GraPARI, dan Kantor POS.
    Click_Button_From_Response    1    E-Banking    NONE
    Check_VA_response_text_with_buttons    3    Pilihan Metode Pembayaran    Bank Mandiri    Bank Permata    Bank Danamon
    Check_VA_response_text    4    ${VA_question_1}
    Click_Button_From_Response    3    Bank Mandiri    NONE
    Pay_with_Mandiri_CP    POSTPAID    FAIL
    Closing_session

[TCASH RELATED] 062- User perform pay bill using TCASH
    [Tags]    NA

[USE CAPTCHA] 063- User perform pay bill using PermataNet (2)
    [Tags]    NA

[X] 064- User perform pay bill using credit card
    [Tags]    IP

[MANDIRI RELATED] 065- User perform pay bill using Mandiri ClickPay
    [Tags]    NA

[USE CAPTCHA] 066- User perform pay bill using PermataNet
    [Tags]    NA

067- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_Telegram
    User_input    cara isi ulang tcash gmn ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    2    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    Click_Button_From_Response    2    Mobile Banking    NONE
    Check_VA_response_image    3
    Check_VA_response_text    4    ${VA_question_1}
    Closing_session

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

069- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_Telegram
    User_input    cara isi ulang tcash gmn ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    2    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    Click_Button_From_Response    2    ATM Bersama    NONE
    Check_VA_response_image    3
    Check_VA_response_text    4    ${VA_question_1}
    Closing_session

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

071- User wants to know how to cash in Tcash
    [Tags]    Non-Telkomsel_Telegram
    User_input    cara isi saldo tcash gimana ya?
    Check_VA_response_text    1    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    2    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    Click_Button_From_Response    2    Retail Store    NONE
    Check_VA_response_text    1    Kamu bisa isi saldo di toko retail seperti Alfamart dan Indomaret melalui bantuan kasir
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[TCASH RELATED] 072- Prepaid Telkomsel User failed to recharge using Tcash and informed how to top up tcash balance
    [Tags]    NA

073- User wants to know how to Top Up Tcash Balance through Tcash FAQ
    [Tags]    Non-Telkomsel_Telegram
    Greet_VA_Indo    ${VA_GreetNonTsel}
    User_input    tcash apaan sih min
    Check_VA_response_text    1    TCASH adalah layanan uang elektronik dari Telkomsel yang telah mendapatkan izin dari Bank Indonesia. Berbeda dengan pulsa, TCASH dapat digunakan untuk bayar tagihan, bayar merchant, isi pulsa, kirim uang, dan banyak lagi.
    Check_VA_response_text_with_buttons    2    TCASH info    Dapatkan di GraPARI    Pesan Sticker    Promo TCASH    Merchant TCASH
    ...    TCASH FAQ    Pertanyaan Lain
    Click_Button_From_Response    2    TCASH FAQ    NONE
    Check_VA_response_text_with_buttons    3    TCASH FAQ    Bagaimana cara mengaktifkan TCASH?    Apa itu TCASH Basic/Full Service?    Apa saja kegunaan TCASH    Apa saja kegunaan TCASH
    ...    Bagaimana cara isi saldo TCASH?
    Click_Button_From_Response    3    Bagaimana cara isi saldo TCASH?    NONE
    Check_VA_response_text    4    Kamu juga bisa mengetahui informasi lebih lanjut di https://digitalpayment.telkomsel.com/faq atau ketik 'batal' untuk melihat menu utama
    Check_VA_response_text    5    Kamu bisa mengisi saldo TCASH Kamu dengan cara-cara berikut
    Check_VA_response_text_with_buttons    6    Pilihan yang Tersedia    Mobile Banking    Internet Banking    ATM Bersama    GraPARI
    ...    Retail Store
    Click_Button_From_Response    6    Internet Banking    NONE
    Check_VA_response_image    7
    Check_VA_response_text    8    ${VA_question_1}
    Closing_session

074- User wants to participate CES in VA - finished
    [Tags]    Non-Telkomsel_Telegram
    User_input    Beli Pulsa
    Cancel_and_closing_session
    Greet_VA_Indo    ${VA_GreetNonTsel}
    Closing_session

[AGENT RELATED] 075- User wants to participate CES in Agent - finished
    [Tags]    NA

[AGENT RELATED] 076- User wants to participate CES in Agent - finished
    [Tags]    NA

[AGENT RELATED] 077- User wants to participate CES in Agent - not finished
    [Tags]    NA

[AGENT RELATED] 078- User wants to participate CES in Agent
    [Tags]    NA

079- Postpaid user want to check quota detail information
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    Click_Button_From_Response    1    Profil Kamu    Profil Kamu
    Check_VA_response_text_with_buttons    1    Berikut informasi yang dapat Veronika berikan terkait dengan Profile Kamu
    Click_Button_From_Response    1    Sisa Kuota    Sisa Kuota
    Check_VA_response_text    1    silakan pilih jenis sisa kuota yang ingin Kamu ketahui untuk +6281314415099
    Check_VA_response_text_with_buttons    2    Jenis Kuota    Internet    SMS    Telepon    Ekstra Pulsa
    Click_Button_From_Response    2    Internet    Internet
    Check_VA_response_text    1    Berikut sisa kuota Internet Kamu:
    Check_VA_response_text_with_buttons    2    Apakah Kamu mau membeli paket tambahan?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    Closing_session

080- User asks about his PUK
    [Tags]    Telkomsel_Telegram
    User_input    PUK aku berapa?
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya    Ya
    Check_VA_response_text    1    Untuk mendapatkan PUK untuk nomor handphone Kamu, Veronika membutuhkan verifikasi lebih lanjut.
    Check_VA_response_text_with_buttons    2    Pilih verifikasi menggunakan PIN T-Care atau 3 nomor yang dihubungi satu bulan terakhir. Jika nomor Kamu terblokir, verifikasi pilihan kedua sangat disarankan    PIN T-Care    Nomor Telepon
    Click_Button_From_Response    2    PIN T-Care    PIN T-Care
    Check_VA_response_text    1    Silakan masukkan PIN T-Care Kamu ya. Jika kamu belum memiliki PIN T-Care silakan ketik "PIN" kirim SMS ke 111 (kartuHalo) atau 116 (simPATI, KARTU As, LOOP)
    Check_VA_response_text    2    Kamu bisa ketik 'batal' jika Kamu tidak lagi membutuhkan informasi PUK
    User_input    ${PIN_TCARE}
    Check_VA_response_text    1    ${VA_verify_PUK}
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

084- User want to check his or her last invoice date and amount
    [Tags]    Telkomsel_Telegram_Postpaid
    User_input    Invoice terakhir saya
    Validate_postpaid_number    1
    Check_VA_response_text_with_buttons    1    Veronika perlu tau nih, apakah yang Kamu maksud adalah penggunaan saat ini atau tagihan ?    Penggunaan    Tagihan
    Click_Button_From_Response    1    Tagihan    Tagihan
    Check_VA_response_text    1    Kamu sudah melunasi tagihan Kamu sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

085- User want to check his or her historical payment
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    riwayat pembayaran
    Check_VA_response_text    1    berikut 3 pembayaran terakhir yang Veronika temukan untuk nomor +6281314415099 :
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

086- User asks for his credit limit
    [Tags]    Telkomsel_Telegram_Postpaid
    User_input    kredit limit saya berapa?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, batas pemakaian domestik Kamu sebesar Rp300.000 perbulan dan roaming sebesar Rp0 perbulan.
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

088- User asks about his usage
    [Tags]    Telkomsel_Telegram_Postpaid
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    berapa usage saya?
    Validate_postpaid_number    1
    Check_VA_response_text    1    Setelah Veronika cek, Kamu memiliki pemakaian sementara sebesar
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

089- User asks about current balance and PIN TCARE
    [Tags]    Telkomsel_Telegram
    User_input    berapa sisa pulsa saya?
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya    Ya
    Check_VA_response_text    1    Setelah Veronika cek, sisa pulsa untuk nomor +6282110685202
    Check_VA_response_text_with_buttons    2    Apakah Kamu juga ingin melakukan pengisian pulsa?    Ya    Tidak
    Click_Button_From_Response    2    Tidak    Tidak
    Check_VA_response_text    1    ${VA_question_1}
    User_input    pin tcare aku berapa?
    Check_VA_response_text    1    PIN T-care untuk nomor handphone +6282110685202 akan Veronika kirimkan melalui SMS
    Check_VA_response_text    2    ${VA_question_1}
    Closing_session

[x] 090- Prepaid user who wants to explore the loyalty card
    [Tags]    IP
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
    [Tags]    IP
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
    Pay_with_Mandiri_CP    PREPAID    FAIL
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
    [Tags]    IP
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
    [Tags]    IP
    Greet_VA_Indo    ${VA_GreetPostPaid}
    User_input    Mau beliin paket buat orang lain
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    ${other_prepaid_number}
    Check_VA_response_text_with_buttons    1    Berikut adalah bentuk hadiah yang bisa Kamu berikan ke nomor tujuan Kamu    Beli Pulsa    Beli Paket
    Cancel_and_closing_session

[x] 114- User wants to perform Send Gift Pay Bill from Postpaid or Prepaid Number to Postpaid Number (Block 3 Status - Voluntary Block)
    [Tags]    IP
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
    Pay_with_Mandiri_CP    PREPAID    FAIL
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
    [Tags]    NA

132- Prepaid user who has insufficient prepaid balance purchase mobile legend voucher
    [Tags]    Telkomsel_Telegram
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau beli voucher games
    Check_VA_response_text_with_buttons    1    Berikut adalah kategori voucher games yang bisa kamu pili
    Click_Button_From_Response    1    Mobile Legend    Mobile Legend
    Check_VA_response_text    1    Veronika menyediakan beberapa pilihan Mobile Legend yang bisa Kamu pilih
    Check_VA_response_text_with_buttons    2    Pilih Kategori
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    #Check_VA_response_text_with_buttons    4    Silakan lihat keyboard untuk tombol navigasi    Berikutnya    Kategori Lain
    #Click_Button_From_Response    2    Diamond ML 5500 19 Diamond    NONE
    Click_button_on_specific_location    2    1    NONE
    Check_VA_response_text_with_buttons    7    Paket Pilihan:    Beli    Detail    Lihat Daftar Voucher
    Click_Button_From_Response    7    Beli    Beli
    Check_VA_response_text_with_buttons    1    Setelah Veronika cek, pulsa Kamu tidak mencukupi untuk pembelian voucher ini. Apakah kamu mau mengisi pulsa atau memilih paket lainnya?    Isi Pulsa    Pilih Voucher Lainnya
    Click_Button_From_Response    1    Pilih Voucher Lainnya    Pilih Voucher Lainnya
    Check_VA_response_text_with_buttons    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Click_Button_From_Response    1    Mobile Legend    Mobile Legend
    Check_VA_response_text    1    Veronika menyediakan beberapa pilihan Mobile Legend yang bisa Kamu pilih
    Check_VA_response_text_with_buttons    2    Pilih Kategori
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
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

[x] 134- Prepaid user who wants to topup using E-Banking (Danamon)
    [Tags]    IP
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

[x] 142- Telkomsel user with expired internet package want to solve his or her internet package activation
    [Tags]    IP
    Greet_VA_Indo    ${VA_Greet1}
    User_input    internet aku bermasalah
    Check_VA_response_text    1    Veronika minta maaf atas ketidaknyamanan Kamu
    Check_VA_response_text    2    Oke, Veronika coba bantu masalah Kamu
    Check_VA_response_text_with_buttons    3    Setelah Veronika cek, Kamu tidak memiliki paket Internet yang aktif. Apakah Kamu ingin membeli paket Internet?    Ya    Tidak
    Click_Button_From_Response    3    Ya    Ya
    Check_VA_response_text    1    Veronika menyediakan pilihan paket Internet yang bisa Kamu pilih
    Check_VA_response_text_with_buttons    2    Pilihan Paket
    Click_Button_From_Response    2    Paket Internet Seharian 1 GB - Rp10Rb    NONE
    Check_VA_response_text_with_buttons    7    Paket Pilihan:    Beli    Detail    Lihat Daftar Paket
    Click_Button_From_Response    7    Beli    Beli
    Check_VA_response_text    1    Veronika pastikan lagi ya
    Check_VA_response_text_with_buttons    2    Kamu ingin mengaktifkan Paket    Ya    Tidak
    Click_Button_From_Response    2    Ya    Ya
    Check_VA_response_text    1    Terima kasih untuk konfirmasinya. Sebelum mengaktifkan paket, Veronika akan mengirim password melalui SMS dari TELKOMSEL ke nomor +6282110685202. Silakan tulis password tersebut ya. Password hanya berlaku 3 menit. Kamu bisa ketik 'Password Baru' untuk dikirimkan password baru.
    Get_OTP
