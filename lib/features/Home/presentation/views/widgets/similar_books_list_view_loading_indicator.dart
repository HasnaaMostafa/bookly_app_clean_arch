import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_fading_widget.dart';
import 'custom_book_image_loading_indicator.dart';

class SimilarBooksListViewLoadingIndicator extends StatelessWidget {
  const SimilarBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .17,
        child: ListView.builder(
            itemCount: 15,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                  child: CustomBookImageLoadingIndicator());
            }),
      ),
    );
  }
}
