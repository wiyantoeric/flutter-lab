import 'package:flutter/material.dart';

// Menampilkan daftar makanan dan minuman
class MenuList extends StatelessWidget {
  const MenuList({super.key, required this.items, required this.label});

  final List items;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(label: Text(label)),
        const SizedBox(height: 4),
        Column(
          children: items
              .map((e) => SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                      child: Text(
                        e["name"],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
