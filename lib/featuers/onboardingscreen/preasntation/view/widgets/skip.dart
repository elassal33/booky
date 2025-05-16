import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';


class CustomSkip extends StatelessWidget {
  const CustomSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(onTap: () {
          Navigator.pushNamed(context, '/welcome');
        },child: SizedBox(width: 50.r,height: 50.r,child: Center(child: Text('skip', style: TextStyle(fontSize: 18.sp,color: color),)))),
      ),
    );
  }
}
