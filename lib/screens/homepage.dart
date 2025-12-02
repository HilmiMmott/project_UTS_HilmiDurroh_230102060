import 'package:flutter/material.dart';
import 'grid_page.dart';
import 'detail_page.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Kesehatan'),
        centerTitle: true,
        leading: const Icon(Icons.health_and_safety),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Selamat datang!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Aplikasi sederhana untuk katalog produk kesehatan.'),

            const SizedBox(height: 24),
            // Example of row/column layout
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: const [
                          Icon(Icons.info, size: 36, color: Colors.blue),
                          SizedBox(height: 8),
                          Text('Informasi', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Tips kesehatan singkat tersedia di dashboard.'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: const [
                          Icon(Icons.track_changes, size: 36, color: Colors.green),
                          SizedBox(height: 8),
                          Text('Aktivitas', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Tambahkan aktivitas harian Anda.'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            // Example of a stack card preview
            const Text('Highlight', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/images/maskermedis.png', fit: BoxFit.cover),
                    Container(color: Colors.black26),
                    const Center(
                      child: Text('Masker Medis', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Buka Katalog',
                    icon: Icons.shopping_bag,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProdukPage()),
                      );
                    },
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.cyan],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CustomButton(
                  text: 'Detail',
                  icon: Icons.info,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DetailPage(nama: 'Masker Medis', gambar: 'assets/images/maskermedis.png', subProduk: ['Masker 3 lapis'])),
                    );
                  },
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
