import 'dart:async';
import 'package:flutter/material.dart';

class VerticalFlipText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double maxWidth;
  final Duration interval;
  final Duration animationDuration;

  const VerticalFlipText({
    super.key,
    required this.text,
    required this.style,
    required this.maxWidth,
    this.interval = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 150),
  });

  @override
  State<VerticalFlipText> createState() => _VerticalFlipTextState();
}

class _VerticalFlipTextState extends State<VerticalFlipText> {
  int _currentIndex = 0;
  Timer? _timer;
  List<String> _splitTexts = [];
  double? _lastMaxWidth;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    if (_splitTexts.length > 1) {
      _timer = Timer.periodic(widget.interval, (timer) {
        if (mounted) {
          setState(() {
            _currentIndex = (_currentIndex + 1) % _splitTexts.length;
          });
        }
      });
    }
  }

  List<String> _splitText(
    String text,
    double maxWidth,
    TextStyle style,
    BuildContext context,
  ) {
    // We use the provided maxWidth directly now, as it's passed from the parent.
    final double safeMaxWidth = maxWidth - 8.0; // 8px safety buffer

    if (safeMaxWidth <= 0) return [text];

    final List<String> result = [];
    final words = text.split(' ');
    String currentLine = '';

    for (final word in words) {
      // Handle words that are individually longer than safeMaxWidth
      final wordPainter = TextPainter(
        text: TextSpan(text: word, style: style),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: double.infinity);

      if (wordPainter.width > safeMaxWidth) {
        // If there's a current line, add it first
        if (currentLine.isNotEmpty) {
          result.add(currentLine);
          currentLine = '';
        }
        // Add the oversized word as its own line (it will be clipped but won't crash)
        result.add(word);
        continue;
      }

      final testLine = currentLine.isEmpty ? word : '$currentLine $word';
      final textPainter = TextPainter(
        text: TextSpan(text: testLine, style: style),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: double.infinity);

      if (textPainter.width <= safeMaxWidth) {
        currentLine = testLine;
      } else {
        if (currentLine.isNotEmpty) {
          result.add(currentLine);
        }
        currentLine = word;
      }
    }

    if (currentLine.isNotEmpty) {
      result.add(currentLine);
    }

    return result.isEmpty ? [text] : result;
  }

  @override
  Widget build(BuildContext context) {
    if (_lastMaxWidth != widget.maxWidth) {
      _lastMaxWidth = widget.maxWidth;
      _splitTexts = _splitText(
        widget.text,
        widget.maxWidth,
        widget.style,
        context,
      );
      _currentIndex = 0;
      _startTimer();
    }

    if (_splitTexts.isEmpty) return const SizedBox.shrink();

    return AnimatedSwitcher(
      duration: widget.animationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);

        return ClipRect(
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: Text(
        _splitTexts[_currentIndex],
        key: ValueKey<String>('${_splitTexts[_currentIndex]}_$_currentIndex'),
        style: widget.style,
        textAlign: TextAlign.right,
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
