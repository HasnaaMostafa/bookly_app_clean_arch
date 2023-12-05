part of 'search_books_cubit.dart';

abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksLoadingPagination extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;
  SearchBooksSuccess(this.books);
}

class SearchBooksError extends SearchBooksState {
  final String error;
  SearchBooksError(this.error);
}

class SearchBooksErrorPagination extends SearchBooksState {
  final String error;
  SearchBooksErrorPagination(this.error);
}
