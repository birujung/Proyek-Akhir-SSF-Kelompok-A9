[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h1 align="center">Microwave</h1>

  <p align="center">
    <br />
    <a href="https://github.com/rroiii/Electronic-Vault-Lock"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/rroiii/Electronic-Vault-Lock">View Demo</a>
    ·
    <a href="https://github.com/rroiii/Electronic-Vault-Lock/issues">Report Bug</a>
    ·
    <a href="https://github.com/rroiii/Electronic-Vault-Lock/issues">Request Feature</a>
  </p>
</div>

___
**Kelompok SSF A9:**
+ Amrita Deviayu Tunjungbiru	- 2106636584
+ Ahmad Rifqi Fadhlurrahman - 2106731301
+ Seno Pamungkas Rahman - 2106731586
+ Sulthan Satrya Yudha Darmawan - 2106731560
___

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Daftar Isi</summary>
  <ol>
    <li><a href="#latar-belakang">Latar Belakang</a></li>
    <li><a href="#dekripsi-dan-cara-kerja">Dekripsi dan Cara Kerja</a></li>
    <li><a href="#perangkat-yang-digunakan-pada-rangkaian">Perangkat yang digunakan pada rangkaian</a></li>
    <li><a href="#jenis---jenis-button-pada-microwave">Jenis - jenis Button pada Microwave</a></li>
    <li><a href="#jenis---jenis-timer-pada-microwave">Jenis - jenis Timer pada Microwave</a></li>
    <li><a href="#state---state-microwave">State - State Microwave</a></li>
  </ol>
</details>

# I. Latar Belakang dan Solusi
<p align="justify"> 
Dalam kehidupan sehari-hari, masyarakat modern dihadapkan pada tantangan kesibukan dan kekurangan waktu. Kehidupan yang serba cepat membutuhkan solusi praktis, cepat, dan efisien dalam memasak dan menghangatkan makanan. Namun, banyak orang yang sibuk dengan pekerjaan dan tanggung jawab lainnya, sehingga memasak menjadi sulit dilakukan. Microwave hadir sebagai solusi untuk memenuhi kebutuhan tersebut. Dengan menggunakan button, timer, dan sensor DHT11, microwave dapat memanaskan makanan dengan cepat. Hal ini sangat membantu bagi mereka yang memiliki jadwal yang padat. Penggunaan microwave memungkinkan masyarakat menjaga kualitas hidangan tanpa harus mengorbankan waktu yang berharga. Dengan demikian, microwave menjadi pilihan yang praktis dan efisien dalam menjaga kualitas makanan tanpa membuang banyak waktu berharga. 
</p>



# II. Dekripsi dan Cara Kerja
<p align="justify"> 
Rangkaian ini akan mengikuti cara kerja dari sebuah Microwave. Dimana terdapat 2 button untuk start dan stop dan 3 button untuk menentukan timer untuk microwavenya. Terdapat 3 jenis timer yaitu 5 menit, 15 menit, dan 30 menit. Pertama kita memilih timer yang kita inginkan terlebih dahulu sebelum kita pencet tombol start. Setelah memilih timer yang kita inginkan, kita dapat memencet tombol start untuk memulai microwavenya. Dalam rangkaian ini kita tidak memperagakan cara kerja heaternya hanya cara kerja fungsinya saja. Kemudian countdown dan suhunya akan ditampilkan pada perangkat MAX7219. Untuk mengukur suhu di dalam microwavenya, kita menggunakan sensor DHT11. Ketika countdownya sudah mencapai 0, maka microwave akan balik ke ready state dan siap menerima timer yang baru. Selama countdown tersebut berjalan, kita dapat juga memencet tombol stop untuk langsung memberhentikan microwavenya. 
</p>

 
## Perangkat yang digunakan pada rangkaian
```bash
1 Arduino Uno
1 DHT11
1 MAX7219
5 Push Button
5 Resistor
``` 

## Jenis - jenis Button pada Microwave
```bash
Start Button (Interrupt)
Stop Button (Interrupt)
5 menit Button
15 menit Button
30 menit Button
```

## Jenis - jenis Timer pada Microwave
```bash
5 menit
15 menit
30 menit
```

## State - State Microwave
```bash
ready
running
```

# III. Implementasi Software

# IV. Hasil Pengujian dan Evaluasi

# V. Kesimpulan
<p align="justify"> 
Microwave merupakan barang yang digunakan dalam kehidupan sehari-hari yang fungsi utamanya adalah memanaskan makanan. Proyek ini mengimplementasikan cara kerja microwave dengan melakukan integrasi hardware dan software seputar penggunaan Arduino Uno. Kode pada proyek ini dirancang dengan menggunakan bahasa Assembly dengan memperhatikan implementasi Sembilan modul yang telah dipaparkan selama Praktikum Sistem Siber Fisik Laboratorium Digital Fakultas Teknik Universitas Indonesia berlangsung dengan fokus pada penggunaan Sensor DHT, Timer, serta implementasi serial monitor. Lalu Hardware dirangkai dengan menggunakan bahan-bahan yang telah tertera serta dilakukan integrasi antara hardware dan software dengan mengimplementasikan kode yang telah dibuat agar pengujian dapat dilaksanakan.</p>
<p align="justify"> 
Berdasarkan hasil dari pengujian dan evaluasi, Proyek Microwave yang telah kelompok kami buat dapat mendeteksi suhu serta melakukan perhitungan waktu sebagaimana yang ditujukan dari tujuan awal pembuatan proyek. Maka dari itu, Proyek Microwave ini telah berjalan dengan baik. 
</p>



<!-- MARKDOWN LINKS & IMAGES -->
  [contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
  [contributors-url]: https://github.com/rroiii/Electronic-Vault-Lock/graphs/contributors
  [forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
  [forks-url]: https://github.com/rroiii/Electronic-Vault-Lock/network/members
  
