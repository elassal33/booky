class BookModel{
  const BookModel({  required this.id,
    required this.title,
    required this.pdf,
    required this.record,
    required this.description,
    required this.price,
    required this.rate,
    required this.israted,
    required this.cover,
    required this.pages,
    required this.isfav,
    required this.ispurchased,
    required this.language,
    required this.categories,
    required this.author,});


  final int id;
  final String title;
  final String? pdf;
  final String? record;
  final String description;
  final String price;
  final int rate;
  final bool israted;
  final String cover;
  final int pages;
  final bool isfav;
  final bool ispurchased;
  final String language;
  final List<Category> categories;
  final Author author;
factory BookModel.fromjson(json){
  return BookModel(
   id: json['id'],
   pdf: json['pdf'],
   record: json['record'],
    title:json['title'],
     description: json['description'],
     isfav: json['is_favorite'],
   ispurchased:  json['is_purchased'],
      price: json['price'],
      rate: json['rate'],
      israted: json['is_rated'],
      cover: json['cover'],
      pages: json['pages'],
      language: json['language'],
      categories: (json['categories'] as List?)?.map((e) => Category.fromjson(e)).toList() ?? [],
            author: Author.fromjson(json['author']));
}
@override
  String toString() {
    return 'BookModel(id: $id, title: $title, description: $description, price: $price, rate: $rate, cover: $cover, pages: $pages, language: $language, isPurchased: $ispurchased, isFavorite: $isfav, categories: $categories, author: $author)';
  }
}

class Author {
   final int id;
  final String name;
  final String bio;
  final String image;

  Author({required this.id, required this.name, required this.bio, required this.image});
  factory Author.fromjson(json){
    return Author(id: json['id'], name: json['name'], bio: json['bio'], image: json['image']);
  }
   @override
  String toString() {
    return 'AuthorModel(id: $id, name: $name, bio: $bio, image: $image)';
  }
}
class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});
 factory Category.fromjson(json){
    return Category(id: json['id'], name: json['name'], );
  }
 /* @override
  String toString() {
    return 'Category(id: $id, name: $name)';
  }*/
}
class BookDetailResponse {
  final BookModel book;
  final List<BookModel> suggestedBooks;

  BookDetailResponse({required this.book, required this.suggestedBooks});

  factory BookDetailResponse.fromJson(json) {
    final data = json['data'];
    return BookDetailResponse(
      book: BookModel.fromjson(data['book']),
      suggestedBooks: (data['suggested_books'] as List)
          .map((e) => BookModel.fromjson(e))
          .toList(),
    );
    
  }
  @override
  String toString() {
    return 'BookDetailResponse(book: $book, suggestedBooks: $suggestedBooks)';
  }
}
