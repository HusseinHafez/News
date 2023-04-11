// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Business_screen/view/business_screen.dart';
import 'package:news/Layout_screen/cubit/states.dart';
import 'package:news/Science_screen/view/science_screen.dart';
import 'package:news/Sport_screen/view/sport_screen.dart';
import '../../Network/remote/dio_helper/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);

  int currentIndex = 0;
  void navBarCurrentIndexChange(int index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());
  }

  List<Widget> navBarScreen = const [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  
  ];
  List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business News',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports News',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science News',
    ),
    
  ];
  
  List<dynamic> business = [];
  void getBusiness() async {
   
    emit(NewsGetBusinessLoadingState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '63a36b09ffad4a5689aedbde2f91a8e9',
    }).then((value) {
      print(value);
     
      emit(NewsGetBusinessSucessState());
      business = value['articles'];
    }).catchError((error) {
     
      emit(NewsGetBusinessErrorState(error: error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> sports = [];
  void getSport() {
    emit(NewsGetSportLoadingState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sport',
      'apiKey': '63a36b09ffad4a5689aedbde2f91a8e9',
    }).then((value) {
      print(value);
      emit(NewsGetSportSucessState());
      sports = value['articles'];
    }).catchError((error) {
      emit(NewsGetSportErrorState(error: error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '63a36b09ffad4a5689aedbde2f91a8e9',
    }).then((value) {
      emit(NewsGetScienceSucessState());
      science = value['articles'];
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error: error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> search = [];
  void getSearch({required String? text}) {
    emit(NewsGetSearchLoadingState());
    DioHelper().getData(url: 'v2/everything', query: {
      'q': '$text' ,
      'apiKey': '63a36b09ffad4a5689aedbde2f91a8e9',
    }).then((value) {
      search = value['articles'];
      print(search);
       emit(NewsGetSearchSucessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error: error.toString()));
      print(error.toString());
    });
  }
}
