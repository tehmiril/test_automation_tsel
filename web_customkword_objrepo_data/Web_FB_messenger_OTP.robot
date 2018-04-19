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
Resource          Custom_keywords/Generic_custkeyword.txt
Resource          Custom_keywords/Detailed_custkeyword.txt
Resource          Custom_keywords/Carousel_custkeyword.txt
Resource          Custom_keywords/Text_with_buttons_custkeyword.txt
Resource          Custom_keywords/SMS_web_custom_keywords.txt
Resource          Custom_keywords/Browser_custkeyword.txt
Resource          Custom_keywords/Login_logout_custkeyword.txt
Resource          Custom_keywords/Carousel_validate_custkeyword.txt
Resource          Custom_keywords/Credit_card_payment_custkeyword.txt
Resource          Object_repository/Object_repo_FB.txt
Resource          Object_repository/Payment_pages_object_repo.txt
Resource          Test_data/Test_data_user_input_Indo.txt
Resource          Test_data/URL_data.txt
Resource          Test_data/Test_data_VA_response_Indo.txt
Resource          Test_data/Test_data_VA_response_carousel_TSEL_Indo.txt
Resource          Test_data/Test_data_payment.txt

*** Test Cases ***
052 - Postpaid user wants to change his number (vice versa)
    [Tags]    Telkomsel_FB
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
    Check_VA_response_text    3    Berikut adalah informasi untuk nomor Kamu +6282110685202
    Check_VA_response_carousel_exists    4
    Validate_carousel_items    4    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Detail Kuota    Beli Pulsa    Info PUK
    Validate_carousel_items    4    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    FAQ    GraPARI Terdekat    Kontak Live Agent
    #Validate_carousel_items    2    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    #Validate_carousel_items    2    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    5    Ketik 'Ganti nomor' untuk beralih ke nomor handphone lainnya
    Check_VA_response_text    6    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
    Closing_session

[x] 110- User wants to perform Send Gift Reload Balance from Prepaid or Postpaid Number to Prepaid Number
    [Tags]    Telkomsel_FB
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    #Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    #Click_Button_From_Response    1    Ya
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
    Pay_with_credit_card    PASS
    Closing_session

[x] 114- User wants to perform Send Gift Pay Bill from Postpaid or Prepaid Number to Postpaid Number (Block 3 Status - Voluntary Block)
    [Tags]    Telkomsel_FB
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

[x] 116- User wants to perform Send Gift from Prepaid or Postpaid Number to Prepaid Number
    [Tags]    Telkomsel_FB
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
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

[x] 118- User wants to perform Send Gift from Prepaid or Postpaid Number to Prepaid/Postpaid Number
    [Tags]    Telkomsel_FB
    Greet_VA_Indo    ${VA_Greet1}
    User_input    Mau beliin pulsa untuk orang lain
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Oke, silakan masukkan nomor tujuan yang kamu ingin berikan hadiah
    User_input    ${inactive_number}

[x] 124- Prepaid user who has insufficient prepaid balance purchase mobile legend voucher
    [Tags]    Telkomsel_FB
    Greet_VA_Indo    ${VA_Greet1}
    User_input    mau beli voucher games
    Check_VA_response_text_with_buttons    1    Apakah Kamu ingin melanjutkan permintaan ini untuk nomor handphone +6282110685202 ?    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Oke M Testaut, Veronika menyediakan beberapa pilihan
    Click_carousel_button_on_specific_location    2    1    Beli
    Check_VA_response_text_with_buttons    1    Setelah Veronika cek, pulsa Kamu tidak mencukupi untuk pembelian voucher ini. Apakah kamu mau mengisi pulsa atau memilih paket lainnya?    Isi Pulsa    Pilih Voucher Lainnya
    Click_Button_From_Response    1    Pilih Voucher Lainnya
    Check_VA_response_text    1    Berikut adalah kategori voucher games yang bisa kamu pilih
    Check_VA_response_carousel_exists    2
    Check_VA_response_text    3    Kamu juga bisa ketik 'batal' jika ingin menanyakan informasi lain
    Click_carousel_button_on_specific_location    2    1    Pilih
    Check_VA_response_text    1    Oke M Testaut, Veronika menyediakan beberapa pilihan
    Click_carousel_button_on_specific_location    2    2    Beli
    Check_VA_response_text_with_buttons    1    Veronika pastikan lagi ya.    Ya    Tidak
    Click_Button_From_Response    1    Ya
    Check_VA_response_text    1    Terima kasih untuk informasinya.
    Check_VA_response_text    2    Veronika akan mengirim password melalui SMS dari TELKOMSEL ke nomor +6282110685202. Silakan tulis password tersebut ya.
    Check_VA_response_text    2    Password hanya berlaku 3 menit. Kamu bisa ketik 'Password Baru' untuk dikirimkan password baru.
    Get_OTP
    Check_VA_response_text    1    Oke, Veronika sudah berhasil memverifikasi nomor telepon Kamu ya.
    Check_VA_response_text    2    Oke, transaksi yang Kamu lakukan telah sukses. Kode voucher akan dikirimkan melalui SMS ke nomor handphone Kamu
    Check_VA_response_text    3    ${VA_question_1}
    Closing_session
