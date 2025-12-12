import 'package:flutter/material.dart';
import '../models/comic.dart';
import '../widgets/comic_card.dart';
import 'comic_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    // Tạm chọn 2 truyện đầu làm "yêu thích"
    final favorites = demoComics.take(2).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Danh sách yêu thích',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: favorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final comic = favorites[index];
            return ComicCard(
              comic: comic,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ComicDetailScreen.routeName,
                  arguments: comic,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
