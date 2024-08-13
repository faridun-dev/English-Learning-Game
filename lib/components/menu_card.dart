import 'package:eng_game_app/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuCard extends StatelessWidget {
  String title;
  void Function()? onPressed;
  bool lock = false;
  MenuCard({
    super.key,
    required this.title,
    required this.onPressed,
    required this.lock,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
          decoration: BoxDecoration(
            color: menuCardColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
            boxShadow: [
              BoxShadow(
                color: menuCardShadow,
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: fontColorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Icon(
                lock ? Icons.lock_rounded : Icons.lock_open_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
