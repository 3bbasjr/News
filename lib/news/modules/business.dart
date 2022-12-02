import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../cubit_news.dart';
import '../states_news.dart';

  class Business extends StatelessWidget {

    Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context,state){},
        builder: (context,state){
      var list = NewsCubit.get(context).business;
      return articleBuilder(list, context);
        },
      );
    }
  }
