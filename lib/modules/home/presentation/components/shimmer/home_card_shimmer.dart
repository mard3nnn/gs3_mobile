import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeCardShimmer extends StatelessWidget {
  const HomeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
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
          height: 300,
        ),
      ),
    );
  }
}
