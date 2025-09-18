import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/profile/presentation/widgers/profilebotton.dart';

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

class FaqTile extends StatefulWidget {
  final FaqItem faq;

  const FaqTile({super.key, required this.faq});

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final List<FaqItem> faqs = [
    FaqItem(
      question: "How can I purchase books from your store?",
      answer:
          "You can purchase books from our store by browsing our collection, selecting the book you want, and adding it to your cart. Once you proceed to checkout, you can choose your preferred payment method and complete the purchase. For e-books, you will receive a download link or access to read within our app.",
    ),
   FaqItem(
    question: "Do I need an account to buy e-books?",
    answer:
        "Yes, you need to create a free Booky account to purchase and access your e-books. This ensures your books are saved securely and can be accessed across all your devices.",
  ),
  FaqItem(
    question: "What payment methods are available?",
    answer:
        "We accept major credit and debit cards, mobile wallets, and other local payment options depending on your region. All transactions are secure and encrypted.",
  ),
  FaqItem(
    question: "Can I read my purchased books on multiple devices?",
    answer:
        "Absolutely! Once you purchase a book, it will be available in your library on any device where you're logged in to your Booky account—mobile, tablet, or web.",
  ),
  FaqItem(
    question: "How does the AI audio reading feature work?",
    answer:
        "Our AI-powered reader converts text into natural-sounding audio, allowing you to listen to your books anytime. Just tap the audio icon on any supported book to start listening.",
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Frequently asked questions",style: TextStyle(color: color),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox( height: 400.h,
              child: ListView(
                children: faqs.map((faq) => FaqTile(faq: faq)).toList(),
              ),
            ),
            const SizedBox(height: 16),
         const   Padding(
              padding:  EdgeInsets.only(left: 16,bottom: 8),
              child: Align(alignment: Alignment.centerLeft,child: Text('Do you have more questions?',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),)),
            )
          ,const  Padding(
            padding: EdgeInsets.only(left: 16,bottom: 8),
            child: Align(alignment: Alignment.centerLeft,child: Text('"Need assistance with your purchase? Our support team is here to help with payments, orders, and more',style: TextStyle(fontSize: 10,fontWeight:FontWeight.w500),)),
          )
          ,SizedBox(height: 16.h,)
         , ProfileBotton(onpressed: (){
            Navigator.pushNamed(context, '/contact us');
          }, name: 'shoot a Direct Mail')
          ],
        ),
      ),
    );
  }
}

class _FaqTileState extends State<FaqTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      constraints: BoxConstraints(
        minHeight: isExpanded ? 60 : 37,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card( color: Colors.white,
        elevation: 1,
        margin: EdgeInsets.zero, // Remove default card margins
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect( // Add this to clip the borders
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent), // Force transparent border
            ),
            child: ExpansionTile(
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpanded = expanded;
                });
              },
              tilePadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              title: Text(
                widget.faq.question,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                isExpanded ? Icons.remove : Icons.add,
                color: const Color.fromRGBO(10, 57, 129, 1),
                size: 25,
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent), // Remove child borders
                  ),
                  child: Text(
                    widget.faq.answer,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}