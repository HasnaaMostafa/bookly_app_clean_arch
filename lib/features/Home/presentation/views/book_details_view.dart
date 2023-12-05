import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(
          book: bookEntity,
        ),
      ),
    );
  }
}
