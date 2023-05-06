import 'package:flutter/material.dart';

class NewsFragment extends StatelessWidget {
  const NewsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Fragment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNewsItem(
              context,
              'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/presiden-jokowi-saat-mengecek-jalan-rusak-di-lampung1.jpg',
              'Tag: Jokowi - Dampingi Presiden Jokowi, Erick Thohir: Komitmen BUMN Bakal Bantu Perbaikan Jalan Rusak',
              'Di antaranya jalan rusak yang ada di Pekon Kota Besi, Kecamatan Batu Brak, Lampung Barat, Lampung yang semakin memprihatikan.Menurut warga sekitar, jalan rusak yanmenghubungkan Pekon Kota Besi dan Pekon Sukabumi, Kecamatan Batu Brak, Lampung Barat itu sudah rusak sejak bertahun-tahun.',
            ),
            _buildNewsItem(
              context,
              'https://thumb.vdvc.id/vivabandung/665x374/2023/05/05/6454b15069cc4-presiden-jokowi-tinjau-jalan-rusak-di-lampung-naik-mobil-indonesia-1_bandung.jpg',
              'Gubernur Lampung Kena Prank, Presiden Jokowi Tak Lintasi Jalan yang Sudah Diperbaiki',
              'VIVA Bandung – Presiden Joko Widodo (Jokowi) melakukan kunjungan kerja ke Provinsi Lampung, pada hari ini, Jumat 5 Mei 2023. Kunjungan tersebut bertujuan untuk meninjau aktivitas ekonomi dan sejumlah infrastruktur di Lampung salah satunya yaitu meninjau jalan di provinsi tersebut. Adanya kunjungan Jokowi itu pun membuat Pemerintah Provinsi Lampung berbenah. Apalagi sebelumnya, viral TikToker Bima yang mengkritisi pembangunan infrastruktur di Lampung tidak maju-maju dan mengeluhkan sejumlah jalan di Lampung yang rusak parah',
            ),
            _buildNewsItem(
              context,
              'https://cdn0-production-images-kly.akamaized.net/HuErxdo3eG_MU6jF26PaY3CJ2Oo=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3511727/original/093547300_1626334753-Jokowi1.jpg',
              'Cek Fakta: Hoaks Kabar Jokowi Mengundurkan dari Jabatan Presiden',
              'Liputan6.com, Jakarta - Kabar tentang Jokowi mengundurkan diri dari kursi presiden beredar di media sosial. Kabar tersebut disebarkan akun Facebook Al Khobar Masyhur pada 13 Juli 2021.Akun Facebook Al Khobar Masyhur mengunggah video berdurasi 14 menit 5 detik.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(
      BuildContext context, String imageUrl, String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
