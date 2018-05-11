*** Settings ***
Suite Setup       Open_chrome    ${URLmessengerTSEL}
Test Teardown     Run Keyword If Test Failed    Cancel_and_closing_session_when_unexpected_result    #Suite Teardown    Close Browser
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
Resource          Browser_custkeyword.txt

*** Test Cases ***
[X] 009 - Non-Telkomsel user who wants to know about Loop
    Login_messenger    taacnindonesia02@gmail.com    Welcome01!
    Greet_VA_Indo    Hai Buzz Azzi, selamat datang di GraPARI Virtual Telkomsel!
    Check_VA_response_carousel_exists    1
    Validate_carousel_items    1    Jelajah Produk Telkomsel    Temukan produk terbaik Telkomsel di sini    Beralih ke Telkomsel    Produk untuk Kamu    Layanan digital
    Validate_carousel_items    1    Profil Kamu    Informasi tentang nomor Telkomsel Kamu    Sisa Kuota    Tagihan/Sisa Pulsa    Info PUK
    Validate_carousel_items    1    Beli Paket dan Tukar POIN    Lihat dan beli produk Telkomsel favorit Kamu di sini    Beli Pulsa    Beli Paket    Telkomsel POIN
    Validate_carousel_items    1    Bantuan Lainnya    Kamu punya pertanyaan? Temukan jawabannya di sini    Registrasi Prabayar    GraPARI Terdekat    Kontak Live Agent
    Check_VA_response_text    2    Silakan pilih salah satu opsi di atas atau ketik layanan lain yang dibutuhkan
    Click_button_carousel    1    Jelajah Produk Telkomsel    Layanan digital
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
