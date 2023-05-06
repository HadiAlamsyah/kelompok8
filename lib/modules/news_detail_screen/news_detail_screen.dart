import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.newsId,
  });
  final String newsId;
  final String id;
  final String title;
  final String content;
  final String image;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Berita'),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Image.network(
              "https://asset.kompas.com/crops/4M2kWIMh5hAmAhBpVSQx23L67jo=/0x0:0x0/490x326/data/photo/2023/05/04/645352cd043dc.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  'berita ke ${widget.newsId}. Anggota Tim Delapan Koalisi Perubahan untuk Persatuan (KPP) Willy Aditya mengungkapkan, sejauh ini sudah ada lima kandidat yang telah berkomunikasi secara informal dengan Tim Delapan. Meskipun, ia enggan membocorkan siapa saja kandidat yang dimaksud. "Kami ada time limit kok. Juli sudah harus selesai dan kami harus declare," ungkap Willy di Kantor Sekretariat Perubahan, Kebayoran Baru, Jakarta Selatan, Jumat (5/5/2023).',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
