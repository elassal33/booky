import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/featuers/onboardingscreen/preasntation/view/widgets/dotindicaor.dart';
import 'package:gp/featuers/onboardingscreen/preasntation/view/widgets/next.dart';
import 'package:gp/featuers/onboardingscreen/preasntation/view/widgets/page_view_body.dart';
import 'package:gp/featuers/onboardingscreen/preasntation/view/widgets/skip.dart';


class OnboardingScreen extends StatefulWidget{
    const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   final PageController controller=PageController();

  int currentpage=0;
    void nextPage() {
    if (currentpage < 2) {
      controller.nextPage(
        duration:const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
    else {
      Navigator.pushNamed(context, '/welcome');
    }
  }
  @override
  Widget build(BuildContext context) {

return  Scaffold(
 body:  Column(  
     
       children: [
     
         SizedBox(
          width: 412.w,
          height: 825.h,
           child:  PageView(
            onPageChanged: (value) {
           setState(() {
                currentpage=value;
           });
            },
            controller: controller,
             children:const [ 
           PageViewBody( image: 'assest/images/rafiki.png', text1: 'Read your favourite books',text2: "All your favourites book in one place, read",text3: 'any book, staying at home, on travelling, or',text4:'anywhere else')
         ,  PageViewBody( image: 'assest/images/pana.png', text1: 'Personalized for You',text2: '"Get book suggestions based on your',text3: 'interests and reading habits. We help you',text4:'find your next great read!"')    , 
             PageViewBody( image: 'assest/images/bro.png',text1: ' Fast and Secure Shopping',text2: '"Enjoy a seamless shopping experience, with',text3: ' easy checkout and multiple reading options',text4:'—whether physical or digital.”') , 
            
              ],
            
           ),
         )
     ,Expanded(
       child: Row(children: [ const SizedBox(width: 10,),const CustomSkip(),const Spacer(),
      CustomDotIndicator(isactive:  currentpage==0 ), SizedBox(width: 8.r,)
       ,CustomDotIndicator(isactive: currentpage==1), SizedBox(width: 8.r,),
      CustomDotIndicator(isactive: currentpage==2,),const Spacer()
        , GestureDetector(onTap:nextPage ,child:const CustomNext()),const SizedBox(width: 10,) ], ),
     )
       ],
     
     )
);
  }
}









