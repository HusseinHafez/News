
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Network/local/cache_helper/cache_helper.dart';
import 'package:news/app_cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit getInstance (BuildContext context)=>BlocProvider.of(context);

  bool isLight=true;

  void toggleThemeMode({bool? isShared}){
    if(isShared !=null){
      isLight =isShared;
      emit(ChangeThemeModeState());
    }else{
       isLight=!isLight;
    CacheHelper.putBoolean(key: 'isLight', value: isLight);
    emit(ChangeThemeModeState());

    }
   
  }
}