[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h1 align="center">Microwave</h1>

  <p align="center">
    <br />
    <a href="https://docs.google.com/document/d/1hm8Lt8FwRerWbpJ2OE97XsNa6cO3VT7M3mVZjngSqH8/edit?usp=sharing"><strong>Explore our docs »</strong></a>
    <a href=""> | </a>
    <a href="https://www.canva.com/design/DAFjFzc3Epw/BtCf_STqrOJoeX49x1hR0A/edit?utm_content=DAFjFzc3Epw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton"><strong>Our Presentation »</strong></a>
    <br />
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
<p align="justify">Dalam kehidupan sehari-hari, masyarakat modern dihadapkan pada tantangan kesibukan dan kekurangan waktu. Kehidupan yang serba cepat membutuhkan solusi praktis, cepat, dan efisien dalam memasak dan menghangatkan makanan. Namun, banyak orang yang sibuk dengan pekerjaan dan tanggung jawab lainnya, sehingga memasak menjadi sulit dilakukan. Microwave hadir sebagai solusi untuk memenuhi kebutuhan tersebut. Dengan menggunakan button, timer, dan sensor DHT11, microwave dapat memanaskan makanan dengan cepat. Hal ini sangat membantu bagi mereka yang memiliki jadwal yang padat. Penggunaan microwave memungkinkan masyarakat menjaga kualitas hidangan tanpa harus mengorbankan waktu yang berharga. Dengan demikian, microwave menjadi pilihan yang praktis dan efisien dalam menjaga kualitas makanan tanpa membuang banyak waktu berharga. 
</p>



# II. Dekripsi dan Cara Kerja
<p align="justify">Rangkaian ini akan mengikuti cara kerja dari sebuah Microwave. Dimana terdapat 2 button untuk start dan stop dan 3 button untuk menentukan timer untuk microwavenya. Terdapat 3 jenis timer yaitu 10 menit, 20 menit, dan 30 menit. Pertama kita memilih timer yang kita inginkan terlebih dahulu sebelum kita pencet tombol start. Setelah memilih timer yang kita inginkan, kita dapat memencet tombol start untuk memulai microwavenya. Dalam rangkaian ini kita tidak memperagakan cara kerja heaternya hanya cara kerja fungsinya saja. Kemudian countup dan suhunya akan ditampilkan pada perangkat MAX7219. Untuk mengukur suhu di dalam microwavenya, kita menggunakan sensor DHT11. Ketika countupnya sudah mencapai timer yang dipilih, maka microwave akan balik ke ready state dan siap menerima timer yang baru. Selama countdown tersebut berjalan, kita dapat juga memencet tombol stop untuk langsung memberhentikan microwavenya. 
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
10 menit
20 menit
30 menit
```

## State - State Microwave
```bash
ready
running
```

# III. Implementasi Software
<p align="justify"> Berdasarkan kode, fungsi SPI_MAX7219_init berfungsi untuk melakukan inisialisasi yang mengatur mode SPI dan mengirim beberapa perintah dan data ke MAX7219, chip yang mengendalikan display tujuh segmen. Fungsi ini mempersiapkan pengaturan awal sebelum display dapat digunakan. Fungsi uptime_logic bertanggung jawab untuk mengatur dan mengirimkan data waktu (menit, detik) ke display MAX7219. Fungsi inc_MSD berfungsi untuk mengatur peningkatan digit MSD (Most Significant Digit) yaitu detik hingga 60, fungsi inc_min berfungsi untuk mengatur peningkatan digit menit hingga 10 menit, dan fungsi inc_min2 berfungsi untuk mengatur peningkatan digit menit puluhan sesuai button yang dipilih. Fungsi send_bytes digunakan untuk mengirimkan byte perintah dan data ke MAX7219 melalui komunikasi SPI. Fungsi delay_timer1 digunakan untuk membuat penundaan selama 1 detik menggunakan Timer 1 dan diaplikasikan fungsi uptime_logic untuk membuat timer detik berjalan naik. Fungsi delay_timer0 digunakan untuk membuat penundaan sebesar 10 detik menggunakan Timer 0 dan diaplikasikan ke dalam DHT11_reading untuk memberikan delay dalam pembacaan sensor. </p>
  
<p align="justify"> Fungsi convtemp bertanggung jawab untuk mengkonversi dan mengirimkan suhu dalam format desimal ke MAX7219. Fungsi ini melakukan konversi dari byte suhu menjadi digit-desimal dan mengirimkannya ke display tujuan. Konversi dilakukan dengan membagi byte suhu menjadi puluhan dan satuan, kemudian mengirimkan digit-desimal tersebut ke MAX7219. Fungsi DHT11_sensor digunakan untuk membaca data dari sensor DHT11. Fungsi ini mengatur sinyal start dan response yang diperlukan untuk berkomunikasi dengan sensor. Setelah itu, fungsi membaca kelembaban dan suhu dari sensor DHT11 dan menyimpannya dalam register R13 dan R24. Fungsi DHT11_reading digunakan untuk membaca bit-bit data dari sensor DHT11. Fungsi ini mengatur waktu dan membaca sinyal dari sensor untuk mendapatkan bit-bit data yang dikirimkan. Bit-bit tersebut kemudian dikonversi menjadi byte kelembaban dan suhu yang lebih mudah dipahami. Fungsi delay_20ms digunakan untuk melakukan penundaan sebesar 20 milisekon dan diimplementasikan terhadap fungsi DHT11_sensor. Fungsi init_interrupt digunakan untuk menginisialisasi pengaturan interrupt pada mikrokontroler. Fungsi choose10, choose20, choose30 adalah fungsi yang dipanggil ketika pengguna memilih waktu timer berjalan. Fungsi disp_space digunakan untuk menampilkan spasi pada display MAX7219. Fungsi stop digunakan untuk kembali ke kode setelah fungsi init_interrupt. Fungsi shutdown_MAX digunakan untuk mematikan microwave yang sedang berjalan dengan tidak menampilkan apapun pada MAX7219. Fungsi init_SPI bertujuan untuk menginisialisasi modul SPI (Serial Peripheral Interface). Fungsi ini melakukan pengaturan beberapa register untuk mengkonfigurasi modul SPI sebagai master dengan prescaler fsck=fosc/16. Selain itu, fungsi ini juga mengatur intensitas segment, mode dekode, batas pemindaian, dan status on/off pada perangkat MAX7219 yang terhubung melalui SPI. </p>

# IV. Hasil Pengujian dan Evaluasi
## Pengujian
<p align="justify"> Setelah melakukan integrasi hardware dengan software, rangkaian diuji dengan tujuan membuktikan apakah rangkaian akan berjalan sesuai dengan input kode yang telah diberikan. Rangkaian Microwave diuji dengan memilih durasi lamanya microwave akan berjalan melalui button dengan spesifikasi waktu antara 10 menit, 20 menit, dan 30 menit. Apabila durasi yang dipilih tidak sesuai, button STOP dapat ditekan untuk menghentikan proses pemilihan durasi serta mengulang input waktu. Setelah durasi yang dipilih sesuai, Button START dapat ditekan untuk memulai Microwave bekerja. Selama proses tersebut berlangsung, MAX 7219 akan mendisplay Suhu dengan besaran derajat Celcius yang ditangkap oleh sensor DHT11 serta menampilkan display CountUp selama microwave bekerja sesuai dengan durasi yang dipilih sebelum menekan button START. Microwave akan berhenti bekerja apabila telah mencapai durasi yang telah ditentukan.
</p>
## Hasil

## Evaluasi

# V. Kesimpulan
<p align="justify"> Proyek ini merupakan implementasi cara kerja microwave dengan melakukan integrasi hardware dan software seputar penggunaan Arduino Uno. Kode pada proyek ini dirancang dengan menggunakan bahasa Assembly dengan memperhatikan implementasi Sembilan modul yang telah dipaparkan selama Praktikum Sistem Siber Fisik Laboratorium Digital Fakultas Teknik Universitas Indonesia berlangsung dengan fokus pada penggunaan Sensor DHT, Timer, implementasi serial monitor, serta implementasi interrupt. Lalu Hardware dirangkai dengan menggunakan alat dan bahan  yang telah tertera serta dilakukan integrasi antara hardware dan software dengan mengimplementasikan kode yang telah dibuat agar pengujian dapat dilaksanakan.</p>
<p align="justify"> 
Berdasarkan hasil dari pengujian dan evaluasi, Proyek Microwave yang telah kelompok kami buat dapat mendeteksi suhu serta melakukan perhitungan waktu sebagaimana yang ditujukan dari tujuan awal pembuatan proyek. Maka dari itu, Proyek Microwave ini telah berjalan dengan baik. 
</p>



<!-- MARKDOWN LINKS & IMAGES -->
  [contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
  [contributors-url]: https://github.com/rroiii/Electronic-Vault-Lock/graphs/contributors
  [forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
  [forks-url]: https://github.com/rroiii/Electronic-Vault-Lock/network/members
  
