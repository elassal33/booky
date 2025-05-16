import 'package:dio/dio.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchService  {
   final Dio _dio = Dio();

  Future <List<BookModel>> fetchBooks({ String? name}) async {
     final prefs = await SharedPreferences.getInstance();
          final userPrefs = UserPrefs(prefs);
          final  token = userPrefs.getUser()['token'];

    try {
      final response = await _dio.get('$baseurl/api/v1/books?filter[search]=$name',
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
      }
    } catch (e) {
      print("Request failed: $e");
    }
    
    return [];
  }
  
}