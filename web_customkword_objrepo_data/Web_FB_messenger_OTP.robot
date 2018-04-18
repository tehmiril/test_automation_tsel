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
Resource          Object_repository/Object_repo_FB.txt
Resource          Test_data/Test_data_user_input_Indo.txt
Resource          Test_data/URL_data.txt
Resource          Test_data/Test_data_VA_response_Indo.txt
Resource          Test_data/Test_data_VA_response_carousel_TSEL_Indo.txt
Resource          Custom_keywords/Carousel_validate_custkeyword.txt

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
