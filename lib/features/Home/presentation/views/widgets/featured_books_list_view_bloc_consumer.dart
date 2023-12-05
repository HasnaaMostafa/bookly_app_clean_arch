import 'package:bookly_app_clean_arch/core/utils/function/custom_snack_bar.dart';
import 'package:bookly_app_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'featured_book_list_view.dart';

class FeaturedBookListViewBlocConsumer extends StatefulWidget {
  const FeaturedBookListViewBlocConsumer({super.key});

  @override
  State<FeaturedBookListViewBlocConsumer> createState() =>
      _FeaturedBookListViewBlocConsumerState();
}

class _FeaturedBookListViewBlocConsumerState
    extends State<FeaturedBookListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (BuildContext context, Object state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }

      if (state is FeaturedBooksPaginationError) {
        return showCustomSnackBar(context, state.error);
      }
    }, builder: (BuildContext context, Object state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationError) {
        return FeaturedBookListView(
          books: books,
        );
      } else if (state is FeaturedBooksError) {
        return CustomErrorWidget(errMessage: state.error.toString());
      } else {
        return const FeaturedBookListViewLoadingIndicator();
      }
    });
  }
}
