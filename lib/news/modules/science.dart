
import '../../components/components.dart';
import '../cubit_news.dart';
import '../states_news.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Science extends StatelessWidget {

  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).science;
        return articleBuilder(list, context);
      },
    );
  }
}
