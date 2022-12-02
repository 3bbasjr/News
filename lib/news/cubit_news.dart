import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/states_news.dart';
import '../network/local/cache.dart';
import '../network/remote/dio.dart';
import 'modules/business.dart';
import 'modules/science.dart';
import 'modules/sports.dart';


class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() :super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(
        label:'Business' ,
        icon:Icon(
          Icons.business
        ) ),
    BottomNavigationBarItem(
        label:'Science' ,
        icon:Icon(
            Icons.science
        ) ),
    BottomNavigationBarItem(
        label:'Sports' ,
        icon:Icon(
            Icons.sports_basketball
        ) ),

  ];
  List<Widget> screens =[
    Business(),
  Science(),
  Sports(),
  ];
  void changeBottomNavBar(int index){

    CurrentIndex = index;
    if(index ==0)
      getBusinessData();
    if(index ==1)
      getScienceData();
    if(index==2)
      getSportsData();
    emit(NewsBottomState());
  }
  List<dynamic> business = [];
  void getBusinessData(){
    emit(BusinessLoading());
    if(business.length==0){
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country' :'us',
          'category' : 'business',
          'apiKey' : '50dda304c80c493c83b703cfbce673e3',
        },).then((value) {
        // print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[0]['title']);
        emit(Businesssuccess());
      }).catchError((error){
        print(error.toString());
        emit(BusinessError(error.toString()));
      });
    }else{
      emit(Businesssuccess());

    }

  }


  List<dynamic> science = [];
  void getScienceData(){
    emit(ScienceLoading());
    if(science.length==0){
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country' :'us',
          'category' : 'science',
          'apiKey' : '50dda304c80c493c83b703cfbce673e3',
        },).then((value) {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(Sciencesuccess());
      }).catchError((error){
        print(error.toString());
        emit(ScienceError(error.toString()));
      });
    }else{
      emit(Sciencesuccess());

    }

  }


  List<dynamic> sports = [];
  void getSportsData(){
    emit(SportsLoading());

    if(sports.length==0){
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country' :'us',
          'category' : 'sports',
          'apiKey' : '50dda304c80c493c83b703cfbce673e3',
        },).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(Sportsssuccess());
      }).catchError((error){
        print(error.toString());
        emit(SportsError(error.toString()));
      });
    }else{
      emit(Sportsssuccess());

    }

  }

  List<dynamic> search = [];
  void getSearchData(String value){
    emit(SearchLoading());
    DioHelper.getData(
      url: "v2/everything",
      query: {
        'q' : '$value',
        'apiKey' : '50dda304c80c493c83b703cfbce673e3',
      },).then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(Searchsuccess());
    }).catchError((error){
      print(error.toString());
      emit(SearchError(error.toString()));
    });

  }
  bool isDark = false;

  void darkToggle({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(DarkMode());}

    else{
      isDark = !isDark;
      CacheHelper.PutData(key: 'isDark', value: isDark).then((value) {
        emit(DarkMode());

      }); };

  }

}

