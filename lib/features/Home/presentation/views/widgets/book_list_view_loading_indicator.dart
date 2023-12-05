import 'package:flutter/material.dart';

import 'Book_list_view_item_loading_indicator.dart';

class BooksListViewLoadingIndicator extends StatelessWidget {
  const BooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) =>
            const BookListViewItemLoadingIndicator());
  }
}
