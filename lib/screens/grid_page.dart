import 'package:flutter/material.dart';
import 'detail_page.dart';
import '../widgets/product_card.dart';

class ProdukPage extends StatelessWidget {
  ProdukPage({super.key});

  final List<Map<String, dynamic>> produk = [
    {
      "nama": "Masker Medis",
      "gambar": "assets/images/maskermedis.png",
      "subProduk": ["Masker 3 lapis", "Masker N95", "Masker Kain"]
    },
    {
      "nama": "Hand Sanitizer",
      "gambar": "assets/images/handsanitizer.png",
      "subProduk": ["Hand Sanitizer 50ml", "Hand Sanitizer 100ml", "Hand Gel"]
    },
    {
      "nama": "Termometer Digital",
      "gambar": "assets/images/termometer.png",
      "subProduk": ["Termometer Dahi", "Termometer Telinga", "Termometer Multi-fungsi"]
    },
    {
      "nama": "Tensimeter Digital",
      "gambar": "assets/images/tensimeterdigital.png",
      "subProduk": ["Tensimeter Lengan", "Tensimeter Pergelangan"]
    },
    {
      "nama": "Multivitamin",
      "gambar": "assets/images/multivitamin.png",
      "subProduk": ["Vitamin C", "Vitamin D", "Vitamin E", "Omega-3"]
    },
    {
      "nama": "Glukometer",
      "gambar": "assets/images/glukometer.png",
      "subProduk": ["Glukometer Standar", "Glukometer Digital", "Strip Glukosa"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int gridCount = width < 500 ? 2 : 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk Kesehatan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount),
          itemCount: produk.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> p = produk[index];
            final String nama = p["nama"] as String;
            final String gambar = p["gambar"] as String;
            final List<String> sub = List<String>.from(p["subProduk"]);

            return ProductCard(
              nama: nama,
              gambar: gambar,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(nama: nama, gambar: gambar, subProduk: sub),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
