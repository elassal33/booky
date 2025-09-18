 import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/homebookscubit/homestates.dart';

class HomeCubit extends Cubit<Homestates> {
  int _page = 1;
  final int _limit = 9;
  bool isLoadingMore = false;
  bool hasMore = true;

  List<BookModel> books = [];
  List<Author?> authors = [];
  List<Category> categories = [];

  HomeCubit() : super(BooksIntial());

void loadBooks({bool isInitialLoad = false, required int id}) async {
  if (isLoadingMore || (!hasMore && !isInitialLoad)) return;

  // Reset for initial load
  if (isInitialLoad) {
    _page = 1;
    hasMore = true;
    books.clear();
  }

  if (!isClosed) {
    emit(isInitialLoad ? BooksLoading() : LoadingMore());
  }
  
  isLoadingMore = true;

  try {
    Bookservice service = Bookservice();
    final newBooks = await service.fetchBooks(
      page: _page,
      limit: _limit,
      id: id,
    );

    if (newBooks == null) {
      if (!isClosed) emit(BooksFailed(message: 'Failed to fetch books'));
      return;
    }

    if (newBooks.isEmpty) {
      hasMore = false;
    } else {
      books.addAll(newBooks);
      _page++;
    }

    if (!isClosed) emit(BooksLoaded());
  } on DioException catch (e) {
    if (!isClosed) emit(BooksFailed(message: 'Network error: ${e.message}'));
  } catch (e) {
    if (!isClosed) emit(BooksFailed(message: 'Unexpected error: $e'));
  } finally {
    isLoadingMore = false;
  }
}
  void loadauthors({bool isInitialLoad = false}) async {
  // Prevent duplicate calls
  if (isLoadingMore || (!hasMore && !isInitialLoad)) return;

  // Reset for initial load
  if (isInitialLoad) {
    _page = 1;
    hasMore = true;
    authors.clear();
    emit(BooksLoading());
  } else {
    emit(LoadingMore());
  }

  isLoadingMore = true;

  try {
    final newAuthors = await Bookservice().fetchAuthors(
      page: _page,
      limit: _limit,
    );

    if (newAuthors == null) {
      if (!isClosed) emit(BooksFailed(message: 'Failed to load authors'));
      return;
    }

    if (newAuthors.isEmpty) {
      hasMore = false;
      if (authors.isEmpty) {
        if (!isClosed) emit(BooksFailed(message: 'No authors found'));
      } else {
        if (!isClosed) emit(BooksLoaded());
      }
    } else {
      authors.addAll(newAuthors);
      _page++;
      if (!isClosed) emit(BooksLoaded());
    }
  } on DioException catch (e) {
    final message = e.response?.statusCode == 404 
      ? 'Authors not found' 
      : 'Network error: ${e.message}';
    if (!isClosed) emit(BooksFailed(message: message));
  } catch (e) {
    if (!isClosed) emit(BooksFailed(message: 'Unexpected error: ${e.toString()}'));
  } finally {
    isLoadingMore = false;
  }
}
}