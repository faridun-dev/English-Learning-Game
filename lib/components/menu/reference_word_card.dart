import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/styles.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

// ignore: must_be_immutable
class ReferenceWordCard extends StatefulWidget {
  WordModel word;
  ReferenceWordCard({
    super.key,
    required this.word,
  });

  @override
  State<ReferenceWordCard> createState() => _ReferenceWordCardState();
}

class _ReferenceWordCardState extends State<ReferenceWordCard> {
  bool _checked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _checked = widget.word.counter > 20 ? true : false;
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        // final player = AudioPlayer();
        // player.play(AssetSource("path/to/audio/"));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 10,
          right: 10,
        ),
        child: Container(
          padding: const EdgeInsets.all(
            30,
          ),
          decoration: wordCardBoxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    widget.word.word,
                    style: wordTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.word.translation,
                    style: translationTextStyle,
                  ),
                ],
              ),
              AdvancedSwitch(
                initialValue: _checked,
                onChanged: _checked
                    ? (value) async {
                        setState(() {
                          _checked = true;
                        });
                        widget.word.counter = 0;
                        await WordsDatabase.instance.updateCounter(widget.word);
                      }
                    : null,
                activeColor: appBarColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
