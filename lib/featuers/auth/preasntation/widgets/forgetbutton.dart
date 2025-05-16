import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordcubit.dart';
import 'package:gp/featuers/auth/preasntation/manger/forgetpasswordcubit/forgetpasswordstates.dart';

class ForgetButton extends StatelessWidget {
final  void Function()? onPressed;
final String label;
final bool isLoading;
  const ForgetButton({required this.isLoading,
    required this.onPressed,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state is NotFilled,
          child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor:  MaterialStatePropertyAll(state is Filled? color :opacitycolor ),
                side: MaterialStateProperty.all(BorderSide.none),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(370.w, 65.h)),
              ),
              onPressed: onPressed,
              child:isLoading?const Center(child: SizedBox(width: 30,height: 30,child: CircularProgressIndicator(color: Colors.white,)),): Text(label,
                  style:const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
        );
      },
    );
  }
}
/*,Container( width: width*0.9,height: 40,
      decoration: BoxDecoration(border:Border.all(width: 1,color: color),borderRadius: BorderRadius.circular(8) ),
      child:const Center(child:  Text('login' ,style: TextStyle(color: color,fontSize: 16,fontWeight: FontWeight.w700 ),)),
    )
    , const SizedBox(height: 16,)
    ,Container( width: width*0.9,height: 40,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(8) ),
      child:const Center(child:  Text('Sign up' ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700 ),)),
    ),*/