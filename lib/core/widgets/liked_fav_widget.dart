import 'package:flutter/material.dart';

class FavStateWidget extends StatelessWidget {
  final int trackRating;
  final int numFav;
  const FavStateWidget(
      {super.key, required this.trackRating, required this.numFav});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text((trackRating / 10).toStringAsFixed(1))
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Text((numFav).toStringAsFixed(0))
          ],
        )
      ],
    );
  }
}
