import 'package:flutter/material.dart';
import 'package:gp/featuers/profile/presentation/views/faq.dart';

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