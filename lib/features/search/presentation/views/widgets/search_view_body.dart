import 'package:bookly_app_clean_arch/features/search/presentation/views/widgets/search_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/search_books_cubit/search_books_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late final ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();
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
        await BlocProvider.of<SearchBooksCubit>(context).searchBooks(
            searchWord: searchController.text, pageNumber: nextPage++);
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            searchController: searchController,
          ),
          const Text(
            "Search result",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: SearchListViewBlocConsumer(
            scrollController: scrollController,
          )),
        ],
      ),
    );
  }
}
