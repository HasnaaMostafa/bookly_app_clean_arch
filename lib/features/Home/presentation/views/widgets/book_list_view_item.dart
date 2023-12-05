import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookListViewItem extends StatefulWidget {
  const BookListViewItem({super.key, required this.book});
  final BookEntity? book;

  @override
  State<BookListViewItem> createState() => _BookListViewItemState();
}

class _BookListViewItemState extends State<BookListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push("/bookDetailsView", extra: widget.book);
          setState(() {
            BlocProvider.of<SimilarBooksCubit>(context)
                .fetchSimilarBooks(category: widget.book!.categories!);
          });
        },
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              CustomBookImage(imageUrl: widget.book?.image ?? ""),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      widget.book?.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: "GT Sectra Fine"),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Flexible(
                    child: Text(
                      widget.book!.authorName ?? '',
                      style: Styles.textStyle14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 44.3,
                      ),
                      BookRating(
                        rating: widget.book?.rating ?? 0,
                        count: widget.book?.ratingCount ?? 0,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
