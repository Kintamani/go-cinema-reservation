# Migration
Untuk mengatur migrasi database, gunakan perintah berikut:

## Membuat file migration

*menggunakan command taskfile (sequence)*
```bash
task create-migration-seq name=create_example_table
```

*menggunakan command taskfile (datetime)*
```bash
task create-migration-datetime name=create_example_table
```

> **_NOTE:_**  jika mengalami error saat menjalankan perintah *sequence* `Next sequence number 20241002005308 too large`, hapus dahulu file migration dengan format *datetime* yang sudah ada di folder `databases/migrations` dan jalankan perintah di atas.

**File migration UP** adalah file yang harus diisi dengan perubahan yang ingin ditambahkan

**File migration DOWN** adalah file yang berisikan kode untuk mengembalikan perubahan yang kita lakukan di file up, karena misal terjadi masalah di aplikasi, namun database migration terlanjur dijalankan, kita bisa melakukan rollback dengan cara menjalankan file down, karena berisikan kode untuk mengembalikan perubahan di file up

## Mengeksekusi file migration
*mengeksekusi file migration up*
```bash
task run-migration-up
```

*mengeksekusi file migration down*
```bash
task run-migration-down
```