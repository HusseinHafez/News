import 'package:flutter/material.dart';
import 'package:news/app_cubit/cubit.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onTapSuffixIcon;
  final String? Function(String? v,)? validator;
  final void Function(String v,)? onChanged;
  final void Function(String v,)? onFieldSubmitted;
  final void Function(String? v,)? onSaved;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  const DefaultTextField({super.key,required this.label,this.prefixIcon,this.suffixIcon,this.onTapSuffixIcon,this.keyboardType,this.controller ,this.validator,this.onChanged,this.onFieldSubmitted,this.onSaved,this.onTap,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
         color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,
      ),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted:onFieldSubmitted ,
      onSaved: onSaved,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration:InputDecoration(
        prefixIcon: Icon(prefixIcon,color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,),
        suffixIcon: GestureDetector(onTap: onTapSuffixIcon,child: Icon(suffixIcon,),),
        labelText: label,
        labelStyle: TextStyle(
          color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,width: 1,)
      ),
        disabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,width: 1,)
      ),
        border:OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,width: 1,)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,width: 1,)
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color:AppCubit.getInstance(context).isLight?Colors.black: Colors.white,width: 1,)
      ),
       ),

    );
  }
}