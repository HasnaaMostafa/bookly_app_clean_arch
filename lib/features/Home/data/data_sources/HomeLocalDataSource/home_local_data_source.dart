import 'package:bookly_app_clean_arch/core/utils/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
  // List<BookEntity> fetchSimilarBooks({required String category});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;

    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;

    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // @override
  // List<BookEntity> fetchSimilarBooks({required String category}) {
  //   var box = Hive.box<BookEntity>(saveSimilarBooks(category: category));
  //   return box.values.toList();
  // }
}
