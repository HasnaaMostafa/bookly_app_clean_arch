import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_actions.dart';
import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.32),
          child: CustomBookImage(
            imageUrl: bookEntity.image ?? "",
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookEntity.title ?? "",
          style: Styles.textStyle30.copyWith(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          bookEntity.authorName ?? ' ',
          style: Styles.textStyle18.copyWith(color: const Color(0xff707070)),
        ),
        const SizedBox(
          height: 14,
        ),
        BookRating(
          rating: bookEntity.rating ?? 0,
          count: bookEntity.ratingCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksActions(
          bookEntity: bookEntity,
        ),
      ],
    );
  }
}
