import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilecubit.dart';
import 'package:gp/featuers/profile/presentation/manger/editprofilecubit/editeprofilesates.dart';

class ProfileBotton extends StatelessWidget {
  const ProfileBotton({
    super.key,
    required this.onpressed,
    required this.name,
  });

  final void Function()? onpressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditeprofileCubit,EditeProfileStates>(
      builder: (context, state) {
        return OutlinedButton(
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(color),
              side: MaterialStateProperty.all(
                const BorderSide(color: color, width: 1),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(280.w, 40)),
              maximumSize: MaterialStateProperty.all(Size(280.w, 40)),
            ),
            onPressed: onpressed,
            child: state is EditLoading
                ? const Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                  )
                : Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)));
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