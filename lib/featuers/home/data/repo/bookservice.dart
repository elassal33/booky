import 'package:dio/dio.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookservice {
Future<String?>  gettoken()async{
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = UserPrefs(prefs);

    // Get token from SharedPreferences
    final token = userPrefs.getUser()['token'];
    return token;
  }
   final Dio _dio = Dio();

 Future<List<BookModel>?> fetchBooks({
  required int page,
  required int limit,
  required int id,
}) async {
  final token = await gettoken();
  
  
    final response = await _dio.get(
      id == 0 
        ? '$baseurl/api/v1/books?pagination=1' 
        : '$baseurl/api/v1/books?pagination=1&filter[category_id]=$id',
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
      queryParameters: {
        'limit': limit,
        'page': page,
      },
    );

    print('Status Code: ${response.statusCode}');
    
    if (response.statusCode == 200) {
      print("donnnnnnnnnnnnnnnnnne");
      final data = response.data['data']['books'];
      final books = data.map<BookModel>((element) => BookModel.fromjson(element)).toList();
      return books;
    } else {
      print('Non-200 status code: ${response.statusCode}');
      return null;
    }
 
}
 Future<List<Author>?> fetchAuthors({
  required int page,
  required int limit,
}) async {
  final token = await gettoken();
  
  try {
    final response = await _dio.get(
      '$baseurl/api/v1/authors?pagination=1',
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
      queryParameters: {
        'limit': limit,
        'page': page,
      },
    );

    print('Authors API Status: ${response.statusCode}');
    
    if (response.statusCode == 200) {
      final data = response.data['data']['authors'];
      return data.map<Author>((element) => Author.fromjson(element)).toList();
    } 
    
    if (response.statusCode == 404) {
      print('Authors endpoint not found');
      return [];
    }
    
    print('Failed to fetch authors: ${response.statusCode}');
    return null;
    
  } on DioException catch (e) {
    print('Dio Error fetching authors: ${e.message}');
    if (e.response != null) {
      print('Error response: ${e.response?.data}');
    }
    return null;
  } catch (e) {
    print('Unexpected error fetching authors: $e');
    return null;
  }
}
  
 Future<List<Category>> getCategories() async {

  final token = await gettoken();
  
  try {
    final response = await _dio.get(
      '$baseurl/api/v1/lookups',
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
        headers: {
          'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      ),
    );

    print('Categories API Status: ${response.statusCode}');
    
    if (response.statusCode == 200) {
      final List categoryList = response.data['data']['categories'];
      print('Categories data: $categoryList');
      return categoryList.map((e) => Category.fromjson(e)).toList();
    } 
    
    print('Failed with status: ${response.statusCode}');
    return [];
    
  } on DioException catch (e) {
    print('Dio Error: ${e.message}');
    if (e.response != null) {
      print('Error response: ${e.response?.data}');
    }
    return [];
  } catch (e) {
    print('Unexpected error: $e');
    return [];
  }
}
  Future fetchsuggestedBooks({required int id}) async {
  
final token = await gettoken();
  try {
    final response = await _dio.get('$baseurl/api/v1/books/$id', options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            
 headers: {
  'Authorization': 'Bearer $token',
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),);

    if (response.statusCode == 200) {

    print(response.data);
      return BookDetailResponse.fromJson(response.data);
    } else {
      return null;
      
     
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
  Future toggle({required int id}) async {
  
final token = await gettoken();
  try {
    final response = await _dio.put('$baseurl/api/v1/books/favorites/$id', options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            
 headers: {
  'Authorization': 'Bearer $token',
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),);

    if (response.statusCode == 200) {

    
  print('done');
    } else {
      throw Exception('Failed to load $id');
     
    }
  } catch (e) {
    print('Error: $e');
    return null ;
  }
}
  Future <List<BookModel>?> fetchAuthorBooks({required int id}) async {
    final token = await gettoken();
    try {
      final response = await _dio.get('$baseurl/api/v1/books?filter[author_id]=$id',
        options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
 headers: {
  'Authorization': 'Bearer $token',
  "Content-Type":"application/json",
  "Accept" : "application/json"
 }
        
      ),
  
      );
print(response.statusCode);
      if (response.statusCode == 200) {
var data=response.data['data']['books'];
List <BookModel>books=[];
        for (var element in data ) {

  books.add(BookModel.fromjson(element));
          
        }
        
        return books;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      
      print("Request failed: $e");
      return null;
    }
    
    
  }
   Future rate({required int id,required int rate}) async {
  
final token = await gettoken();
  try {
    final response = await _dio.put('$baseurl/api/v1/books/rate/$id', options: Options(
              followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            
 headers: {
  'Authorization': 'Bearer $token',
  "Content-Type":"application/json",
  "Accept" : "application/json"
 },
 
        
      ),data: {
        "rate":rate

      },);

    if (response.statusCode == 200) {

    
  print(' rate done');
    } else {
      throw Exception('Failed to load $id');
     
    }
  } catch (e) {
    print('Error: $e');
    return null ;
  }
}
}