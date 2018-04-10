*** Settings ***
Suite Setup       Open_chrome_with_user_profile    ${URLmessengerTSEL}
Suite Teardown    Close Browser
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session_when_unexpected_result
Library           SeleniumLibrary    run_on_failure=No Operation
Resource          Detailed_custkeyword.txt
Resource          Test_data_Indo.txt
Library           String
Resource          Object_repository.txt
Resource          Generic_custkeyword.txt
Library           OperatingSystem
Library           Collections
Resource          Carousel_custkeyword.txt
Resource          Text_with_buttons_custkeyword.txt
Resource          URL_data.txt
Resource          SMS_web_custom_keywords.txt
Resource          Local_path.txt
Resource          Browser_custkeyword.txt

*** Test Cases ***
052 - Postpaid user wants to change his number (vice versa)
    Greet_VA_Indo    ${VA_Greet1}
    Check_VA_response_text    1    Berikut adalah informasi untuk nomor Kamu +6282110685202
    Check_VA_response_carousel_exists    2
    Validate_carousel_items    2    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Detail Kuota    Beli Pulsa    Info PUK
    Validate_carousel_items    2    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    FAQ    GraPARI Terdekat    Kontak Live Agent
    #Validate_carousel_items    2    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    #Validate_carousel_items    2    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    3    Ketik 'Ganti nomor' untuk beralih ke nomor handphone lainnya
    Check_VA_response_text    4    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
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
