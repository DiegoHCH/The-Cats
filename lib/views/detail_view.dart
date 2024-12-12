import 'package:flutter/material.dart';
import 'package:the_cats/models/cat.dart';
import 'package:the_cats/widgets/atribute_list.dart';

class DetailCat extends StatelessWidget {
  static const name = 'detail-view';
  final Cat cat;

  const DetailCat({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    
    final Map<String, int?> attributes = {
      'Inteligencia': cat.intelligence,
      'Adaptabilidad': cat.adaptability,
      'Nivel de cariño': cat.affectionLevel,
      'Amistoso con los niños': cat.childFriendly,
      'Amistoso con los perros': cat.dogFriendly,
      'Nivel de energía': cat.energyLevel,
      'Aseo': cat.grooming,
      'Problemas de salud': cat.healthIssues,
      'Nivel de desprendimiento': cat.sheddingLevel,
      'Necesidades sociales': cat.socialNeeds,
      'Amistoso con los extraños': cat.strangerFriendly,
      'Vocalización': cat.vocalisation,
      'Experimental': cat.experimental,
      'Sin pelo': cat.hairless,
      'Natural': cat.natural,
      'Raro': cat.rare,
      'Rex': cat.rex,
      'Cola suprimida': cat.suppressedTail,
      'Piernas cortas': cat.shortLegs,
      'Hipoalergénico': cat.hypoallergenic,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image.network(
                cat.imageUrl ??
                    'https://via.placeholder.com/300?text=No+Image+Available',
                height: 300,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  }
                  return child;
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Descripción:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cat.description,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Wikipedia Url: ${cat.wikipediaUrl}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Raza: ${cat.name}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'País de Origen: ${cat.origin}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Esperanza de Vida: ${cat.lifeSpan} años',
                    ),
                    const SizedBox(height: 16),
                    AttributesList(attributes: attributes),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}