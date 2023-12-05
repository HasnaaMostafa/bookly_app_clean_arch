import 'package:bookly_app_clean_arch/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  // var searchController = TextEditingController();
  // BookModel? bookModel;
  //
  // void saveBookModel() {
  //   CacheHelper.saveBookModelToSharedPreferences(bookModel!);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        onSubmitted: (data) {
          // CacheHelper.saveSearchWord(widget.searchController.text);
          BlocProvider.of<SearchBooksCubit>(context)
              .searchBooks(searchWord: data);
          // widget.searchController.clear();
        },
        controller: widget.searchController,
        decoration: InputDecoration(
            hintText: "search",
            suffixIcon: Opacity(
                opacity: 0.6,
                child: IconButton(
                  onPressed: () {
                    // saveBookModel();
                    // CacheHelper.saveSearchWord(widget.searchController.text);
                    BlocProvider.of<SearchBooksCubit>(context)
                        .searchBooks(searchWord: widget.searchController.text);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 18,
                    color: Colors.white,
                  ),
                )),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder()),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
