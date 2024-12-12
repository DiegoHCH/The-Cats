import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_cats/models/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({super.key, required this.cat});

  String? _truncateText(String? text, int maxLength) {
    if(text != null) {
      if (text.length > maxLength) {
        return '${text.substring(0, maxLength)}...';
      }
    }
    
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  Text('Raza : ${cat.name}'),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/detail-cat', extra: cat),
                      child: const Text("Más..."),
                    ),
                  ),
                ],
            ),
            const SizedBox(height: 16,),
              Center(
                child: Image.network(cat.imageUrl ??
                    'https://via.placeholder.com/300?text=No+Image+Available',
                height: 300,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                  return FadeIn(child: child);
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image,
                        size: 100,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Imagen no soportada',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                },
                ),
              ),
              const SizedBox(height: 16,),
              Text('Pais de Origen: ${_truncateText(cat.origin, 15)}'),
            ],
        ),
      ),
    );
  }
}