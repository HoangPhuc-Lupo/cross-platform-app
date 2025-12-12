import 'package:flutter/material.dart';
import '../models/comic.dart';
import 'chapter_reader_screen.dart';

class ComicDetailScreen extends StatefulWidget {
  const ComicDetailScreen({super.key});

  static const String routeName = '/comicDetail';

  @override
  State<ComicDetailScreen> createState() => _ComicDetailScreenState();
}

class _ComicDetailScreenState extends State<ComicDetailScreen> {
  int _selectedTab = 0; // 0: Đánh giá, 1: Bình luận
  int _currentRating = 0;
  final _commentCtrl = TextEditingController();
  final List<String> _comments = ['hay vl'];

  @override
  void dispose() {
    _commentCtrl.dispose();
    super.dispose();
  }

  void _setRating(int value) {
    setState(() => _currentRating = value);
  }

  void _sendComment() {
    final text = _commentCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comments.insert(0, text);
      _commentCtrl.clear();
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đã gửi bình luận')));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final comic = (args is Comic) ? args : demoComics.first;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(comic.title, style: const TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: const [Icon(Icons.more_vert, color: Colors.black)],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin trên cùng
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    comic.image,
                    width: 90,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comic.status,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.menu_book, size: 18),
                          const SizedBox(width: 4),
                          Text('${comic.chaptersCount} Chap'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.category, size: 18),
                          const SizedBox(width: 4),
                          Text(comic.genres.join(', ')),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.remove_red_eye, size: 18),
                          const SizedBox(width: 4),
                          Text('${comic.views} lượt xem'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              'Giới thiệu:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(comic.description, textAlign: TextAlign.justify),

            const SizedBox(height: 16),
            const Text(
              'Danh sách chương chuyện:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Danh sách chap
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: comic.chapters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final chap = comic.chapters[index];
                  return OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ChapterReaderScreen.routeName,
                        arguments: ChapterReaderArgs(
                          chapterTitle: chap.name,
                          imagePath: chap.image,
                        ),
                      );
                    },
                    child: Text(chap.name),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Tabs Đánh giá / Bình luận
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                        ),
                        color: _selectedTab == 0
                            ? Colors.deepPurple
                            : Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Text(
                          'Đánh giá',
                          style: TextStyle(
                            color: _selectedTab == 0
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                        ),
                        color: _selectedTab == 1
                            ? Colors.deepPurple
                            : Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Text(
                          'Bình luận',
                          style: TextStyle(
                            color: _selectedTab == 1
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            if (_selectedTab == 0)
              _buildRatingSection()
            else
              _buildCommentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Đánh giá của bạn:',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (index) {
            final starIndex = index + 1;
            final isFilled = starIndex <= _currentRating;
            return IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                isFilled ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
              onPressed: () => _setRating(starIndex),
            );
          }),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_currentRating == 0) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đánh giá thành công!')),
              );
            },
            child: const Text('ĐÁNH GIÁ'),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nhận bình luận của bạn',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _commentCtrl,
          maxLines: 2,
          decoration: const InputDecoration(hintText: 'Nhập bình luận của bạn'),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: _sendComment,
            child: const Text('GỬI'),
          ),
        ),
        const SizedBox(height: 12),
        Text('${_comments.length} bình luận'),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _comments.length,
          itemBuilder: (context, index) {
            final text = _comments[index];
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('user'),
              subtitle: Text(text),
            );
          },
        ),
      ],
    );
  }
}
