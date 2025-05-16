import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/presntation/widgets/categoriesitem.dart';
import 'package:gp/featuers/home/presntation/widgets/custombookbotton.dart';
import 'package:gp/featuers/home/presntation/widgets/favicon.dart';
import 'package:gp/featuers/home/presntation/widgets/suggestedlist.dart';
import 'package:gp/featuers/payment/preasentation/views/paymentscreen.dart';
class Bookdetailsready extends StatelessWidget {
  const Bookdetailsready({
    super.key,
    required this.book,
    required this.index,
  });

  final BookModel book;
  final String index;

  @override
  Widget build(BuildContext context) {
    print('booooook   ${book.ispurchased}');
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8),
          child: book.ispurchased
              ? null
              : BookBotton(onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                      
                       PaymobPaymentPage(bookid: book.id,)
                    
                  ),
                );
              }, name: 'Buy')),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          FavIcon(
            size: 40,
            id: book.id.toString(),
            isloved: book.isfav,
          ),
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: '$index',
              child: SizedBox(
                height: 340.h,
                width: 222.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      book.cover,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            child: Text(
              book.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: color,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            child: Text(
              book.author.name,
              style: TextStyle(
                color: opacitycolor2,
                fontSize: 16.sp,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            child: Text(
              '${book.price} EGP',
              style: TextStyle(
                color: pricecolor,
                fontSize: 16.sp,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 20,
                color: startscolor,
              ),
              Icon(
                Icons.star,
                size: 20,
                color: startscolor,
              ),
              Icon(
                Icons.star,
                size: 20,
                color: startscolor,
              ),
              Icon(
                Icons.star,
                size: 20,
                color: startscolor,
              ),
              Icon(
                Icons.star,
                size: 20,
                color: startscolor,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          book.ispurchased
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BookBotton(
                      onpressed: () {
                         Navigator.pushNamed(context, '/pdf',arguments: book);
                      },
                      name: 'read',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BookBotton(
                      onpressed: () {
                        Navigator.pushNamed(context, '/bookrecord',arguments: book);
                      },
                      name: 'listen',
                    )
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'overview',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: color,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24),
            child: Text(
              'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique',
              maxLines: 4,
              style: TextStyle(
                color: color,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 68,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: book.categories.length,
              itemBuilder: (context, index) {
                return CategoriesItem(
                  category: book.categories[index].name,
                );
              },
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'about the author',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: color,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24),
            child: Text(
              'J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publi cation, Salinger published several short stories in Story magazine',
              maxLines: 4,
              style: TextStyle(
                color: color,
                fontSize: 14.sp,
                height: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'suggestions',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: color,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Suggestedlist(
            book: book,
          )
        ],
      ),
    );
  }
}




/*border: Border(
                top: BorderSide(color: opacitycolor2, width: 1),
                left: BorderSide(color: opacitycolor2, width: 1),
                right: BorderSide(color: opacitycolor2, width: 1),
                bottom: BorderSide(color: opacitycolor2, width: 4), // thicker bottom
              ),*/