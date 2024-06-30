import 'package:flutter/material.dart';

extension StringCapitalizeExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }

    List<String> words = split(' ');
    words = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      } else {
        return word;
      }
    }).toList();

    return words.join(' ');
  }
}

extension StyledText on String {
  Text applyStyle({
    TextStyle defaultStyle = const TextStyle(), // Default style for other words
    Map<String, TextStyle> wordStyles =
        const {}, // Map of target words to styles
    TextAlign textAlign =
        TextAlign.center, // Text alignment for the whole sentence
  }) {
    final List<TextSpan> spans = [];

    split(' ').forEach((word) {
      final TextStyle wordStyle = wordStyles[word] ?? defaultStyle;
      spans.add(
        TextSpan(
          text: '$word ',
          style: wordStyle,
        ),
      );
    });

    return Text.rich(
      TextSpan(
        children: spans,
      ),
      textAlign: textAlign,
    );
  }
}
