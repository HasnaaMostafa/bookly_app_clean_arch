import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/views/widgets/newest_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
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
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: const [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 30, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(
                  height: 20,
                ),
                FeaturedBookListViewBlocConsumer(),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 5),
                  child: Text(
                    "Newest",
                    style: Styles.textStyle18,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: NewestBookListViewBlocConsumer()),
        )
      ],
    );
  }
}
