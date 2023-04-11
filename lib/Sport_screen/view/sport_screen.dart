import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Layout_screen/cubit/cubit.dart';
import '../../Layout_screen/cubit/states.dart';
import '../../component/articale_builder.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<NewsCubit,NewsStates>(builder: (context, state) {
     List<dynamic> list=NewsCubit.getInstance(context).sports;
     return ArticaleBuilder(list: list,isSearch: false,);
    }, listener: (context, state) {
      
    },);
}}