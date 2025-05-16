import 'package:flutter/material.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';

class Authoritem extends StatelessWidget {
  const Authoritem({
    super.key,required this.author
  });
final Author author;
  @override
  Widget build(BuildContext context) {
    return     Padding(
    
      padding: const EdgeInsets.only(left: 8,right: 8),
    
      child:   Column(children: [
    
      
    
        CircleAvatar(backgroundImage: NetworkImage(author.image),radius: 20,),
    
      
    
        SizedBox(height: 10,),
    
      
    
        Text(author.name,style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.w400),)
    
      
    
      
    
      
    
      ],),
    
    );
  }
}