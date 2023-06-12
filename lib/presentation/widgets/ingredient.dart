import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String unit;
  final bool isFirst;
  final bool isLast;

  const Ingredient({
    required this.imageUrl,
    required this.productName,
    required this.unit,
    this.isFirst = false,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? const Radius.circular(16) : Radius.zero,
          topRight: isFirst ? const Radius.circular(16) : Radius.zero,
          bottomLeft: isLast ? const Radius.circular(16) : Radius.zero,
          bottomRight: isLast ? const Radius.circular(16) : Radius.zero,
        ),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        selected: false,
        contentPadding: const EdgeInsets.only(top: 16, left: 16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(productName),
        subtitle: Text(unit),
      ),
    );
  }
}
