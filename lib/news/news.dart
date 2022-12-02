
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/states_news.dart';

import '../../components/components.dart';
import 'cubit_news.dart';
import 'modules/Search.dart';


class News extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>(
      listener:(context , states){} ,
      builder: (context , states){
        var cubit = NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: Text('News App',),
            actions: [
              IconButton(
                  onPressed: (){
                    NavigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: (){
                    NewsCubit.get(context).darkToggle();
                  },
                  icon: Icon(Icons.brightness_4))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){

              },
            child: Icon(
              Icons.edit
            ),
          ),
          body: cubit.screens[cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomitems,
            currentIndex: cubit.CurrentIndex,
            onTap: (index){
        cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
