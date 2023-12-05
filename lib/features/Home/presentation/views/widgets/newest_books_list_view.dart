import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'book_list_view_item.dart';

class NewestBookListView extends StatelessWidget {
  const NewestBookListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return BookListViewItem(
            book: books[index],
          );
        });
  }
}
