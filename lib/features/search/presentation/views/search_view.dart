import 'package:bookly_app_clean_arch/core/utils/service_locator.dart';
import 'package:bookly_app_clean_arch/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app_clean_arch/features/search/domain/use_cases/search_use_case.dart';
import 'package:bookly_app_clean_arch/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app_clean_arch/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBooksCubit(SearchedBooksUseCase(getIt.get<SearchRepoImpl>())),
      child: SafeArea(
        child: Scaffold(
          body: SearchViewBody(),
        ),
      ),
    );
  }
}
