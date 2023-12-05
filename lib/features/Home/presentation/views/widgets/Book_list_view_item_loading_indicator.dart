import 'package:flutter/material.dart';

import '../../../../../core/widgets/book_item_shimmer_effect.dart';

class BookListViewItemLoadingIndicator extends StatelessWidget {
  const BookListViewItemLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(height: 125, child: ShimmerEffect()),
    );
  }
}
