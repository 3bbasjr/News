import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../network/local/cache.dart';
import '../news/modules/WebView.dart';
import '../news/states_news.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget defaultButton({
  double width = double.infinity,
  required Color background,
  Function? function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: () {
          function;
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String hint_text,
  required Function validate,
  required IconData perfix_icon,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      onChanged: (s) {
        onChange!(s);
      },
      enabled: isClickable,
      keyboardType: type,
      obscureText: isPassword,
      validator: (s) {
        validate();
      },
      onTap: () {
        onTap!();
      },
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      decoration: InputDecoration(
          focusedBorder: AppStyles.greyOutLineBorder
              .copyWith(borderSide: BorderSide(color: Colors.blue)),
          border: AppStyles.greyOutLineBorder,
          disabledBorder: AppStyles.greyOutLineBorder,
          errorBorder: AppStyles.greyOutLineBorder.copyWith(
            borderSide:   BorderSide(
              color: Colors.red
            )
          )
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 13, color: Colors.grey),
          hintText: hint_text,
          prefixIcon: Icon(perfix_icon)),
    );
Widget buildTask() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            child: Text(
              '2:00 am',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Task title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                '1-april-23',
                style: TextStyle(color: Colors.grey[500], fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        NavigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article['title']}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget articleBuilder(list, context) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.grey,
              width: double.infinity,
            ),
        itemCount: 10),
    fallback: (context) => Center(child: CircularProgressIndicator()));
void NavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
void NavigateandFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

bool isDark = false;

