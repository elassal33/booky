

abstract class Homestates {}

class BooksIntial extends Homestates {}

class BooksLoading extends Homestates {}

class LoadingMore extends Homestates {}

class BooksLoaded extends Homestates {}

class BooksFailed extends Homestates {
  final String message;
  BooksFailed({required this.message});
}
