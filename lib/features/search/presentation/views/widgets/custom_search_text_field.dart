import 'package:bookly_app_clean_arch/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.searchController});

  final TextEditingController searchController;

  // var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        onSubmitted: (data) {
          BlocProvider.of<SearchBooksCubit>(context)
              .searchBooks(searchWord: data);
          // searchController.clear();
        },
        controller: searchController,
        decoration: InputDecoration(
            hintText: "search",
            suffixIcon: Opacity(
                opacity: 0.6,
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<SearchBooksCubit>(context)
                        .searchBooks(searchWord: searchController.text);
                    // searchController.clear();
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
