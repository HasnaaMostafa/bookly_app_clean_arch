import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/similar_books_details_section.dart';
import 'package:flutter/material.dart';

import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsSection(
                bookEntity: book,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              if (book.categories != "")
                SimilarBooksSection(
                  bookEntity: book,
                ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}
