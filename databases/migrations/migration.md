### Migration
Untuk mengatur migrasi database, gunakan perintah berikut:

#### Membuat file migration
*untuk sequence number*
```bash
docker compose exec cinema-reservation-golang migrate create -ext sql -dir databases/migrations -seq create_example_table
```

*untuk datetime*
```bash
docker compose exec cinema-reservation-golang migrate create -ext sql -dir databases/migrations create_example_table
```

> **_NOTE:_**  jika mengalami error saat menjalankan perintah *sequence* `Next sequence number 20241002005308 too large`, hapus dahulu file migration dengan format *datetime* yang sudah ada di folder `databases/migrations` dan jalankan perintah di atas.

**File migration UP** adalah file yang harus diisi dengan perubahan yang ingin ditambahkan

**File migration DOWN** adalah file yang berisikan kode untuk mengembalikan perubahan yang kita lakukan di file up, karena misal terjadi masalah di aplikasi, namun database migration terlanjur dijalankan, kita bisa melakukan rollback dengan cara menjalankan file down, karena berisikan kode untuk mengembalikan perubahan di file up


#### Menjalankan file migration
```bash
docker compose exec cinema-reservation-golang migrate -path databases/migrations -database "postgres://DB_USERNAME:DB_PASSWORD@DB_HOST:DB_PORT/DB_NAME?sslmode=disable" up
```

contoh :

```bash
docker compose exec cinema-reservation-golang migrate -path databases/migrations -database "postgres://username:7h1$.P4A$w0Rd.4gpnSWCjyAygwD18pgA1awIJvuUgQN00M@cinema-reservation-db:5432/cinema_reservation?sslmode=disable" up
```