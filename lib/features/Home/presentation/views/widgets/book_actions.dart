import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/function/launch_url.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            borderRadius: bookEntity.link != null
                ? const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))
                : const BorderRadius.all(Radius.circular(12)),
            text: "Free",
            textStyle: Styles.textStyle18
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
          )),
          if (bookEntity.link != null)
            Expanded(
                child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, bookEntity.link!);
              },
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              text: "Preview",
              textStyle: Styles.textStyle16
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            )),
        ],
      ),
    );
  }
}
