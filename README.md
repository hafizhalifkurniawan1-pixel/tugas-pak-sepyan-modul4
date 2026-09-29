# Modul 04 - Portal Pengumuman (Fase A)

Praktikum Modul 04: Future & REST API Dasar.
Aplikasi portal pengumuman yang menampilkan data dari server API dengan 4 keadaan (State).

## Bukti Keadaan (State) Layar

### 1. Keadaan Memuat (Loading)
![Keadaan Loading](screenshots/loading.jpeg)
*Tampilan indikator loading sebelum data tiba dari server.*

### 2. Keadaan Berhasil (Success)
![Keadaan Berhasil](screenshots/berhasil.jpeg)
*Tampilan daftar pengumuman setelah data berhasil diambil dari server.*

### 3. Keadaan Kosong (Empty)
![Keadaan Kosong](screenshots/kosong.jpeg)
*Tampilan ketika kategori yang dipilih tidak memiliki data.*

### 4. Keadaan Gagal (Error)
![Keadaan Gagal](screenshots/Eror.jpeg)
*Tampilan pesan error dan tombol coba lagi ketika koneksi internet terputus.*

---

# Laporan Praktikum Modul 01: Mobile Ecosystem, Flutter Setup & Profile App

- **Nama**: [Hafizh Alif Kurniawan]
- **NIM**: [362558302147]
- **Kelas / Prodi**: 2C / TRPL
- **Mata Kuliah**: Rekayasa Kebutuhan Perangkat Lunak (Semester 3)

## 1. Ringkasan Aktivitas
[pada praktikum ini saya bisa mengerti dasar-dasar pengembangan aplikasi mobile, melakukan instalasi dan konfigurasi Flutter menggunakan perintah flutter doctor, dan juga merancang aplikasi profil sederhana selain itu saya juga mepelajari struktur direktori proyek flutter serta menjalankan aplikasi emulator android]

## 2. Bukti Tangkapan Layar (Running App)
![Screenshot Running 1](./screenshots/Screenshot%202026-09-07%20191408.png)
![Screenshot Running 2](./screenshots/Screenshot%202026-09-07%20191339.png)

## 3. Kendala yang Dihadapi & Solusinya
- **Kendala**: [tampilan tiba-tiba ada peringatan Android sdk license status unkwon saat pertama menjalankan perintah flutter]
- **Solusi**: [menjalankan perintah terminal flutter doctor --android-licenses dan menekan tombol y (yes) untuk melanjutkan persetujuan seluruh lisensi sdk yang belum diacc]

## 4. Jawaban Pertanyaan Refleksi
1. **Pilihan Native vs Flutter**: [Native:digunakan saat aplikasi membutuhkan performa komputasi tinggi, integrasi hardware/API sistem operasi yang sangat spesifik, atau pengembangan game berat
Flutter:menjadi pilihan untuk efisiensi waktu dan biaya pengembangan platfrom,keseragaman UI,dan sangat cocok untuk sebagian besar aplikasi maupun informasi]
2. **Prinsip UI = f(state)**: [konsep ini menyatakan bahwa tampilan Antarmuka adalah representasi visual dari fungsi keadaan (state) saat ini.apabila terjadi perubahan state. flutter akan secara otomatis memperbarui tampilan UI agar selaras dengan data baru]
3. **Pentingnya Conventional Commits**: [standar penamaan commit seperti (feat: , fix:, docs:) sangat penting dalam pengembangan perangkat lunak untuk menjaga kerapian riwayat repositori, memudahkan anggota tim memahami perubahan kode secara cepat,mempermudah pencarian bug serta memungkinkan pembuatan changelog otomatis secara profesional]