import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SkipButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const SkipButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          const Gap(10),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
