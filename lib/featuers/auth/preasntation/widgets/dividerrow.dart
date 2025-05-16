import 'package:flutter/material.dart';
import 'package:gp/const.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
                  children: [SizedBox(width: 20,),
                    Expanded(child: Divider(thickness: 2, color: color)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR',style: TextStyle(color: color),),
                    ),
                    Expanded(child: Divider(thickness: 2, color: color)),
                    SizedBox(width: 20,)
                  ],
                );
  }
}