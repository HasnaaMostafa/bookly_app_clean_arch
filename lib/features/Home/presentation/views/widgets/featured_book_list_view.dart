import 'package:bookly_app_clean_arch/features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedBookListView extends StatefulWidget {
  const FeaturedBookListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBookListView> createState() => _FeaturedBookListViewState();
}

class _FeaturedBookListViewState extends State<FeaturedBookListView> {
  late final ScrollController scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: scrollController,
          itemCount: widget.books.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push("/bookDetailsView", extra: widget.books[index]);
                  BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
                      category: widget.books[index].categories!);
                },
                child: CustomBookImage(
                  imageUrl: widget.books[index].image ?? "",
                ),
              ),
            );
          }),
    );
  }
}
