import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/component/articale_builder.dart';
import '../../Layout_screen/cubit/cubit.dart';
import '../../Layout_screen/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(builder: (context, state) {
     List<dynamic> list=NewsCubit.getInstance(context).science;
     return ArticaleBuilder(list: list,isSearch: false,);
    }, listener: (context, state) {
      
    },);
  }
}