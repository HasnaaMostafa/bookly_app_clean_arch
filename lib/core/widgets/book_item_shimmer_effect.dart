import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/Home/presentation/views/widgets/custom_book_image_loading_indicator.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          const CustomBookImageLoadingIndicator(),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 45),
                    Container(
                      width: 80,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
