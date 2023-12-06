import 'package:bookly_app_clean_arch/core/utils/function/custom_snack_bar.dart';
import 'package:bookly_app_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_clean_arch/core/widgets/custom_loading_indicator_widget.dart';
import 'package:bookly_app_clean_arch/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app_clean_arch/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/domain/entities/book_entity.dart';

class SearchListViewBlocConsumer extends StatefulWidget {
  const SearchListViewBlocConsumer({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<SearchListViewBlocConsumer> createState() =>
      _SearchListViewBlocConsumerState();
}

class _SearchListViewBlocConsumerState
    extends State<SearchListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {
        if (state is SearchBooksLoading) {
          books.clear();
        }
        if (state is SearchBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is SearchBooksErrorPagination) {
          return showCustomSnackBar(context, state.error.toString());
        }
      },
      builder: (context, state) {
        if (state is SearchBooksSuccess ||
            state is SearchBooksLoadingPagination ||
            state is SearchBooksErrorPagination) {
          return SearchListView(
            books: books,
            scrollController: widget.scrollController,
          );
        } else if (state is SearchBooksError) {
          return CustomErrorWidget(errMessage: state.error.toString());
        } else if (state is SearchBooksLoading) {
          return const CustomLoadingIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
