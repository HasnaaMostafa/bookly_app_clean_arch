import 'package:bookly_app_clean_arch/core/utils/function/custom_snack_bar.dart';
import 'package:bookly_app_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/similar_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer(
      {super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is SimilarBooksErrorPagination) {
          return showCustomSnackBar(context, state.error.toString());
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess ||
            state is SimilarBooksLoadingPagination ||
            state is SimilarBooksErrorPagination) {
          return SimilarBooksListView(
            books: books,
            scrollController: widget.scrollController,
          );
        } else if (state is SimilarBooksError) {
          return CustomErrorWidget(errMessage: state.error);
        } else {
          return const SimilarBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
