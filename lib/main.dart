import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/Layout_screen/view/layout_screen.dart';
import 'package:news/Network/local/cache_helper/cache_helper.dart';
import 'package:news/app_cubit/cubit.dart';
import 'package:news/app_cubit/states.dart';
import 'Layout_screen/cubit/cubit.dart';
//import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? isMode = CacheHelper.getBoolean(key: 'isLight');
  runApp(MyApp(isMode: isMode));
}

class MyApp extends StatelessWidget {
  final bool? isMode;
  const MyApp({super.key, required this.isMode});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewsCubit>(
            create: (context) => NewsCubit()
              ..getBusiness()
              ..getSport()
              ..getScience(),
          ),
          BlocProvider<AppCubit>(
            create: (context) => AppCubit()
              ..toggleThemeMode(
                isShared: isMode,
              ),
          )
        ],
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News',
            theme: ThemeData(
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                primarySwatch: Colors.deepOrange,
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  // backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  actionsIconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                scaffoldBackgroundColor: Colors.white,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  elevation: 30.0,
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                )),
            darkTheme: ThemeData(
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: HexColor('#121212'),
                  elevation: 0,
                  // backwardsCompatibility: false,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  actionsIconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                ),
                scaffoldBackgroundColor: HexColor('#121212'),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.white,
                  backgroundColor: HexColor('#121212'),
                  elevation: 30.0,
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                )),
            themeMode: AppCubit.getInstance(context).isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const Directionality(
              textDirection: TextDirection.ltr,
              child: LayoutScreen(),
            ),
          ),
        ));
  }
}
