import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/featuers/onboardingscreen/preasntation/view/widgets/dotindicaor.dart';
import 'package:gp/featuers/home/presntation/widgets/exploreitem.dart';

class Explore extends StatefulWidget {
  const Explore({
    super.key,
  });

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
   final PageController controller=PageController();
    int currentpage=0;
    void nextPage() {
    if (currentpage < 2) {
      controller.nextPage(
        duration:const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  
  }
  @override
  Widget build(BuildContext context) {

    return  SliverToBoxAdapter(child: Align(alignment: Alignment.center,
      child: Column(
        children: [
         SizedBox( height:150 ,width: 386,
           child: PageView( clipBehavior: Clip.none,
              onPageChanged: (value) {
             setState(() {
                  currentpage=value;
             });
              },
              controller: controller,
               children:const [ 
         Exploreitem(text: '"Step into a world of endless stories. Explore, immerse, and enjoy seamless reading anytime,anywhere"',) ,
         Exploreitem(text: '"Uncover hidden gems and bestsellers all in one place. Reading made simple, smart, and satisfying."') ,
         Exploreitem(text: '"From classics to the latest releases—Booky brings the joy of reading to your fingertips."') ,
              
                ],
              
             ),
         ),
        const SizedBox(height: 20,),
         Row(children: [ const Spacer(),
      CustomDotIndicator(isactive:  currentpage==0 ), SizedBox(width: 8.r,)
       ,CustomDotIndicator(isactive: currentpage==1), SizedBox(width: 8.r,),
      CustomDotIndicator(isactive: currentpage==2,),const Spacer()
        ,  ], ),
        ],
      ),
    ),);
  }
}



/*PageView(
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
            
           ),*/