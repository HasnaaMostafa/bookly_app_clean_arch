part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksError extends FeaturedBooksState {
  final String error;
  FeaturedBooksError(this.error);
}

class FeaturedBooksPaginationError extends FeaturedBooksState {
  final String error;
  FeaturedBooksPaginationError(this.error);
}
