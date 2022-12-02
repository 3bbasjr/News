
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../cubit_news.dart';
import '../states_news.dart';

class SearchScreen extends StatelessWidget {
var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    onChange: (value){
                      NewsCubit.get(context).getSearchData(value);
                    },
                    type: TextInputType.text,
                    hint_text: 'Search',
                    validate: (String value){
                      if(value.isEmpty){
                        return 'Search must not be empty';
                      }
                      return null!;
                    },
                    perfix_icon:Icons.search),
              ),

              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },

    );
  }
}






// def localProperties = new Properties()
// def localPropertiesFile = rootProject.file('local.properties')
// if (localPropertiesFile.exists()) {
// localPropertiesFile.withReader('UTF-8') { reader ->
// localProperties.load(reader)
// }
// }
//
// def flutterRoot = localProperties.getProperty('flutter.sdk')
// if (flutterRoot == null) {
// throw new GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")
// }
//
// def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
// if (flutterVersionCode == null) {
// flutterVersionCode = '1'
// }
//
// def flutterVersionName = localProperties.getProperty('flutter.versionName')
// if (flutterVersionName == null) {
// flutterVersionName = '1.0'
// }
//
// apply plugin: 'com.android.application'
// apply plugin: 'kotlin-android'
// apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"
//
// android {
// compileSdkVersion flutter.compileSdkVersion
// ndkVersion flutter.ndkVersion
//
// compileOptions {
// sourceCompatibility JavaVersion.VERSION_1_8
// targetCompatibility JavaVersion.VERSION_1_8
// }
//
// kotlinOptions {
// jvmTarget = '1.8'
// }
//
// sourceSets {
// main.java.srcDirs += 'src/main/kotlin'
// }
//
// defaultConfig {
// // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
// applicationId "com.example.first"
// // You can update the following values to match your application needs.
// // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-build-configuration.
// minSdkVersion flutter.minSdkVersion
// targetSdkVersion flutter.targetSdkVersion
// versionCode flutterVersionCode.toInteger()
// versionName flutterVersionName
// }
//
// buildTypes {
// release {
// // TODO: Add your own signing config for the release build.
// // Signing with the debug keys for now, so `flutter run --release` works.
// signingConfig signingConfigs.debug
// }
// }
// }
//
// flutter {
// source '../..'
// }
//
// dependencies {
// implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
// }
//
