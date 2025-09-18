import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/favoriets/presentation/manger/homebookscubit/favecubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gp/core/utilits/popups.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';
import 'package:gp/featuers/home/presntation/widgets/categoriesitem.dart';
import 'package:gp/featuers/home/presntation/widgets/custombookbotton.dart';
import 'package:gp/featuers/home/presntation/widgets/openbookbottons.dart';
import 'package:gp/featuers/home/presntation/widgets/stars.dart';
import 'package:gp/featuers/home/presntation/widgets/suggestedlist.dart';
import 'package:gp/featuers/payment/preasentation/views/paymentscreen.dart';
class BookDetailsreadybody extends StatefulWidget {
  const BookDetailsreadybody({
    super.key,
    required this.book,
    required this.index,
    
  });

  final BookModel book;
  final String index;


  @override
  State<BookDetailsreadybody> createState() => _BookDetailsreadybodyState();
}

class _BookDetailsreadybodyState extends State<BookDetailsreadybody> {
  
  late BookModel book;
  late bool isLoved;
bool isloading=false;

  @override
void initState() {
  super.initState();
 
  book = widget.book;
  isLoved = widget.book.isfav;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () async {
              setState(() {
                isLoved = !isLoved;
              });
        
              await Bookservice().toggle(id: book.id);
              BlocProvider.of<FavCubit>(context).getFavBooks();
        
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: color,
                  content: Text(
                    isLoved
                        ? 'The book is added to favorites!'
                        : 'The book is removed from favorites!',
                    style: const TextStyle(color: Colors.white),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.all(8),
                ),
              );
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                isLoved ? Icons.favorite : Icons.favorite_border,
                key: ValueKey<bool>(isLoved),
                color: isLoved ? Colors.red : Colors.black,
                size: 30,
              ),
            ),
          ),
        )
      ],),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: book.ispurchased
            ? null
            : BookBotton(isloading: isloading,
               onpressed: () async {
      setState(() {
    isloading = true;
      });
    
      final prefs = await SharedPreferences.getInstance();
      final userPrefs = UserPrefs(prefs);
      final phone = userPrefs.getUser()['phone'] ?? '';
    
      if (phone.isNotEmpty) {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymobPaymentPage(bookid: book.id),
      ),
    );
      } else {
     Popups().showAddPhoneNumberDialog(
      context,
      () => Navigator.pushNamed(context, '/edit profile'),
    );
      }
    
      setState(() {
    isloading = false;
      });
    },
    
                name: 'Buy',
              ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
       
    
    
    
    
    
    
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: widget.index,
              child: SizedBox(
                height: 340.h,
                width: 222.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(book.cover, fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            child: Text(
              book.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 5),
          Align(
            child: Text(
              book.author.name,
              style: TextStyle(color: opacitycolor2, fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            child: Text(
              '${book.price} EGP',
              style: TextStyle(color: pricecolor, fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 4),
          Stars(book: book),
          const SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [ 
          const  SizedBox(width: 16,),
            Text('Pages: ', style: TextStyle(color: opacitycolor2, fontSize: 15.sp, fontWeight: FontWeight.w600)),
            Text(book.pages.toString(), style: TextStyle(color: color, fontSize: 15.sp, fontWeight: FontWeight.w600)),
    Expanded(child: Container()),
            Text("Language: ", style: TextStyle(color: opacitycolor2, fontSize: 15.sp, fontWeight: FontWeight.w600)),
            Text(book.language.substring(0,2).toUpperCase(), style: TextStyle(color: color, fontSize: 15.sp, fontWeight: FontWeight.w600)),
          const  SizedBox(width: 16,)
          ],),
          const SizedBox(height: 10),
          if (book.ispurchased)
            OpenBookBottons(book: book),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('overview', style: TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24),
            child: Text(
              book.description,
              maxLines: 4,
              style: TextStyle(color: color, fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 68,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: book.categories.length,
              itemBuilder: (context, index) {
                return CategoriesItem(category: book.categories[index].name);
              },
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('about the author', style: TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24),
            child: Text(
              book.author.bio,
              maxLines: 4,
              style: TextStyle(color: color, fontSize: 14.sp, height: 2, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('suggestions', style: TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.w600)),
          ),
          Suggestedlist(book: book),
        ],
      ),
    );
  }
}

