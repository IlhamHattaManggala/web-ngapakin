# web-ngapakin

Portal resmi dokumentasi dan showcase LarapakGo (https://larapak.my.id) yang dibangun 100% menggunakan arsitektur web framework LarapakGo dan dialek bahasa NgapakIn.

## Persyaratan Sistem

- LarapakGo CLI (`larapak` atau `ngapakin`)
- Tanpa runtime eksternal (100% Native Go, Zero Python / Node.js)

## Cara Menjalankan

### Opsi 1: Menggunakan LarapakGo CLI Lokal
1. Masuk ke direktori proyek:
   ```bash
   cd web-ngapakin
   ```
2. Jalankan server development lokal (dilengkapi auto hot-reload & browser refresh):
   ```bash
   larapak ladeni 8000
   # atau alias standar:
   larapak serve 8000
   ```
3. Buka peramban di `http://localhost:8000`.
4. Buka Route & API Studio terintegrasi di `http://localhost:8000/_studio`.

### Opsi 2: Menggunakan Docker
1. Bangun dan jalankan container:
   ```bash
   docker compose up -d --build
   ```
2. Buka peramban di `http://localhost:8000`.
