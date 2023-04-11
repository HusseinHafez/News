import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Layout_screen/cubit/cubit.dart';
import 'package:news/Layout_screen/cubit/states.dart';
import 'package:news/Search_screen/view/search_screen.dart';
import 'package:news/app_cubit/cubit.dart';
import 'package:news/size_config.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  BlocBuilder<NewsCubit, NewsStates>(
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.getInstance(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: AppCubit.getInstance(context).toggleThemeMode,
                  icon: const Icon(Icons.brightness_6_outlined),
                ),
              ],
            ),
            body: cubit.navBarScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) => cubit.navBarCurrentIndexChange(value),
              items: cubit.navBarItems,
            ),
          );
        },
      
    );
  }
}
