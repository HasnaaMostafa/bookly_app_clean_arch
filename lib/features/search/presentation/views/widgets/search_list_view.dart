import 'package:flutter/material.dart';

import '../../../../Home/domain/entities/book_entity.dart';
import '../../../../Home/presentation/views/widgets/book_list_view_item.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({
    super.key,
    required this.books,
    required this.scrollController,
  });
  final List<BookEntity> books;
  final ScrollController scrollController;
  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  // late final ScrollController scrollController;
  // var nextPage = 1;
  // var isLoading = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   scrollController = ScrollController();
  //   scrollController.addListener(scrollListener);
  // }
  //
  // var searchWord = CacheHelper.getSearchWord("searchWord") as String;
  //
  // void scrollListener() async {
  //   var currentPosition = scrollController.position.pixels;
  //   var maxScrollPosition = scrollController.position.maxScrollExtent;
  //   if (currentPosition >= 0.5 * maxScrollPosition) {
  //     if (!isLoading) {
  //       isLoading = true;
  //       await BlocProvider.of<SearchBooksCubit>(context)
  //           .searchBooks(searchWord: searchWord, pageNumber: nextPage++);
  //       isLoading = false;
  //     }
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: widget.books.length,
      itemBuilder: (BuildContext context, int index) {
        return BookListViewItem(
          book: widget.books[index],
        );
      },
    );
  }
}
