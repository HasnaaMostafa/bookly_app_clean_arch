part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  List<BookEntity> books;
  SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksLoadingPagination extends SimilarBooksState {}

class SimilarBooksError extends SimilarBooksState {
  final String error;
  SimilarBooksError(this.error);
}

class SimilarBooksErrorPagination extends SimilarBooksState {
  final String error;
  SimilarBooksErrorPagination(this.error);
}
