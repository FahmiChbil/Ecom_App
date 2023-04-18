import 'package:flutter/material.dart';

class ImageNumber extends StatelessWidget {
  const ImageNumber({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            4,
            (index) => Container(
              height: 9,
              width: 15,
              decoration: BoxDecoration(
                  color:
                      index == pageIndex ? Colors.white : Colors.grey.shade600,
                  shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
