import 'package:bookly_app_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/function/custom_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_list_view_loading_indicator.dart';

class NewestBookListViewBlocConsumer extends StatefulWidget {
  const NewestBookListViewBlocConsumer({super.key});

  @override
  State<NewestBookListViewBlocConsumer> createState() =>
      _NewestBookListViewBlocConsumerState();
}

class _NewestBookListViewBlocConsumerState
    extends State<NewestBookListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationError) {
          return showCustomSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksLoadingPagination ||
            state is NewestBooksPaginationError) {
          return NewestBookListView(
            books: books,
          );
        } else if (state is NewestBooksError) {
          return CustomErrorWidget(errMessage: state.error.toString());
        } else {
          return const BooksListViewLoadingIndicator();
        }
      },
    );
  }
}
