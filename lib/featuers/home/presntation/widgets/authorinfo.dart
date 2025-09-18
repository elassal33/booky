import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({
    super.key,required this.author
  });
final Author author;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SizedBox( height: 130.h,width: 380.w,
            child: Row(
              children: [
               Hero(tag: '${author.id} ${author.name}',child: CircleAvatar(backgroundImage: NetworkImage(author.image),radius: 50,)),
             const   SizedBox(width: 10,)
                ,Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                author.name,overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                
                                style: TextStyle(color: Colors.black,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          
                   const   SizedBox(height: 20,)
                              
                               , Padding(
                                 padding: const EdgeInsets.only(left: 8),
                                 child: Text(
                                  'Author',
                                  style: TextStyle(color:color ,
                                                   fontSize: 16.sp,
                                                   height: 1,
                                                   fontWeight: FontWeight.w500,
                                  ),
                                                               ),
                               ),
                  ],),
                )
              ],
            ),
          ),
        )
        ,const SizedBox(height: 30,)
       , Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
                'about the author',overflow: TextOverflow.ellipsis,
                maxLines: 2,
                
                style: TextStyle(color: color,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 24),
          child: Text(
                 author.bio,
               maxLines: 4,  style: TextStyle(color:color ,
                   fontSize: 14.sp,
                   height: 2,
                   fontWeight: FontWeight.w500,
                 ),
               ),
        ),
      ],
    );
  }
}