import 'package:flutter/material.dart';
import '../models/comic.dart';
import 'comic_detail_screen.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  static const String routeName = '/ranking';

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  String _filter = 'Lọc theo tuần';
  final _filters = ['Lọc theo tuần', 'Lọc theo tháng', 'Lọc theo năm'];

  @override
  Widget build(BuildContext context) {
    final comics = demoComics;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Bảng xếp hạng truyện',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Lọc theo  '),
                DropdownButton<String>(
                  value: _filter,
                  items: _filters
                      .map(
                        (f) =>
                            DropdownMenuItem<String>(value: f, child: Text(f)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _filter = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: comics.length,
                itemBuilder: (context, index) {
                  final comic = comics[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 0,
                    ),
                    leading: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    title: Text(comic.title),
                    subtitle: Text(
                      '${comic.chaptersCount} Chap  •  ${comic.views} lượt xem',
                    ),
                    trailing: SizedBox(
                      width: 50,
                      child: Image.asset(comic.image, fit: BoxFit.cover),
                    ),
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
          ],
        ),
      ),
    );
  }
}
