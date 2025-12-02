import 'package:flutter/material.dart';

List<String> cart = [];

class DetailPage extends StatelessWidget {
  final String nama;
  final String gambar;
  final List<String> subProduk;

  const DetailPage({
    super.key,
    required this.nama,
    required this.gambar,
    required this.subProduk,
  });

  // Fungsi untuk menampilkan deskripsi sesuai produk
  String getDeskripsi(String namaProduk) {
    switch (namaProduk) {
      case 'Masker Medis':
        return 'Masker medis dirancang untuk melindungi saluran pernapasan dari partikel debu, kuman, dan bakteri. Terbuat dari bahan non-woven berkualitas tinggi, nyaman digunakan dalam waktu lama. Tersedia masker 3 lapis, N95, dan kain. Cocok untuk bepergian, di rumah sakit, atau di tempat umum.';
      case 'Hand Sanitizer':
        return 'Hand sanitizer berbasis alkohol (≥70%) efektif membunuh kuman dan virus. Tersedia ukuran 50ml dan 100ml. Wangi ringan, cepat kering, menjaga tangan tetap bersih tanpa air.';
      case 'Termometer Digital':
        return 'Termometer digital akurat untuk mengukur suhu tubuh. Tersedia tipe dahi, telinga, dan multi-fungsi. Layar digital jelas, alarm suhu tinggi, cepat digunakan.';
      case 'Tensimeter Digital':
        return 'Alat pengukur tekanan darah digital, tipe lengan dan pergelangan. Layar LCD besar, penyimpanan data otomatis, hasil pengukuran akurat dan mudah digunakan.';
      case 'Multivitamin':
        return 'Suplement multivitamin lengkap untuk menjaga daya tahan tubuh. Tersedia vitamin C, D, E, dan Omega-3. Membantu sistem imun, kesehatan jantung, dan kebugaran.';
      case 'Glukometer':
        return 'Glukometer digital untuk memantau kadar gula darah. Tersedia tipe standar dan digital, dilengkapi strip glukosa. Mudah digunakan, hasil cepat dan akurat.';
      default:
        return 'Deskripsi produk tidak tersedia.';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar landscape
            SizedBox(
              width: double.infinity,
              height: screenWidth * 0.6,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: gambar.startsWith('http')
                        ? Image.network(
                            gambar,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) =>
                                const Icon(Icons.broken_image),
                          )
                        : Image.asset(gambar, fit: BoxFit.cover),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Text(
                      nama,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SafeArea(child: BackButton(color: Colors.white)),
                ],
              ),
            ),
            // Deskripsi & tombol tambah ke keranjang
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(getDeskripsi(nama)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (subProduk.isNotEmpty) {
                        cart.add(subProduk[0]);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${subProduk[0]} ditambahkan ke keranjang'),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
