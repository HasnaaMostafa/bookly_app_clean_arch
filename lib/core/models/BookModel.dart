import 'package:bookly_app_clean_arch/features/Home/domain/entities/book_entity.dart';

import 'AccessInfo.dart';
import 'SaleInfo.dart';
import 'SearchInfo.dart';
import 'VolumeInfo.dart';

class BookModel extends BookEntity {
  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
            image: volumeInfo.imageLinks!.thumbnail ?? "",
            bookId: id!,
            title: volumeInfo.title!,
            authorName: volumeInfo.authors?.isNotEmpty == true
                ? volumeInfo.authors!.first.split(' ').take(3).join(' ')
                : " ",
            price: 0.0,
            rating: volumeInfo.averageRating,
            categories: volumeInfo.categories?.isNotEmpty == true
                ? volumeInfo.categories!.first.split(' ').take(3).join(' ')
                : "",
            link: volumeInfo.previewLink ?? "",
            ratingCount: volumeInfo.ratingsCount);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
      accessInfo: json['accessInfo'] != null
          ? AccessInfo.fromJson(json['accessInfo'])
          : null,
      id: json['id'],
      kind: json['kind'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      saleInfo:
          json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null,
      searchInfo: json['searchInfo'] != null
          ? SearchInfo.fromJson(json['searchInfo'])
          : null,
    );
  }
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  late VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    map['volumeInfo'] = volumeInfo.toJson();
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }
}
