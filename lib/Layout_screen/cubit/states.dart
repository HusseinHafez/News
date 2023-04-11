abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsBottomNavBarState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSucessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState({required this.error});
}
class NewsGetSportLoadingState extends NewsStates{}
class NewsGetSportSucessState extends NewsStates{}
class NewsGetSportErrorState extends NewsStates{
    final String error;
  NewsGetSportErrorState({required this.error});
}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSucessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState({required this.error});
}
class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSucessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState({required this.error});
}