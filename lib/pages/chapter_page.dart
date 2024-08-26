import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/menu/lesson_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChapterPage extends StatefulWidget {
  String chapterTitle;
  List<int> lessons;
  ChapterPage({
    super.key,
    required this.chapterTitle,
    required this.lessons,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: actionBackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/referencePage",
                arguments: {
                  "chapter": widget.chapterTitle,
                  "lessons": widget.lessons,
                },
              );
            },
            icon: const Icon(
              Icons.book_rounded,
              color: actionBackColor,
            ),
          ),
        ],
        title: Text(
          widget.chapterTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.lessons.length,
        itemBuilder: (context, index) {
          return LessonCard(
            title: "Lesson ${widget.lessons[index]}",
            onPressed: () {
              Navigator.of(context).pushNamed(
                "/lesson",
                arguments: {
                  "lessonNumber": "${widget.lessons[index]}",
                },
              );
            },
          );
        },
      ),
    );
  }
}
