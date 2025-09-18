import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';



class BookItem extends StatefulWidget {
  const BookItem({required this.index, super.key, required this.book});
  final String index;
  final BookModel book;

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  @override
  void initState() {
  super.initState();
  
 
}

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 120,
        maxHeight: 215,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 160.h,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Hero(
                tag: widget.index,
                child: Image.network(
                  widget.book.cover,
                  fit: BoxFit.cover,
              
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image,
                        color: Colors.grey);
                  },
                ),
              ),
            ),
          ),
          Text(
            widget.book.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: color,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            widget.book.author.name,
            style: TextStyle(
              color: color.withOpacity(0.5),
              fontSize: 9.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.book.price } Egp",
                style: TextStyle(
                  color: color,
                  fontSize: 11.sp,
                  height: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                "${widget.book.rate}.0",
                style: TextStyle(
                  color: color.withOpacity(0.5),
                  fontSize: 10.sp,
               
                  fontWeight: FontWeight.w400,
                ),
              ),
            const  Icon(Icons.star ,color: startscolor,size: 14,)
                ],
              ),
              /*FavIcon(isloved: widget.book.isfav,
                size: 16,
                id: widget.book.id.toString(),
              ),*/
        const      SizedBox(
                width: 8,
              )
            ],
          )
        ],
      ),
    );
  }
}
