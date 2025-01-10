# Cinema Reservation Project Go 

> **_NOTE:_**  Project ini akan selalu di-update, seiring dengan perubahan teknologi dan arsitektur untuk memudahkan pengembangan aplikasi saya pribadi.

Ini adalah Cinema Reservation project Golang yang dirancang dengan prinsip **Clean Architecture** untuk mendukung skalabilitas dan maintainability. Proyek ini juga sudah dilengkapi dengan Docker untuk mempermudah development.

**Cinema Reservation** adalah repositori yang berisi kode sumber untuk aplikasi reservasi tiket bioskop. Aplikasi ini memungkinkan pengguna untuk mencari jadwal film, memilih kursi, dan melakukan pembayaran secara online.

### Persyaratan
- **Golang** (minimal versi 1.23)
- **Docker** dan **Docker Compose**
- **PostgreSQL** sebagai database (dapat dikustomisasi)

### Structure Proyek
Pada proyek ini saya menggunakan structure dari [Go Blueprint](https://github.com/golang-standards/project-layout) untuk mengatur struktur proyek yang lebih baik dan mudah dibaca, untuk selengkapnya silahkan baca [Doc Go Blueprint](https://docs.go-blueprint.dev/).

### Setup Proyek
1. Clone repository ini:
    ```bash
    git clone https://github.com/Kintamani/go-cinema-reservation
    cd go-cinema-reservation
    ```

2. Install dependencies menggunakan Go:
    ```bash
     go mod download
    ```

3. Atur environment variables: Buat file `.env` dari hasil `.env.example` dan isi dengan konfigurasi yang dibutuhkan.

4. Build dan jalankan database dengan Docker Compose:
    ```bash
    task docker-run
    ```

4. Build dan Jalankan aplikasi dengan Docker:
    ```bash
    task run
    ```

    atau gunakan fitur live reload dengan perintah berikut:
    ```bash
    task watch
    ```
    Aplikasi akan berjalan di http://localhost:{PORT}.

### Pengujian
Untuk menjalankan unit tests, gunakan perintah berikut:
```bash
task test
```

### Command Penggunaan
* [Migration](databases/migrations/migration.md)

### Aturan Umum untuk Commit
Pada projek menggunakan commit konvensional untuk menangani commit git : [Conventional Commits](https://www.conventionalcommits.org) 
* Gunakan `feat: pesan commit` untuk melakukan commit git yang terkait dengan fitur.
* Gunakan `refactor: pesan commit` untuk melakukan commit git yang terkait dengan refactoring kode.
* Gunakan `fix: pesan commit` untuk melakukan commit git yang terkait dengan perbaikan bug.
* Gunakan `test: pesan commit` untuk melakukan commit git yang terkait dengan file test.
* Gunakan `docs: pesan commit` untuk melakukan commit git yang terkait dengan dokumentasi (termasuk file README.md).
* Gunakan `style: pesan commit` untuk melakukan commit git yang terkait dengan gaya kode.


### Pengembangan
Jika Anda ingin mengembangkan lebih lanjut, pastikan untuk selalu menjaga pemisahan tanggung jawab antara layer-layer dalam arsitektur. Setiap penambahan fitur baru harus mengikuti struktur yang sudah ditentukan untuk menjaga kode tetap bersih dan mudah dimaintain.

### Kontribusi
Jika Anda ingin berkontribusi dalam pengembangan proyek ini, silakan fork repository ini dan buat pull request dengan perubahan yang Anda usulkan.

### Lisensi
Proyek ini dilisensikan di bawah [MIT](./LICENSE) License.