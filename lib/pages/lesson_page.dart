import 'package:eng_game_app/components/menu/word_card.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LessonPage extends StatefulWidget {
  String lessonNumber;
  LessonPage({
    super.key,
    required this.lessonNumber,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late List<WordModel> words = [];

  Future getWords() async {
    final fetchedWords =
        await WordsDatabase.instance.readLesson(widget.lessonNumber);
    setState(() {
      words = fetchedWords!;
    });
  }

  @override
  void initState() {
    super.initState();
    getWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/referenceLesson",
                arguments: {
                  "lessonNumber":widget.lessonNumber,
                },
              );
            },
            icon: Icon(
              Icons.book_rounded,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
        title: Text(
          "Lesson ${widget.lessonNumber}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return WordCard(
            word: words[index],
          );
        },
      ),
    );
  }
}
