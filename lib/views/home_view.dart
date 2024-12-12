import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_cats/providers/cats_provider.dart';
import 'package:the_cats/widgets/cat_card.dart';

class HomeView extends ConsumerStatefulWidget {
  static const name = 'home-view';

  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final catsAsyncValue = ref.watch(catsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cats')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Buscar por raza',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: catsAsyncValue.when(
              data: (cats) {
                final filteredCats = cats.where((cat) {
                  return cat.name.toLowerCase().contains(_searchQuery);
                }).toList();

                return ListView.builder(
                  itemCount: filteredCats.length,
                  itemBuilder: (context, index) {
                    final cat = filteredCats[index];
                    return CatCard(cat: cat);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}