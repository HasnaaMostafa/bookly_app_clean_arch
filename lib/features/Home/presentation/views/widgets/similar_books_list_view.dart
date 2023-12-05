import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView(
      {super.key, required this.books, required this.scrollController});

  final List<BookEntity> books;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
          controller: scrollController,
          itemCount: books.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push("/bookDetailsView", extra: books[index]);
                  BlocProvider.of<SimilarBooksCubit>(context)
                      .fetchSimilarBooks(category: books[index].categories!);
                },
                child: CustomBookImage(
                  imageUrl: books[index].image ?? ""
                  // imageUrl: state.books[index].volumeInfo.imageLinks!
                  //
                  //        .thumbnail ??
                  ,
                ),
              ),
            );
          }),
    );
  }
}
