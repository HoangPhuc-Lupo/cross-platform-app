class ComicChapter {
  final String name;
  final String image;

  const ComicChapter({required this.name, required this.image});
}

class Comic {
  final String id;
  final String title;
  final String image;
  final String description;
  final String status;
  final int chaptersCount;
  final int views;
  final List<String> genres;
  final List<ComicChapter> chapters;

  const Comic({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.status,
    required this.chaptersCount,
    required this.views,
    required this.genres,
    required this.chapters,
  });
}

// Mô tả dùng cho demo (Doraemon)
const String doraemonDescription =
    'Bộ truyện được xem là huyền thoại của Nhật Bản. '
    'Nói về cuộc sống của một cậu nhóc tên Nobita, tính tình hậu đậu và chú mèo máy Doremon '
    'đến từ thế kỉ 22 cùng những người bạn Xuka, Chaien, Xeko; để rồi đã gây ra bao tiếng cười '
    'và rút ra những bài học ý nghĩa cho người xem !!\n\n'
    'Bộ truyện được xem là huyền thoại của Nhật Bản. Nói về cuộc sống của một cậu nhóc tên Nobita, '
    'tính tình hậu đậu và chú mèo máy Doremon đến từ thế kỉ 22 cùng những người bạn Xuka, Chaien, Xeko; '
    'để rồi đã gây ra bao tiếng cười và rút ra những bài học ý nghĩa cho người xem !!';

// Danh sách truyện demo dùng chung cho các màn
final List<Comic> demoComics = [
  Comic(
    id: '1',
    title: 'Đô ra ê mon',
    image: 'assets/images/comic1.jpg',
    description: doraemonDescription,
    status: 'Kết thúc',
    chaptersCount: 2,
    views: 2,
    genres: ['Hài hước'],
    chapters: const [
      ComicChapter(name: 'Chap 1', image: 'assets/images/comic1.jpg'),
      ComicChapter(name: 'Chap 2', image: 'assets/images/comic1.jpg'),
    ],
  ),
  Comic(
    id: '2',
    title: 'Truyện Full',
    image: 'assets/images/comic2.jpg',
    description: doraemonDescription,
    status: 'Đang ra',
    chaptersCount: 5,
    views: 12,
    genres: ['Tình cảm'],
    chapters: const [
      ComicChapter(name: 'Chap 1', image: 'assets/images/comic2.jpg'),
      ComicChapter(name: 'Chap 2', image: 'assets/images/comic2.jpg'),
    ],
  ),
  Comic(
    id: '3',
    title: 'Demo sửa truyện',
    image: 'assets/images/comic3.jpg',
    description: doraemonDescription,
    status: 'Đang ra',
    chaptersCount: 3,
    views: 7,
    genres: ['Hài hước'],
    chapters: const [
      ComicChapter(name: 'Chap 1', image: 'assets/images/comic3.jpg'),
      ComicChapter(name: 'Chap 2', image: 'assets/images/comic3.jpg'),
    ],
  ),
];
