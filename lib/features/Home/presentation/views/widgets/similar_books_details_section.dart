import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/similar_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksSection extends StatefulWidget {
  const SimilarBooksSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  State<SimilarBooksSection> createState() => _SimilarBooksSectionState();
}

class _SimilarBooksSectionState extends State<SimilarBooksSection> {
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
    if (currentPosition >= 0.5 * maxScrollPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
            pageNumber: nextPage++, category: widget.bookEntity.categories);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            "You can also like",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SimilarBooksListViewBlocConsumer(
            scrollController: scrollController,
          ),
        ),
      ],
    );
  }
}
