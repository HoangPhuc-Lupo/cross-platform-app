import 'package:flutter/material.dart';

class ChapterReaderArgs {
  final String chapterTitle;
  final String imagePath;

  ChapterReaderArgs({required this.chapterTitle, required this.imagePath});
}

class ChapterReaderScreen extends StatelessWidget {
  const ChapterReaderScreen({super.key});

  static const String routeName = '/chapterReader';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ChapterReaderArgs?;

    final title = args?.chapterTitle ?? 'Chap 1';
    final imagePath = args?.imagePath ?? 'assets/images/comic1.jpg';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
      ),
    );
  }
}
