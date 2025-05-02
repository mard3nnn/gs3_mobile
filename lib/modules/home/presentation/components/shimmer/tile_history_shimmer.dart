import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TileHistoryShimmer extends StatelessWidget {
  const TileHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.15),
        highlightColor: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
