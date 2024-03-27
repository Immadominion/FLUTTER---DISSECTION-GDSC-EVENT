import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  final List<String> items;
  final double? textHeight;

  const BulletList({
    Key? key,
    required this.items,
    this.textHeight = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items) _BulletListItem(text: item),
      ],
    );
  }
}

class _BulletListItem extends StatelessWidget {
  final String text;
  final double? textHeight;

  const _BulletListItem({
    required this.text,
    this.textHeight,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayMedium?.copyWith(
          color: Colors.white,
          height: textHeight ?? 0.8,
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('\u2022', style: textStyle),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(text, style: textStyle),
        ),
      ],
    );
  }
}
