class News {
  final String id;
  final String title;
  final String content;
  final String imagePath;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.imagePath,
  });
}

final List<News> newsList = [
  News(
    id: '1',
    title: 'Anis BAswedan',
    content:
        'Anies Baswedan, bakal calon Presiden usungan Partai NasDem, PKS dan Partai Demokrat, hari ini mendadak safari ke Garut. Ada dua lokasi yang akan ia hadiri, yaitu undangan pengasuh Pondok Pesantren Suci Kecamatan Karangpawitan, dan temu kader dan relawan di Gedung Intan Balarea Tarogong.',
    imagePath:
        'https://thumb.tvonenews.com/thumbnail/2023/05/01/644f6d5f22e48-anies-baswedan-mendadak-safari-politik-ke-garut-menyinggung-noise-dan-voice_1265_711.jpg',
  ),
  News(
    id: '2',
    title: 'Survei LSI: Prabowo Kalahkan Ganjar dan Anies di Semua Simulasi',
    content:
        'Temuan terbaru Lembaga Survei Indonesia (LSI) menunjukkan elektabilitas Ketua Umum Partai Gerindra Prabowo Subianto menempati posisi teratas. Pada survei periode April 2023 tersebut, Prabowo unggul dalam simulasi terbuka, semi-terbuka, hingga tertutup',
    imagePath:
        'https://cdn1.katadata.co.id/media/images/thumb/2023/05/02/Prabowo_Subianto_Temui_mantan_Wakil_Presiden_RI_Jusuf_Kalla-2023_05_02-20_44_27_f99619e3d9313a3314c2a9acd69a3141_960x640_thumb.jpg',
  ),
];
