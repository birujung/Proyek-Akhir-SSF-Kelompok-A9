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
+ Roy Oswaldha - 2106731592
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

## Latar Belakang 
  


## II. Dekripsi dan Cara Kerja
Rangkaian ini akan mengikuti cara kerja dari sebuah Microwave. Dimana terdapat 2 button untuk start dan stop dan 3 button untuk menentukan timer untuk microwavenya. Terdapat 3 jenis timer yaitu 5 menit, 15 menit, dan 30 menit. Pertama kita memilih timer yang kita inginkan terlebih dahulu sebelum kita pencet tombol start. Setelah memilih timer yang kita inginkan, kita dapat memencet tombol start untuk memulai microwavenya. Dalam rangkaian ini kita tidak memperagakan cara kerja heaternya hanya cara kerja fungsinya saja. Kemudian countdown dan suhunya akan ditampilkan pada perangkat MAX7219. Untuk mengukur suhu di dalam microwavenya, kita menggunakan sensor DHT11. Ketika countdownya sudah mencapai 0, maka microwave akan balik ke ready state dan siap menerima timer yang baru. Selama countdown tersebut berjalan, kita dapat juga memencet tombol stop untuk langsung memberhentikan microwavenya.
 
# Perangkat yang digunakan pada rangkaian
```bash
1 Arduino Uno
1 DHT11
1 MAX7219
5 Push Button
5 Resistor
``` 

# Jenis - jenis Button pada Microwave
```bash
Start Button (Interrupt)
Stop Button (Interrupt)
5 menit Button
15 menit Button
30 menit Button
```

# Jenis - jenis Timer pada Microwave
```bash
5 menit
15 menit
30 menit
```

# State - State Microwave
```bash
ready
running
```


<!-- MARKDOWN LINKS & IMAGES -->
  [contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
  [contributors-url]: https://github.com/rroiii/Electronic-Vault-Lock/graphs/contributors
  [forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
  [forks-url]: https://github.com/rroiii/Electronic-Vault-Lock/network/members
  
