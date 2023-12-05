part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksLoadingPagination extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;
  NewestBooksSuccess(this.books);
}

class NewestBooksError extends NewestBooksState {
  final String error;
  NewestBooksError(this.error);
}

class NewestBooksPaginationError extends NewestBooksState {
  final String error;
  NewestBooksPaginationError(this.error);
}
