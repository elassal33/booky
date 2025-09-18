import 'package:flutter/material.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/home/data/models/bookmodel.dart';
import 'package:gp/featuers/home/data/repo/bookservice.dart';

class Rate extends StatefulWidget {
  const Rate({super.key,required this.book});
final BookModel book;
  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  int selectedRating = 0;
  @override
  Widget build(BuildContext context) {
  return   Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),

                const Text(
                  'Leave a star rating',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        Icons.star,
                        color: index < selectedRating ? startscolor : Colors.grey[300],
                      ),
                      onPressed: () {
                        setState(() {
                          selectedRating = index + 1;
                        });
                      },
                    );
                  }),
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    if (selectedRating!=0) {
                      Bookservice service=Bookservice();
                      service.rate(id:widget.book.id , rate: selectedRating);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('send',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),

          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, size: 20, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}