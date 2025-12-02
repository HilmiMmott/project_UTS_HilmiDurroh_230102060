import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String nama;
  final String gambar;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.nama,
    required this.gambar,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: gambar.startsWith('http')
                    ? Image.network(gambar, fit: BoxFit.cover)
                    : Image.asset(gambar, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                nama,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
